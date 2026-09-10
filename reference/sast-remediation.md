# TRAIN-SQL-001 修補參考

教學finding來自samples/reports/sast.json，非Fortify/Checkmarx真實掃描。samples/python/customer_lookup.py第5行把customer_id拼入SQL，第6行送入execute；不可信輸入可改變WHERE條件（CWE-89）。

output/customer_lookup.py採SQLite的?佔位符及獨立參數tuple，保留原介面及合法單引號輸入，不用刪除引號等方式掩蓋問題。驗收命令為python scripts/verify.py sast，涵蓋正常查詢、未知值、單引號、注入、表仍存在及參數綁定契約。

參考答案的實際驗證結果請看verification/report.md；本模板不表示學員版本已通過。剩餘範圍包括正式driver差異、權限、資料最小化與正式SAST複掃。這不是合庫COBOL修補，也未宣稱真實工具複掃完成。
