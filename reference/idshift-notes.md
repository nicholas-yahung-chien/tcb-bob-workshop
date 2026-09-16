# IDSHIFT 延伸閱讀參考

這是第 02／03 單元的選做對照，不是需求單中新寫的程式。CKP02 直接在 FD 定義資料，會 OPEN、READ、REWRITE、CLOSE；IDSHIFT 以 IDREC.cpy 定義傳入的記憶體記錄，由呼叫者管理檔案。

閱讀 samples/cobol/IDSHIFT.cbl、IDREC.cpy、TESTSHIFT.cbl 及 samples/jcl/IDSHIFT.jcl，逐一核對 COPY 與 CALL。JCL 的執行對象是 TESTSHIFT；不能將此骨架當成原版 RUN 或客戶正式作業。

新增測試可比較前綴不同、EOF 在第 14–16 位與相鄰位置、其他 390 bytes 保留、連續轉換兩次及空白 ID。每例寫明完整輸入、預期輸出與比對方式；來源未編譯執行時標記待執行。既有 normalizer Python 測試不證明 COBOL 測試已通過。本文提供分析方向，不提供冒充學員已完成的 TESTSHIFT-EXT.cbl。
