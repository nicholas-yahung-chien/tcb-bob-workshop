# IMSCKP 獨立來源驗證

2026-09-16，v1.9.14。這是維護證據，不納入學員 ZIP。

將先前 IMSRUN 內嵌的 165 行 COBOL 原樣移至 z-tests/IMSCKP.cbl；逐行確認內容相同，僅統一 LF 換行。IMSRUN 的唯一邏輯差異是 CIMS/SYSIN 改讀 `&SYSUID..TCBLAB.COBOL(IMSCKP)`，移除內嵌來源及其結束標記。DBD、PSB、編譯選項、IMS 呼叫、資料布局、作業步驟與測試預期值均未改變。

22 個學員帳號與 3 個講師帳號均已新增 COBOL(IMSCKP)，並更新 JCL(IMSRUN)。更新前核對舊版內容、保留舊 JCL；更新後以 tcb-rse／IBM-1371 讀回兩個成員，逐行核對教材內容。原 RUN、CKP02、GENCKP、CHKCKP 與共享 IMS 設定未變動。

| 帳號 | 作業 | 新版驗證 |
|---|---|---|
| TCBINS1 | JOB01108 | 26 步執行；CCKP RC4，其餘25步 RC0；CIMS 無警告 |
| TCB2101 | JOB01109 | 26 步執行；CCKP RC4，其餘25步 RC0；CIMS 無警告 |

兩項作業均由遠端 IMSRUN 直接提交。確認 CIMS 編譯獨立成員，BASECHK、CHKFILE、ROLLBACK、UPDATE、VERIFY 的七筆完整 400-byte 資料比對通過，ROLB 與 CHKP 狀態為空白，DFSERA10 的 PROLLBAC、PUPDATE 正常結束。

新版全部25帳號已完成來源及 JCL 讀回核對；新版執行驗證涵蓋上列兩個帳號，沒有把前一版全部帳號的執行結果當作本版重跑結果，也未做全班並行測試。證據保存在維護工作區 `.work/ims-split/`，包含各帳號舊 JCL、pilot-ready.json、rollout-ready.json、TCBINS1.json、TCB2101.json 與兩項作業紀錄。

教材新增一份 IMSCKP.cbl，移除 JCL 中的重複來源，合計86份必要材料。原始碼成員持續保留於遠端 COBOL 資料集；執行時仍使用作業專用的暫存程式庫與 IMS 資料庫。
