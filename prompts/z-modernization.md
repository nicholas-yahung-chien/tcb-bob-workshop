請讀AGENTS.md、bank-source/reading/CKP02.TXT、samples/cobol/IDSHIFT.cbl、samples/cobol/IDREC.cpy與specs/change-request.md。
以Z Architecture分析CKP02的現代化選項，先保留既有業務語意，分別比較：保留COBOL批次並增加驗證／回復措施、抽出轉換邏輯、以API包裝新增功能。
每個選項列出適用情境、需補充的JCL／資料集／編碼／呼叫端資訊、測試策略、回復方法與風險。區分目前有程式證據的功能和提案，不宣稱已存在Java服務、API或資料庫實作。
只提出計畫，不改原始碼、不建立服務、不連線主機。說明如何以相同測資比較轉換結果、重跑行為及檔案I/O，將尚無執行證據的項目標為待驗證。
