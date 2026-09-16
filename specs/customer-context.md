# 合庫素材背景摘要

此頁彙整各程式的用途、相依項目與需要補充的資料。

| 素材 | 有證據的用途 | 缺件／限制 |
|---|---|---|
| CKP02 | COBOL 400-byte 記錄；首兩碼條件與資料內EOF排除；所有讀入記錄均經REWRITE | 課程已備妥 JCL、合成測資及編譯設定；本次執行需自己的 job 紀錄。生產 JCL 與資料另待提供 |
| CIS14 + copybooks | COBOL/IMS資料加工；輸入300字元、分行表80、輸出917/1109；GU/GNP、姓名地址整理 | CBLTDLI runtime、XIDCHK、BRHIDCNV、PSB/DBD、實際資料未提供 |
| STANCVT | HLASM七位十六進位序號遞增；FFFFFFF回0000001；改寫OLDSTAN後複製NEWSTAN | 呼叫端與並行控制未提供；未見完整非法輸入檢查 |
| SYSOCP31 | HLASM輸出訊息流程、編碼轉換、IMS呼叫與錯誤處理 | 尚需補齊多份 COPY 與外部程式，才能準備完整執行環境 |

這些是獨立提供的素材。沒有證據證明 CKP02→CIS14→SYSOCP31→STANCVT 為同一呼叫鏈。
客戶提供的來源中沒有 Java 原始碼、SQL schema、API 規格、正式 JCL、正式環境的 IMS log 或 Fortify/Checkmarx 報告。第 04 單元可另外執行教學用 IMS 資料庫作業並取得真實日誌，但它不代表客戶正式環境的資料庫結構或執行結果。

深讀 CIS14 時，要特別區分 PROCESS-OK 與 PGM-OK；某筆查無客戶不必然代表不輸出。日期程式的年月日範圍檢查也不等於完整曆法驗證。可以先把這些情況列為測試案例，再根據結果討論是否需要修改。
