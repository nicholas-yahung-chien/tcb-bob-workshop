# 測試規格

先閱讀 `specs/change-request.md` 的轉換規則和測試資料。這裡分成 COBOL 測試程式，以及可以在本機執行的 Python 範例。

## COBOL 測試

參考 `samples/cobol/IDSHIFT.cbl`、`IDREC.cpy` 和 `TESTSHIFT.cbl`。

- `output/cobol-test-plan.md`：列出輸入、完整預期記錄、判定方式，以及需要的編譯和執行環境。
- `output/TESTSHIFT-EXT.cbl`：沿用 TESTSHIFT 的風格，保留正常轉換與 EOF 案例，補上前綴不符、EOF 出現在相鄰位置、其餘資料保留及重跑案例。失敗時顯示案例名稱並設定非零 RETURN-CODE。

沒有編譯執行過的案例標為「待執行」。Python 測試結果另外記錄，兩者分開看。

## Python 範例

由 `samples/python/normalizer.py` 開始，依 CR-01 完成 `output/normalizer.py`。沿用 transform 與 process 的介面及 Python 標準庫。

`tests/test_normalizer.py` 有 11 個測試。另在 `output/test_authored.py` 寫三個 unittest：

1. 轉換後，整筆記錄除了指定欄位以外都保留。
2. 遇到資料內的 EOF，仍會處理下一筆。
3. 預覽不改動呼叫方的原始資料。

先建立 `output/test-report.md`，記錄待測項目，再執行 `python scripts/verify.py unit`。完成後更新實際命令、結果，以及修正過的問題。Windows 若只有 py 指令，改用 py -3。

失敗時修正 output 的程式；來源、規格與 tests 保留。測試報告約 300 字即可，尚未執行的 COBOL 或 IMS 項目另列。
