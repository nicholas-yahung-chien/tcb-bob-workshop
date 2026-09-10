# 素材地圖與使用範圍

主要分析素材是 `bank-source/reading/` 的合庫原始程式閱讀版。`bank-source/raw/` 保留45份TXT原始位元組，`manifest.json`記錄SHA-256、編碼與行數。SYSOCP31含無法以CP950解碼的bytes，閱讀版明示為反斜線x序列，不猜測其字義。閱讀版可供AI分析，不能替代主機編譯來源。

`samples/` 為另外編寫的合成教材，用於可在筆電執行的實作，**不是合庫完整系統**。學員由來源理解走到規格與行為模型，並明確區分兩者。

| 路徑 | 角色 |
|---|---|
| samples/cobol/IDSHIFT.cbl | 固定格式 COBOL 子程式：400 bytes 記錄的識別欄位轉換；無檔案 I/O |
| samples/cobol/IDREC.cpy | 10 + 1 + 389 bytes；REDEFINES 不重複占空間 |
| samples/cobol/TESTSHIFT.cbl | 合成 COBOL 測試 driver；需另備編譯器，預設不執行 |
| samples/jcl/IDSHIFT.jcl | JCL 骨架，含佔位符；不可直接提交主機 |
| samples/python/normalizer.py | 尚未實作的 Python 行為模型，輸出到 output/ 後實作 |
| samples/python/customer_lookup.py | 含刻意 SQL 注入缺陷的本機 SQLite 教學函式 |
| samples/logs/ims-events.csv | 合成的「已轉譯事件摘要」，不是原始 IMS binary log |
| samples/reports/sast.json | 合成 finding，非 Fortify/Checkmarx 真實掃描結果 |
| specs/change-request.md | 本次假設的新需求，不代表合庫已核定需求 |
| specs/customer-context.md | 合庫提供素材的人工摘要與缺件邊界 |


`prompts/01-ask.md`與`04-document.md`主要分析CKP02；`06-customer-analysis.md`延伸CIS14。測試模型的驗收固定使用合成bytes，不能將合成預期答案套到整套合庫系統。CKP02有逐筆REWRITE；IDSHIFT子程式沒有。
