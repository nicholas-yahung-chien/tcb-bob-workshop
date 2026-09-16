# 課程一致性檢查（2026-09-16）

本次依學員由下載、需求規劃、文件化、主機執行到結果核對的順序，人工核對九份單元來源、37 則使用中的 Prompt 及附件、學員指引、規格、封裝清單、連線設定、JCL、測資與主機輔助程式。自動檢查涵蓋生成的 11 頁網站。未將既往驗證紀錄改寫成新版本實測，也未重新提交主機作業。

## 發現與修正

| 問題 | 修正 |
|---|---|
| 03 網頁、BOB-GUIDE、DOC-SPEC 及 workspace 規格仍混用 IBM-1047 操作說明 | 目前操作統一 tcb-rse／IBM-1371；保留既有 CODEPAGE(937),DBCS 與測資的來源事實，明確區分連線與編譯用途 |
| manifest 的 jcl_encoding 容易被當成目前設定 | 改為 initial_jcl_transfer_encoding，另列 connection_profile、connection_encoding；同步維護產生器 |
| 主流程要求把中文 JCL 註解改英文、首次開課假定本機已有個人 run.jcl | 移除舊版遷移要求；說明 ZIP 只有共用範本，個人版本缺檔時從自己的 RUN 下載一次，已有版本保留 |
| 把所有暫存與輸出檔一律描述為 LRECL=400 | 測資400 bytes；PRINTDD402 bytes，前後雙引號各占一個byte |
| 01 要求分析未附上的 IDSHIFT，02 混淆正式 JCL 缺件與課程已有 JCL | IDSHIFT 維持選做；區分生產環境資料與課程基準 |
| 02 回覆範例未反映已補充的需求回答 | 加入 DISPLAY、沒有排程防重複、EOF 表示尾筆、需要逐筆找差異；未定案的保存政策與設計仍待確認 |
| 多則 Prompt 新對話附件不足 | 補入來源、連線指引、JCL、Copybook、Python 起始程式與事件原檔 |
| 04 Ask 分析後沒有明確存檔步驟 | 加入 Agent 保存 host-lab/test-report.md 的步驟 |
| 06 成果表缺少主流程的 CKP02 主機測試，且 output／docs／host-lab 規則互相衝突 | 補成果路徑並同步 AGENTS、DOC-SPEC 與常見問題 |
| 閱讀筆記連到教材分支不存在的 docs；索引仍列 TXT | 連到網站維護分支，明示不在教材 ZIP；索引改用學員 z-lab 路徑 |
| 仍殘留驗收腳本、reference 預設存在、選做未執行卻要求勾選成功等文字 | 修正為人工核對、獨立下載答案與實際執行狀態 |

## 發布檢查

新增 scripts/check_curriculum.py，並納入 Pages 工作流程：核對使用中的 Prompt、附件是否存在於學員封裝、同 repository 的文件連結目標、連線與 manifest 一致性、輔助程式雜湊及已知過時操作字串。此維護工具不納入教材 ZIP，不要求學員執行。

人工核對仍不可被字串檢查取代。45 份來源與主機輔助程式、JCL 的內容保持原樣；本次不宣稱新增主機執行證據。IBM-1371 GUI 統一操作沿用使用者先前確認的驗證結果。
