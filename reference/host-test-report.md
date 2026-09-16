# CKP02 基準作業報告參考

保存為 host-lab/test-report.md。先填本次 owner、job 名稱、job ID、時間、實際 JCL 與下載資料夾。工作區根目錄的 JOB 資料夾也可直接讀，不必搬到預設目錄。以下是預期與判讀範例，未附學員 log，所有「實際結果」待填。

## 步驟核對

以同一 job 的 JESYSMSG／IEF142I 對照：ALLOC、CGEN、LGENCKP、CCKP、LCKP02、CCHK、LCHKCKP、GENERATE、SNAP1、RUNONCE、CHECK1、SNAP2、RUNTWICE、CHECK2、RUNEMPTY，共 15 步。逐步列出 RC、DD／訊息位置與結論；未執行或缺件不算通過。

原版 CCKP 可能 RC 4，其餘 14 步預期 RC 0。需讀完整 CCKP/SYSPRINT 的全部診斷，核對 IGYLI0090-W、IGYSC0205-W、IGYCB7310-W 及實際原文。序號檢查與控制流程等原因應對回程式或選項；IGYSC0205-W 是摘要提醒，不能當成獨立根因。實際出現哪些訊息由本次清單決定，不能照抄為已出現。

| 項目 | 預期與判讀 | 本次結果 |
|---|---|---|
| GENERATE | 七筆虛構中文資料；PRINTDD 每筆完整 400 bytes，外加雙引號 | 待填 |
| CHECK1 | CASE 0001–0007 各 PASS ALL 400 BYTES；CHECKED=0007 ERRORS=0000 | 待填訊息位置 |
| CHECK2 | 同樣七筆通過；BEFORE-ID 對應第一次 ACTUAL-ID | 待填訊息位置 |
| RUNEMPTY | 步驟確實執行且 RC 0，與資料中的 EOF 標記分開 | 待填 JES 證據 |

## 如何解釋資料

CASE 0004 的預期為 "0000123456" → "00123456  " → "123456    "，第二次 BEFORE-ID 應是第一次結果。這裡是推導，需用本次 SNAP2／CHECK2 訊息確認。CASE 0003 第 14–16 bytes 為 EOF，所以略過轉換但仍回寫；CASE 0005 的 EOF 在相鄰位置，不符合該判斷。其餘 11–400 bytes 是否保留須依完整比對，不只看 ID。

## 證據限制

中文 PRINTDD 依課程以 tcb-rse／IBM-1371 開啟、載入完整內容並另存 UTF-8；全部下載若已錯誤轉碼，不能只換本機開啟編碼。中文畫面欄數不是 byte 位置。舊 job 沒有 SNAP 或 BEFORE-ID 時如實列為舊版缺證，不補造。

建議結論寫法：「本次已取得的紀錄支持……；尚缺……，因此……仍待確認。」只能在 15 步及比對證據齊全後宣稱基準完成。這項作業不是 IMS 交易，也不是新增預覽或 CKP02H 的驗證。
