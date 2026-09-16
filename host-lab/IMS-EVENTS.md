# 真實 IMS 事件練習

本練習使用 IMS DB 的 DL/I 批次環境，練習父子區段查詢、重複新增後回復、受控中止與耗時判讀。不是 IMS TM 線上交易，也不是 CKP02 預覽功能。請從這次作業的輸出觀察各個情境。

## 已備妥的材料

- 本機 `z-tests/IMSEVT.cbl` 與遠端 `<自己的帳號>.TCBLAB.COBOL(IMSEVT)` 是同一份來源。
- 本機 `z-tests/imsevts.jcl` 與遠端 `<自己的帳號>.TCBLAB.JCL(IMSEVTS)` 對應；透過 `&SYSUID` 使用提交者的來源成員。
- 使用 `tcb-rse`、IBM-1371 開啟與提交。學員不需要產生或上傳程式。
- 這是獨立作業，不修改 RUN、IMSRUN、IMSCKP 或原版 CKP02。可以直接提交，不依賴前一項作業保留的資料。

## 資料與重跑

JCL 內定義 `TCBEVDB`、`TCBEVPL` 與 `TCBEVPU`，每次作業建立自己的 DBD、PSB、載入程式庫與 `&&EVTDB`。父區段 EVROOT 是固定鍵值 4 bytes 加 400-byte payload；子區段 EVCHILD 是固定鍵值 4 bytes 加 16-byte 明細。

測資是一筆虛構客戶及一筆測試明細，使用英數字元，目的是觀察 IMS 操作，不代表客戶的正式資料庫設計。這份程式不執行 CKP02；400-byte payload 用於檢查回復前後完整內容。

完整重新提交會重新建立資料，因此可重複練習。資料庫在 CUT 異常終止後保留給 CHECKA 查詢，作業結束才由 z/OS 清除；不是逐筆 DLET。作業結束後不能對已刪除的暫存資料庫再查詢，也不能用中途 RESTART 取代完整重跑。

## 執行與核對

先在課程網頁複製問題，讓 Bob 閱讀本指引、程式與 JCL。再從 Zowe Explorer 開啟自己資料集的 IMSEVTS，右鍵 Submit Job，記下 job ID。

**此作業刻意以 U3001 結束 CUT 步驟，Zowe 顯示 ABEND／U3001 是練習的一部分。不要只看整項作業狀態判定成功或失敗，也不要把其他異常一律視為預期。**

| Step | 實際操作與核對目標 |
|---|---|
| ALLOC、A0/B0、A1/B1、A2/B2、CIMS/LIMS | 建立私有資源、編譯與連結；均須 RC 0 |
| DBLOAD | 真正 ISRT 一筆父區段及一筆子區段；RC 0 |
| NORMAL | GU 父區段、GNP 取得明細、再次 GNP 得到 GE；正常結束且 RC 0 |
| DUP | GHU／REPL 更新父區段，再 GU 確認未提交的新值；重複 ISRT 子區段得到 II，ROLB 後重新查詢與完整比對；RC 0 表示測試符合預期，業務新增仍被拒絕 |
| CHECKB | 另一個 IMS 執行步驟重新核對父區段全部 400 bytes、子區段內容與數量；RC 0 |
| DELAY | 在 GU 前透過 CEE3DLY 請求等待兩秒，分別量測等待、GU 及案例開始至 GU 結束的時間；RC 0 |
| PDUP | DFSERA10 列印 DUP 的實際 IMS 二進位日誌；核對正常完成與 RC 0 |
| CUT | GU 成功後，以 CEE3ABD 主動觸發 U3001；不更新資料，不會印出 END MODE=CUT |
| CHECKA | 只有 CUT 的 ABENDCC 為 U3001 才執行，獨立查詢確認資料不變；須 RC 0 |

合計 17 個執行步驟：16 個 RC 0，CUT 為 U3001。任一步驟缺少紀錄或未執行都列為待確認。程式遇到非預期狀態回傳 RC 12，不能以測試需要為由忽略。

## 先看部分證據，再補齊

先只開啟 CUT 的 SYSOUT，載入完整內容後另存 UTF-8。讓 Bob 說明讀取有無成功、是否看得到正常結束，以及還要查什麼。程式印出的「準備觸發 U3001」只表達執行意圖，仍須用 JES 確認實際終止碼。

接著提供同一 job ID 的 JESMSGLG、JESYSMSG、JESJCL、CHECKA／SYSOUT，以及其他情境的紀錄。由 IEF472I 的 USER=3001 確認實際中止，再由 CHECKA 確認資料狀態。補齊紀錄後，再更新報告中原先尚未確定的判斷。

## 耗時與證據範圍

欄位說明見 `specs/log-schema.md`。時間取自主機 CURRENT-DATE，表示到百分之一秒，換算為毫秒；10 ms 的量測刻度不代表精準效能分析。GU-MS 為 0 表示本次未量到一個完整刻度，不能解讀為呼叫完全不耗時。時鐘不是單調時鐘，倒退時程式會報錯；結果只供本練習觀察。

WAIT-MS 是實際等待服務前後的時間，PRE-GU-MS 還包含 GU 前的程式處理與輸出。CEE3DLY 不是精密計時服務，因此不要要求恰好 2000 ms。CASE-TO-GU-END-MS 不包含 GU 後的報表輸出，更不是整項 job 的時間。不要將這個案例寫成 IMS 鎖定、網路故障或 GU 故意睡兩秒。

APPLICATION DIAGNOSTIC、OP、BUSINESS、HARNESS 與計時欄位都是應用程式輸出；PCB-STATUS 是從實際 DL/I 呼叫取得。JES／DFS 訊息和 PDUP 的 IMS 日誌列印需分開標示。OP 只在單一步驟內遞增，必須連同 job ID、step、DD 與行號引用，不能當成 IMS 原生交易 ID。

分析保存為 `host-lab/ims/events-report.md`。記下自己的 job ID 與對應訊息，方便查閱。此練習沒有驗證帶更新的異常終止自動回復、外部系統補償或線上交易復原。
