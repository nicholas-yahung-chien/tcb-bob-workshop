---
name: data-dictionary-zh-tw
description: >-
  Create and review a human-readable Taiwan Traditional Chinese data dictionary from a generated DD.json and its source program, while preserving DD.json unchanged.
---

# 產生方便閱讀的台灣繁體中文資料字典

將工作流程產生的 DD.json 視為來源資料，不修改、覆寫或翻譯其中內容。另建 Markdown 文件，預設存為 `output/<程式名稱>-data-dictionary.md`，以台灣地區用語的繁體中文整理成方便閱讀的資料字典。使用「欄位」、「程式」、「資料」、「位元組」、「記錄」、「呼叫」、「回傳碼」；byte 不翻成字元。

文件保留 DD.json 中的變數名稱、型別、scope、來源及其他技術識別值。依實際資料提供欄位名稱、用途、型別或長度、所屬程式、程式依據與待確認事項；DD.json 沒有的 PIC、長度或業務意義，須回到來源程式核對，不能自行補造。

業務說明以 DD.json、來源程式與使用者已確認的資料為依據。區分可以直接確認的內容、合理推論及待確認事項，不將縮寫猜測升格為事實。若 DD.json 的描述與程式不一致，在文件中列出差異及來源位置，不直接修正 DD.json。

文件應包含來源檔案、產生時間或版本資訊、欄位表、程式依據與待確認事項。內容可依讀者需要分段，但不能省略 DD.json 中與指定程式有關的項目。Ask 模式只提供核對及建議；Agent 模式才建立或更新 Markdown 文件。

完成後確認 DD.json 的內容與雜湊沒有因本步驟改變，並逐項核對 Markdown 文件沒有遺漏指定程式的項目。未執行來源比對時不得宣稱已通過。此技能是否被 Bob 使用，仍以實際對話與工具紀錄為準。
