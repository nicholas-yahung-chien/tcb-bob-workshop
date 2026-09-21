請幫我對照 CKP02.cbl 和實際 DD.json，逐項檢查CKP02-data-dictionary.md：請一併參考 PPZ-ANALYSIS.md。

1. 變數是否依原始碼的 FILE SECTION、WORKING-STORAGE 與群組正確分類？
2. 轉換條件是否同時包含 CH-RPD-KEY 與 NOT EOF？摘要、表格和詳細說明是否一致？
3. 業務用途或英文縮寫展開有哪些來源支持？請連同摘要、標題及表格檢查；只有欄名、PIC 或 AI 描述支持的內容，保留為待確認。
4. 標示 DD.json 已收錄或未收錄的項目，是否與實際檔案一致？
5. Markdown 相對連結從 output/ 出發，是否能找到正確的來源檔案？

每項列出文件位置、原始碼或 DD.json 依據，以及通過、需更正或待確認的判斷。有落差時說明建議修正，先不要修改檔案。
