請讀AGENTS.md、samples/reports/sast.json、samples/python/customer_lookup.py和tests/test_lookup.py。
使用Agent核對finding的source到sink；在output/customer_lookup.py修補SQL注入，介面仍為lookup(connection,customer_id)，以參數綁定處理值，不採字元刪除或手動跳脫。
執行 python scripts/verify.py sast，失敗則修正output/後再測，不改tests/。
建立output/sast-remediation.md：finding ID、原始檔案行號、成因、修改、實際測試結果、剩餘風險、待正式SAST工具複掃。
本題是SQLite合成範例與教學finding，不能宣稱修好了合庫COBOL或已經Fortify/Checkmarx複掃。只寫output/。
