# 測試規格

先閱讀 `requests/customer-email.txt` 了解業務期待，再由 z-lab/CKP02.cbl 核對現有轉換規則。來件不是完成訪談後的規格；未確認的問題要保留。這裡分成 COBOL 測試程式，以及可以在本機執行的 Python 範例。

## COBOL 測試

參考 `samples/cobol/IDSHIFT.cbl`、`IDREC.cpy` 和 `TESTSHIFT.cbl`。

- `output/cobol-test-plan.md`：列出輸入、完整預期記錄、判定方式，以及需要的編譯和執行環境。
- `output/TESTSHIFT-EXT.cbl`：沿用 TESTSHIFT 的風格，保留正常轉換與 EOF 案例，補上前綴不符、EOF 出現在相鄰位置、其餘資料保留及重跑案例。失敗時顯示案例名稱並設定非零 RETURN-CODE。

沒有編譯執行過的案例標為「待執行」。Python 測試結果另外記錄，兩者分開看。

## Python 範例

由 `samples/python/normalizer.py` 開始，依下方「選做練習的介面約定」完成 `output/normalizer.py`。沿用 transform 與 process 的介面及 Python 標準庫。

`tests/test_normalizer.py` 有 11 個測試。另在 `output/test_authored.py` 寫三個 unittest：

1. 轉換後，整筆記錄除了指定欄位以外都保留。
2. 遇到資料內的 EOF，仍會處理下一筆。
3. 預覽不改動呼叫方的原始資料。

先建立 `output/test-report.md`，記錄待測項目，再執行 `python scripts/verify.py unit`。完成後更新實際命令、結果，以及修正過的問題。Windows 若只有 py 指令，改用 py -3。

失敗時修正 output 的程式；來源、規格與 tests 保留。測試報告約 300 字即可，尚未執行的 COBOL 或 IMS 項目另列。

## 選做練習的介面約定

以下是為了讓 Python 範例與既有測試配合的教學約定，不是業務信件已確認的介面或正式系統設計。主流程的需求訪談與影響分析不以這些細節代替業務回答。


主要來源為 `z-lab/CKP02.cbl`；另外閱讀 `samples/cobol/IDSHIFT.cbl` 與 `IDREC.cpy` 作為純子程式對照。原始CKP02有READ/REWRITE，合成IDSHIFT沒有I/O。每筆固定 400 bytes，前十位為識別欄位，第十一位為附加碼，餘下389位在合成模型統稱payload。
Python 範例以 ASCII bytes 表示資料。只有前兩位是 ASCII `00` 且原始記錄第14–16位不是 `EOF` 時，前十位變成舊第3–10位加兩個 ASCII 空白；第11–400位不變。
`EOF` 是資料內條件，不代表停止處理批次。不檢核統編真假。REDEFINES 不增加長度。

## 新需求與介面

在 `output/normalizer.py` 實作 `transform(record: bytes) -> bytes` 及 `process(records: list[bytes], dry_run: bool = True) -> dict`。
輸入使用 bytes；長度不等於 400 或型別不符時，拋出 ValueError。先檢查整批輸入，再計算結果。函式保留呼叫端的原始 list/bytes，結果由回傳值提供，不進行檔案、網路或資料庫 I/O。
process 回傳恰含 `records`, `total`, `eligible`, `changed`, `unchanged`, `written`, `dry_run`。
eligible 是符合條件的筆數；changed 是轉換前後 bytes 不同的筆數；unchanged = total - changed。
dry_run=True 時 records 為原資料副本，written=0；False 時 records 為轉換結果，written=changed，表示模型中套用的異動筆數，**不是實體 REWRITE 次數**。
兩種模式的 eligible、changed、unchanged 相同；total=輸入筆數；空批次所有計數為0。
識別欄位可能是 `00` 加八個任意 bytes，沿用既有轉換條件即可。在這條規則下，符合條件的記錄都會改變，因此 eligible 和 changed 的數值相同。


## 程式推導用的案例

以下都以完整 400 bytes 記錄為單位。識別欄位占前十位，其餘部分依案例填入。

| 案例 | 識別欄位與其他資料 | 想確認的事情 |
|---|---|---|
| 一般轉換 | 0012345678；第 14–16 位不是 EOF | 哪些位置會改變，哪些保留？ |
| 多個前導零 | 0000123456；第 14–16 位不是 EOF | 連續套用兩次，結果是否一樣？請保留每一步完整十字元及空白。 |
| 資料內標記 | 0012345678；第 14–16 位是 EOF | 這一筆如何處理？下一筆是否繼續？ |
| 前綴不同 | AB12345678；第 14–16 位不是 EOF | 不符合條件時會做什麼？ |

