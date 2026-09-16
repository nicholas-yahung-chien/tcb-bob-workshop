---
name: data-dictionary-zh-tw
description: >-
  Write and review Data Dictionary variable descriptions in Taiwan Traditional Chinese. Apply when generating or editing COBOL or PL/I data dictionaries, Generate data dictionary workflow descriptions, or human-readable descriptions in DD.json.
---

# Data Dictionary 的台灣繁體中文描述

產生或核對資料字典時，以台灣地區用語的繁體中文撰寫供人閱讀的簡短描述、詳細說明及業務意義。保留工作流程的欄位選擇與完整資訊，不縮成摘要。使用「欄位」、「程式」、「資料」、「位元組」、「記錄」、「呼叫」、「回傳碼」；byte 不翻成字元。

保留既有 JSON 結構、鍵名、型別、項目數量、變數名稱、技術識別值、路徑、來源參照、數字、PIC、條件常值與程式碼。只改用來供人閱讀的描述值；不確定欄位用途時先檢查現有結構，不把所有字串都翻譯，也不自行新增翻譯欄位或假造固定 schema。

業務說明以程式與使用者已確認的資料為依據。保留推論與待確認事項，不將縮寫猜測升格為事實。翻譯不能更改欄位意義、資料長度或條件。

生成流程中直接用繁體中文填寫描述，沿用流程指定的保存方式。若使用者要求整理已存在的 DD.json，僅處理明確指定的檔案；在允許寫入的模式先保留不覆寫的原檔備份，再更新原路徑的描述。Ask 模式只提供核對及建議。

修改既有檔案後確認 JSON 可解析，結構與非描述資料維持不變；逐項核對描述沒有遺漏或改變意思。未執行解析或差異核對時不得宣稱已通過。此技能是否被工作流程載入需依實際工具紀錄確認，不宣稱啟用技能就保證被所有流程使用。
