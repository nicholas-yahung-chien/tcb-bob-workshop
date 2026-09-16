# IMS DB 批次延伸練習：主機驗證

日期：2026-09-16。這是維護證據，不預設提供學員作為答案。

## 環境確認

唯讀查詢確認 VS01 的 IMS15CR1／STC00624 活動、IMSID IVP1，既有 DB 與 BMP 清單可取得；但沒有 workshop 專用線上資料庫／PSB。因此採獨立 DL/I DB batch，沒有更新 IVP1 的共享資料庫、ACB、RACF、RECON 或 region 設定。既有 library 路徑的 V15R1M0 字樣不當成精確執行版號證據。

## 最終版本驗證

| 帳號 | 作業 | 結果 |
| --- | --- | --- |
| TCBINS1 | TCBIMSP／JOB01053 | 26 個步驟有實際 IEF142I；只有原 CKP02 的 CCKP 編譯 RC0004，其餘 25 個步驟 RC0000。 |
| TCB2101 | TCBIMSP／JOB01054 | 同上；使用可攜版 JCL 的 `&SYSUID` 取個人程式庫，確認學生帳號可組譯／編譯、配置暫存庫、執行 IMS 與日誌列印。 |

證據保存在維護工作區 `.work/ims-extension/JOB01053/` 與 `JOB01054/`，機器檢查摘要在 `.work/ims-extension/validation.json`，不納入學員 ZIP。可攜版 `z-tests/ims-run.jcl` 的 SHA-256 為 `20bcd3c007f4f3dbd5733c925949cf20b5ee762ec1ff9f3888e22b3461ad1a13`，JOB01054 實際提交此版本；JOB01053 僅將來源資料集的 `&SYSUID` 展開為 TCBINS1。其他學員帳號未逐一執行，不宣稱已完成全班並行驗證。

兩次均確認：

- A0/B0、A1/B1、A2/B2 產生並連結 DBD／兩個 PSB，RC0；CIMS／LIMS 產生 IMSCKP，RC0。
- DBLOAD 真正以 ISRT 載入七筆；EXPORT GU 產生 400-byte 檔；BASECHK 重新 GU 比較原始資料，CHECKED=0007 ERRORS=0000。
- CONVERT 執行既有 CKP02；CHKFILE 對課程預期結果，每筆 PASS ALL 400 BYTES，CHECKED=0007 ERRORS=0000。
- ROLLBACK 逐筆 GHU／REPL 後 ROLB，再 GU 比對全部 400 bytes 與更新前一致。CASE0001 可看到 0012345678 → 12345678加兩空白 → 回復0012345678。
- UPDATE 的 CHKP STATUS 為空白；JESMSGLG 有 DFS681I、PSB TCBCKPU、checkpoint ID TCBCOM01。VERIFY 在另一個 IMS 執行步驟重新查詢，比對全部七筆400 bytes與轉換檔一致。
- PROLLBAC／PUPDATE 由 IBM DFSERA10 直接讀前述 IEFRDER 真實系統日誌，輸出十六進位列印；DFS707I、DFS708I、DFS703I 正常完成。

## 交付與限制

最小教材只有兩檔：ims-run.jcl → z-tests/ims-run.jcl；IMS-LAB.md → host-lab/IMS-LAB.md。新增 COBOL、DBD、PSB 內嵌在 JCL，維護用 build.py、IMSCKP.cbl、組譯來源、調試失敗作業及本報告不包進學員教材。

所有 DB／PSB／程式庫與 IEFRDER 均為 job-private temporary datasets，隨作業清除；保留的是 JES 上的實際執行及 DFSERA10 列印。重跑由原始七筆重建，沒有持久資料庫或正式災難復原能力。IMS 系統日誌與應用 SYSOUT 明確分開，沒有把診斷文字改名為系統日誌。

已驗證的回復為程式主動取消更新的 ROLB，不是 ABEND、主機故障、線上交易、XRST 或事故復原。輸入／輸出檔案狀態、模式、恰好七筆及錯誤路徑已有檢查；UPDATE 的 CHKP 非空白會進 fail-run 嘗試 ROLB 並回 RC12，而非正常結束。未刻意注入每一種錯誤，不能宣稱這些錯誤分支全部實測。

開發過程 JOB01039–01052 包含調試及中間版；最終驗收只採上列 JOB01053／01054。先前新增 fail-run 時曾遇到 PERFORM 不返回警告，已改成明確 GO TO fail-run；最終 CIMS RC0000。

官方依據：[IBM 批次 ROLL／ROLB](https://www.ibm.com/docs/en/ims/15.5.0?topic=rdmdi-backing-out-database-updates-dynamically-roll-rolb-commands)、[DFSERA10](https://www.ibm.com/docs/en/ims/15.5.0?topic=reports-file-select-formatting-print-utility-dfsera10)。
