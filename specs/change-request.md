# CR-01：批次執行前，先預覽變更

執行批次前，我們希望先知道這次會改到多少筆，確認後再套用變更。這份練習需求以 CKP02 的規則為基礎，先完成文件與本機 Python 範例。

## 已知基準

主要來源為 `bank-source/reading/CKP02.TXT`；另外閱讀 `samples/cobol/IDSHIFT.cbl` 與 `IDREC.cpy` 作為純子程式對照。原始CKP02有READ/REWRITE，合成IDSHIFT沒有I/O。每筆固定 400 bytes，前十位為識別欄位，第十一位為附加碼，餘下389位在合成模型統稱payload。
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

## 規劃範圍

architecture.md 說明現況（As-is）、提案（To-be）及還需要的資料。資料流可以使用簡單的文字箭頭。
檢視 COBOL、Java、Database、Transaction、API、Batch、Test 七項：每項記載已知／未提供、變更建議、證據／待確認人角色。Java 與 API 可以列為未來選項，目前的相依仍需要相應資料確認。
checklist.md 列出分析、設計、實作、測試、部署、回復的工作，以及負責角色、前置條件和完成標準。規劃時也考慮同時執行、重跑、備份與回復、編碼、資料使用範圍及權限。
這次在本機完成純函式範例與文件。主機部署需要另外確認正式 JCL、備份、IMS 定義及連線設定。

## 驗收

- `architecture.md` / `checklist.md` 儲存在 output/，所有七項分析領域皆有交代。
- 來源引用能找到對應段落；尚缺的相依資訊另列。本機預覽與主機執行的結果分開記錄。
- 依 `python scripts/verify.py unit` 驗證模型，再人工檢閱文件。

## 用來討論的測試資料

以下都以完整 400 bytes 記錄為單位。識別欄位占前十位，其餘部分依案例填入。

| 案例 | 識別欄位與其他資料 | 想確認的事情 |
|---|---|---|
| 一般轉換 | 0012345678；第 14–16 位不是 EOF | 哪些位置會改變，哪些保留？ |
| 多個前導零 | 0000123456；第 14–16 位不是 EOF | 連續套用兩次，結果是否一樣？請保留每一步完整十字元及空白。 |
| 資料內標記 | 0012345678；第 14–16 位是 EOF | 這一筆如何處理？下一筆是否繼續？ |
| 前綴不同 | AB12345678；第 14–16 位不是 EOF | 不符合條件時會做什麼？ |

架構與程式文件使用相同案例，方便比較規劃和實作。文件格式見根目錄 DOC-SPEC.md；測試方式見 specs/testing.md。
