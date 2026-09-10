# CR-01：批次識別欄位轉換的預覽與統計（教學假設）

業務希望先預覽本批次會變更多少筆，再由既有受控批次流程執行。這是工作坊需求，尚未核定為合庫正式變更。

## 已知基準

主要來源為 `bank-source/reading/CKP02.TXT`；另外閱讀 `samples/cobol/IDSHIFT.cbl` 與 `IDREC.cpy` 作為純子程式對照。原始CKP02有READ/REWRITE，合成IDSHIFT沒有I/O。每筆固定 400 bytes，前十位為識別欄位，第十一位為附加碼，餘下389位在合成模型統稱payload。
只有前兩位是 ASCII `00` 且原始記錄第14–16位不是 `EOF` 時，前十位變成舊第3–10位加兩個 ASCII 空白；第11–400位不變。
`EOF` 是資料內條件，不代表停止處理批次。不檢核統編真假。REDEFINES 不增加長度。

## 新需求與介面

在 `output/normalizer.py` 實作 `transform(record: bytes) -> bytes` 及 `process(records: list[bytes], dry_run: bool = True) -> dict`。
輸入只接受 bytes，長度不等於400或型別錯誤一律拋 ValueError。批次先驗證全部輸入，才計算結果；不得改動 caller 的 list/bytes，不做任何檔案、網路、資料庫 I/O。
process 回傳恰含 `records`, `total`, `eligible`, `changed`, `unchanged`, `written`, `dry_run`。
eligible 是條件符合筆數；changed 是「轉換前後 bytes 不同」的筆數；unchanged=total-changed。在本題規則下eligible與changed必然相等，但定義仍須分清，以便未來規則變更。
dry_run=True 時 records 為原資料副本，written=0；False 時 records 為轉換結果，written=changed，表示模型中套用的異動筆數，**不是實體 REWRITE 次數**。
兩種模式的 eligible、changed、unchanged 相同；total=輸入筆數；空批次所有計數為0。
識別欄位可能是 `00` 加八個任意 bytes，不要自作主張新增數字檢核。此轉換的固定點只能是十個空白，與00前綴條件矛盾，因此不存在eligible但不變的合法記錄。

## 規劃範圍

architecture.md 必須分「As-is來源事實」「To-be提案」「缺件與待確認」。用簡單文字箭頭即可，不要求安裝繪圖工具。
檢視 COBOL、Java、Database、Transaction、API、Batch、Test 七項：每項記載已知／未提供、變更建議、證據／待確認人角色。Java與API可提出未來選項，不能宣稱目前存在。
checklist.md 必須列分析、設計、實作、測試、部署、回復；每項有負責角色、驗收與依賴。加入並行執行、重跑非冪等風險、備份與回復、編碼、資料最小化與權限。
本機只做純函式模型與文件。主機部署、真實JCL、實體備份位置、IMS PSB/DBD、正式連線與寫檔策略待平台團隊確認。

## 驗收

- `architecture.md` / `checklist.md` 儲存在 output/，所有七項分析領域皆有交代。
- 來源引用可定位；未提供的依賴明示未知；不能聲稱 dry-run 等於主機已測試。
- 依 `python scripts/verify.py unit` 驗證模型，再人工檢閱文件。
