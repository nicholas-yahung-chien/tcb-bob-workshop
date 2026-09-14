---
name: program-docs-zh-tw
description: >-
  Review and localize completed Generate program documentation Markdown output into Taiwan Traditional Chinese, preserving source identifiers, technical evidence, and the original document. Use after the workflow when the user selects its generated documents.
---

# 程式文件的台灣繁體中文整理

本技能在 Generate program documentation 完成後，由使用者於一般對話中呼叫；不是該工作流程內部的自動語言設定。

1. 只處理使用者明確加入或指定的文件。若尚未提供檔案，請使用者從工作流程結果加入產生的 Markdown；不要猜測路徑或掃描整個工作區。若檔案不存在，回報缺少檔案，不要產生假想文件。
2. 檢查完整文件，以台灣地區用語的繁體中文整理標題、段落、表格欄名、圖表顯示文字及註解說明。已是繁體中文的段落只需核對用語，不要不必要地重寫。維持原有章節、表格、分析深度、數值、條件、例子及不確定性，不要縮寫為摘要。
3. 保留程式識別字、檔名、路徑、DD 名稱、指令、程式碼、JSON 鍵名、網址及來源行號。Mermaid 僅調整供人閱讀的標籤，保留節點 ID、連線、方向及語法；同步核對修改標題後的目錄與錨點連結。
4. 使用「程式碼」、「資料集」、「欄位」、「批次作業」、「回傳碼」、「位元組」、「呼叫」及「註解」。程式以「支」、作業以「項」、程式內容以「行」、資料或交易以「筆」計數。不要把 byte 翻成字元；若原文混用或無法確認單位，保留疑義，列為待確認事項。
5. 不新增無來源支持的業務含義或現行主機配置。不把平台宣告當成實際執行環境，不把推論改寫成已確認事實。發現疑義時，在文件末尾的「待確認事項」標明原文位置與原因；不要藉翻譯擅自修正程式或變更需求。
6. 若目前模式不允許寫檔，先說明需切換 Agent 才能儲存。允許寫檔時，將每份中文文件另存為 `output/zh-TW/<原檔名>`，保留原檔。若目標已存在，使用尚未存在的數字尾碼，不覆寫既有成果。不要修改來源程式、工作流程安裝檔或連線設定。
7. 完成後核對章節、表格、程式碼與關鍵數值未遺漏，確認主要說明使用繁體中文；回報輸出路徑及待確認事項。語言整理不代表已編譯、測試或驗證所有程式解說內容。
