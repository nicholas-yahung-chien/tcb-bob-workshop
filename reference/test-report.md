# Python 選做測試報告參考

本檔只對應第 03 單元的 Python 選做，不是 CKP02 主機或第 05 單元報告。實作為 output/normalizer.py，新增案例為 output/test_authored.py；依 specs/testing.md 執行標準庫 unittest，不使用教材未提供的 scripts/verify.py。

```text
python -m unittest discover -s tests -p test_normalizer.py -v
python -m unittest discover -s output -p test_authored.py -v
```

記錄實際日期、Python 版本、兩項命令的輸出與測試數。第一組預期 11 項，第二組至少 3 項；零項不是成功。本參考未附你的執行輸出，結果先填「待執行」。

新增案例核對：保留指定欄位以外的內容、遇資料內 EOF 仍處理下一筆、預覽不改動呼叫端資料。失敗後記錄修正與重測；不能更改 tests 的預期來通過。

此模型使用 ASCII bytes，不驗證 IBM-937 中文、COBOL 檔案狀態、REWRITE 或 IMS。模型中的 written 是異動筆數，不是原版的實體回寫次數。
