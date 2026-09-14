# 查詢程式修補

`samples/reports/sast.json` 是 SQL 注入的練習報告，對應 `samples/python/customer_lookup.py`。資料使用本機 SQLite；正式 Fortify 或 Checkmarx 掃描報告可用相同方式追蹤問題位置。

## 要完成的內容

- `output/customer_lookup.py`：修正查詢，介面保留 lookup(connection, customer_id)。以參數綁定處理查詢值，讓合法單引號也能正常查詢。
- `output/sast-remediation.md`：問題編號、來源行號、原因、修正內容、測試結果及待確認事項。

先建立報告，尚未執行的測試填「待執行」，在教材根目錄執行 `python -m unittest discover -s tests -p test_lookup.py -v`，確認實際執行 6 個測試且成功，零個測試不能算通過。Windows 若只有 py 指令，使用 py -3。六個測試涵蓋正常查詢、不存在的 ID、合法單引號、注入字串、資料表保留及參數綁定。

完成後更新實際結果；若有失敗，修正 output 再測。原始範例與 tests 保留。報告聚焦這份 SQLite 程式；正式工具複掃另列為後續工作。
