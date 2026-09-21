---
name: data-dictionary-zh-tw
description: >-
  Create and review a human-readable Taiwan Traditional Chinese data dictionary from a generated DD.json and its source program, while preserving DD.json unchanged.
---

# 產生方便閱讀的台灣繁體中文資料字典

將工作流程產生的 DD.json 視為來源資料，不修改、覆寫或翻譯其中內容。另建 Markdown 文件，預設存為 `output/<程式名稱>-data-dictionary.md`，以台灣地區用語的繁體中文整理成方便閱讀的資料字典。使用「欄位」、「程式」、「資料」、「位元組」、「記錄」、「呼叫」、「回傳碼」；byte 不翻成字元。

文件保留 DD.json 中的變數名稱、型別、scope、來源及其他技術識別值。依實際資料提供欄位名稱、用途、型別或長度、所屬程式、程式依據與待確認事項；DD.json 沒有的 PIC、長度或業務意義，須回到來源程式核對，不能自行補造。

業務說明以 DD.json、來源程式與使用者已確認的資料為依據。區分可以直接確認的內容、合理推論及待確認事項，不將縮寫猜測升格為事實。若 DD.json 的描述與程式不一致，在文件中列出差異及來源位置，不直接修正 DD.json。

文件應包含來源檔案、產生時間或版本資訊、欄位表、程式依據與待確認事項。內容可依讀者需要分段，但不能省略 DD.json 中與指定程式有關的項目。核對或討論要求只提供唯讀分析，不修改檔案；即使目前是 Z Code，也不因具備寫檔能力就自行修改。收到已確認範圍的建立或更新文件要求時，可在 Z Code 或 Agent 保存 Markdown，僅寫入 output/ 的指定文件；不修改來源程式、DD.json 或測試，不提交主機作業。Ask 與 Plan 模式仍只提供核對及建議。

完成前逐項核對：

- **宣告位置與收錄範圍**：FILE SECTION、WORKING-STORAGE SECTION 及群組歸屬依原始碼宣告分類，不依 DD.json 的排列順序分類。以實際 DD.json 比對哪些項目已收錄、哪些由來源補充，避免把已收錄的變數標為未收錄。
- **完整條件與前後一致性**：描述某條件會觸發的處理時，核對完整 IF、AND、NOT 與句點範圍，再回查摘要、欄位表及詳細說明是否一致。CKP02 的 CH-RPD-KEY 成立只是其中一個條件，還須 IN-REF-REC(14:3) 不等於 EOF 才轉換；不能只在文件後段補上限制，卻保留前段的錯誤斷言。
- **業務名稱的證據**：DD.json 的 AI 描述或英文縮寫展開不是已確認的業務定義。需要保留時明標「DD.json 的 AI 展開，尚無來源證實」，再列確認問題。僅有欄位名稱與 PIC 時，不直接斷言其業務用途；註解提到公司統編，也不表示程式已驗證統編有效性。
- **文件連結**：Markdown 相對連結從輸出文件所在目錄計算。例如文件在 output/ 時，來源連結使用 `../z-lab/CKP02.cbl`；DD.json 連結依實際位置設定。逐一確認連結目標存在，不把工作區根目錄相對路徑直接當作文件連結。

完成後確認 DD.json 的內容與雜湊沒有因本步驟改變，並逐項核對 Markdown 文件沒有遺漏指定程式的項目。未執行來源比對時不得宣稱已通過。此技能是否被 Bob 使用，仍以實際對話與工具紀錄為準。
