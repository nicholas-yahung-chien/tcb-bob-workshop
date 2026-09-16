# IMSRUN 執行報告參考

保存為 host-lab/ims/test-report.md，依 IMS-LAB.md 與實際 IMSRUN JCL 核對。填入自己的 owner、job ID、紀錄路徑；下表為驗證目標，尚無本次實測結果。

| Step | 核對重點 |
|---|---|
| GENERATE、DBLOAD | 產生七筆中文合成資料；ISRT 載入本作業的 IMS 資料庫。 |
| EXPORT、BASECHK | GU 匯出為循序檔；轉換前完整 400-byte 比對無誤。 |
| CONVERT、CHKFILE | 執行原版 CKP02，CHKCKP 比對七筆轉換結果。 |
| ROLLBACK | GHU／REPL 後 ROLB，再 GU 比較整個 payload 是否回到更新前。 |
| UPDATE、VERIFY | 重新 REPL、CHKP，再由另一個 IMS 步驟 GU 核對完整結果。 |
| PROLLBAC、PUPDATE | DFSERA10 讀 IEFRDER 的真實日誌；核對 DFS707I、DFS708I、DFS703I 與正常結束。 |

還需依實際 JCL 核對配置、組譯、編譯及連結等全部步驟，不能把此業務重點表當成完整清單。CCKP RC 4 依其清單追因；其他執行及比對預期 RC 0。每項結論附 step、DD、訊息與位置，不能沿用其他 job 的成功結果。

CASE 0001 的預期回復例：BEFORE-ID="0012345678"、TARGET-ID="12345678  "、AFTER-ROLB-ID="0012345678"。ID 是摘要，仍需整個 400 bytes 的比對證據；重新建庫不能算作 ROLB 成功。

CKP02 仍處理循序檔；IMSCKP 負責 IMS 載入、匯出、更新及核對。SYSOUT 的 APPLICATION DIAGNOSTIC 是應用程式輸出，JES／DFS 為系統執行訊息，DFSERA10 為 IMS 二進位日誌的列印，三者分開引用。

每次完整提交都重新建立作業私有資料庫並載入七筆原始資料，可重複練習。暫存庫與資料在 job 結束清除，不是逐筆 DLET，也不修改共享資料庫。此練習沒有驗證 IMS TM、帶更新的強制中止回復或災難復原。學員本次結果仍待上述紀錄確認。
