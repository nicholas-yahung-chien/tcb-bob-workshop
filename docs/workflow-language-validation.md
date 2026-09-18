# 工作流程語言支援與驗證紀錄

2026-09-15；本機 Bob 核心 2.1.0、PPZ 3.0.21。此紀錄供教材維護使用，不納入學員 ZIP。

## 課程盤點

| 課程流程 | 語言處理 | 驗證程度 |
| --- | --- | --- |
| 02 的 Explain code | `.bob/skills/cobol-explain-zh-tw/SKILL.md` 自動選取後注入專用提示 | 使用者完成 CKP02／Developer 真實流程，12/12 完成並直接產生繁體中文 |
| 02 的 Generate program documentation | 原生介面 locale 翻譯，主流程直接使用輸出 | 使用者已完成 CKP02 真實流程並確認中文正文；截圖顯示 8/8 完成，目錄與部分標題仍為英文 |
| 01 的 `/impact-analysis` | 既有內建 slash 指令及課程繁體中文提問、通用語言規則 | 非本課程透過 Start Workflow 啟動的另一本機文件流程，不宣稱可自動注入新技能 |
| 01 的 Generate data dictionary | 工作流程保留原始 DD.json；另由 Agent 產生繁體中文 Markdown 資料字典 | 使用者已確認工作流程可產生 DD.json；可閱讀文件的新版流程待實際操作驗證 |

課程要求執行 Generate data dictionary，但不翻譯或改寫 DD.json。Generate application documentation 與 Refactor 不在本課程流程中。

## Explain code

已驗證的技能檔完整複製納入正式教材，不改寫其內容。PPZ 目前從技能 description 的雙引號關鍵字及 mentions 語句擷取匹配詞，對原始碼做不區分大小寫的出現次數計算，總數至少 3 次才啟用；此為版本相關實作，不是穩定公開介面保證。本技能使用 DIVISION、PROGRAM-ID、PIC、PROCEDURE，CKP02 共匹配 30 次。

工作流程顯示「已使用技能 cobol-explain-zh-tw」，生成文件的主要章節、表格與流程圖說明為繁體中文，未另外輸入中文要求或執行翻譯。來源 SHA-256 執行前後均為 `c0a829feb688b5dd0c5e9d726c325392da50b1e64ccea8990a6c7f1380198f6e`。語言成功不代表業務推論、bytes／字元等技術敘述已全數正確；原有課程的來源核對步驟仍須進行。

## Generate program documentation

本機 extension.js 的 Aso 準備步驟使用 `s_r(vpt())` 取得 `vscode.env.language`；wso 支援 zh-tw。Aet 將 `Yfe(locale, headings)` 翻譯指示附加到各段提示。Cso 透過 gu 建立 rawPrompt 子代理，未使用 Explain code 的 SOr／gOr 工作區技能選取與注入路徑。因此不能宣稱新增 skill 後會直接自動影響該工作流程。

使用者已實跑 Generate program documentation，確認可直接產生中文文件，要求移除課程翻譯步驟。主流程改為直接閱讀輸出並進行 Plan。program-docs-zh-tw 僅保留在常見問題的收合備援段落，用於需要翻譯英文正文時；不因英文目錄或技術名稱要求整份重譯。

備援 program-docs-zh-tw 尚未取得實跑驗證；原生中文輸出成功不等於備援技能已測試，也不等於整份技術內容已驗證正確。

## 官方參考

- [IBM Bob Skills](https://bob.ibm.com/docs/ide/features/skills)：工作區技能路徑、YAML 格式、啟用及管理方式。
- [Create and use skills](https://bob.ibm.com/docs/ide/tutorials/use-skills)：明確以 slash 呼叫技能的使用方式。
- [Custom rules](https://bob.ibm.com/docs/ide/configuration/rules)：一般規則的範圍；不能據此推定每個 rawPrompt 子代理皆有注入。
