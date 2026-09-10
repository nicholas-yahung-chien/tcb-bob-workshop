# 合庫素材背景摘要

此頁彙整各程式的用途、相依項目與需要補充的資料。

| 素材 | 有證據的用途 | 缺件／限制 |
|---|---|---|
| CKP02 | COBOL 400字元檔案；首兩碼條件與資料內EOF排除；所有讀入記錄均經REWRITE | 缺正式JCL、測資、編譯選項與執行紀錄 |
| CIS14 + copybooks | COBOL/IMS資料加工；輸入300字元、分行表80、輸出917/1109；GU/GNP、姓名地址整理 | CBLTDLI runtime、XIDCHK、BRHIDCNV、PSB/DBD、實際資料未提供 |
| STANCVT | HLASM七位十六進位序號遞增；FFFFFFF回0000001；改寫OLDSTAN後複製NEWSTAN | 呼叫端与並行控制未提供；未見完整非法輸入檢查 |
| SYSOCP31 | HLASM輸出訊息流程、編碼轉換、IMS呼叫與錯誤處理 | 多份COPY及外部程式缺少；不可宣稱筆電上可完整執行 |

這些是獨立提供的素材。沒有證據證明 CKP02→CIS14→SYSOCP31→STANCVT 為同一呼叫鏈。
目前沒有 Java 原始碼、SQL schema、API規格、正式JCL、真實IMS log或Fortify/Checkmarx報告。

深讀 CIS14 時，要特別區分 PROCESS-OK 與 PGM-OK；某筆查無客戶不必然代表不輸出。日期程式的年月日範圍檢查也不等於完整曆法驗證。這些是查證題，不是直接要求修改的缺陷判定。
