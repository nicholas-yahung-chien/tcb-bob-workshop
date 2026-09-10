# TRAIN-SQL-001 修正說明

這份練習報告位於 `samples/reports/sast.json`，使用合成的弱點資料。`samples/python/customer_lookup.py` 第 5 行把 customer_id 接進 SQL，第 6 行送入 execute，因此輸入值可能改變 WHERE 條件（CWE-89）。

修正後的 `output/customer_lookup.py` 使用 SQLite 的 `?` 佔位符，將查詢值另外放進參數 tuple。函式介面保持相同，也能處理原本就含有單引號的合法資料。

執行 `python scripts/verify.py sast` 可以檢查正常查詢、未知值、單引號、注入輸入、資料表是否仍存在，以及參數綁定。實際執行日期與結果請記錄在自己的報告中。
