# 工作流程語言支援與驗證紀錄

2026-09-15；本機 Bob 核心 2.1.0、pp4z 3.0.21。此紀錄供教材維護使用，不納入學員 ZIP。

## 課程盤點

| 課程流程 | 語言處理 | 驗證程度 |
| --- | --- | --- |
| 02 的 Explain code | `.bob/skills/cobol-explain-zh-tw/SKILL.md` 自動選取後注入專用提示 | 使用者完成 CKP02／Developer 真實流程，12/12 完成並直接產生繁體中文 |
| 02 的 Generate program documentation | 原生介面 locale 翻譯；完成後在一般 Agent 對話明確呼叫 `/program-docs-zh-tw` 整理副本 | 原生路徑經本機實作檢查；新整理技能已做格式與打包檢查，尚待使用者實跑 |
| 01 的 `/impact-analysis` | 既有內建 slash 指令及課程繁體中文提問、通用語言規則 | 非本課程透過 Start Workflow 啟動的另一本機文件流程，不宣稱可自動注入新技能 |

課程沒有要求執行 Generate application documentation、Generate data dictionary 或 Refactor 工作流程，因此不將無關技能或操作加入學員教材。

## Explain code

已驗證的技能檔完整複製納入正式教材，不改寫其內容。pp4z 目前從技能 description 的雙引號關鍵字及 mentions 語句擷取匹配詞，對原始碼做不區分大小寫的出現次數計算，總數至少 3 次才啟用；此為版本相關實作，不是穩定公開介面保證。本技能使用 DIVISION、PROGRAM-ID、PIC、PROCEDURE，CKP02 共匹配 30 次。

工作流程顯示「已使用技能 cobol-explain-zh-tw」，生成文件的主要章節、表格與流程圖說明為繁體中文，未另外輸入中文要求或執行翻譯。來源 SHA-256 執行前後均為 `c0a829feb688b5dd0c5e9d726c325392da50b1e64ccea8990a6c7f1380198f6e`。語言成功不代表業務推論、bytes／字元等技術敘述已全數正確；原有課程的來源核對步驟仍須進行。

## Generate program documentation

本機 extension.js 的 Aso 準備步驟使用 `s_r(vpt())` 取得 `vscode.env.language`；wso 支援 zh-tw。Aet 將 `Yfe(locale, headings)` 翻譯指示附加到各段提示。Cso 透過 gu 建立 rawPrompt 子代理，未使用 Explain code 的 SOr／gOr 工作區技能選取與注入路徑。因此不能宣稱新增 skill 後會直接自動影響該工作流程。

提供的 program-docs-zh-tw 是完成後明確呼叫的語言整理技能，可處理工作流程已生成的 Markdown。課程要求學員加入實際輸出、在 Agent 模式選取 slash 技能，再儲存中文副本於 output/zh-TW/。保留原檔、技術識別字、數值與待確認事項，不重新生成程式解答。此方式也作為 Explain code 未產出中文時的備援。

下一次實跑驗證：完成 Generate program documentation，記錄原生輸出語言；加入該輸出並呼叫 program-docs-zh-tw，確認技能啟用、中文副本、原檔保留、章節與程式碼未遺漏、目錄連結正常及既有副本未被覆寫。尚未取得這次使用者實跑結果，不得標記為已驗證。

## 官方參考

- [IBM Bob Skills](https://bob.ibm.com/docs/ide/features/skills)：工作區技能路徑、YAML 格式、啟用及管理方式。
- [Create and use skills](https://bob.ibm.com/docs/ide/tutorials/use-skills)：明確以 slash 呼叫技能的使用方式。
- [Custom rules](https://bob.ibm.com/docs/ide/configuration/rules)：一般規則的範圍；不能據此推定每個 rawPrompt 子代理皆有注入。
