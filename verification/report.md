# IBM Bob Workshop 實測驗證報告

日期：2026/09/10。環境：Windows、Python 3.13.5、IBM Bob Shell 2.0.2。確實使用BOB_API_KEY呼叫Bob服務；沒有以參考答案冒充新生成結果。

## 結論與界線

核心路徑經兩個新工作區重跑、獨立驗收與人工審查後修正。最終結果以以下表格和evidence.json為準。模型首次輸出並非每次通過，不能保證所有學員一次生成相同文字或未來服務延遲相同；教材以固定契約、測試、修正Prompt及講師備援維持可觀測成果一致。

## 完整演練

| 輪次 | 原輪5項機械驗收首次通過 | 七步累計時間 | CLI/事件狀態 | 發布判定 |
|---|---|---|---|---|
| run-01 | 4/5 | 20.8分 | 05-unit: invalid-json | 初期探索紀錄，不作為最終通過輪次 |
| run-02 | 3/5 | 20.0分 | 05-unit: invalid-json | 初期探索紀錄，不作為最終通過輪次 |
| run-03 | 3/5 | 20.9分 | 無執行異常 | 初期探索紀錄，不作為最終通過輪次 |
| final-01 | 5/5 | 29.8分 | 無執行異常 | 通過；含人工審查修正 |
| final-02 | 3/5 | 23.8分 | 無執行異常 | 通過；含人工審查修正 |

Ask與Plan無檔案驗收項，另以來源審查；計數中的5項為plan/docs/unit/logs/sast。初期工具30回合上限後改為45。run-01/run-02的invalid-json含max-turns错误事件與result，不能因exit code 0而當成正常完成。發布版驗收新增文件控制字元與報告存在檢查，已重新檢查最終兩輪；原輪數據保持原樣。

| 輪次 | 步驟 | 實測時間 | 原輪驗收 |
|---|---|---|---|
| final-01 | 01-ask | 56.7秒 | 不適用（Ask/Plan人工審查） |
| final-01 | 02-plan | 256.8秒 | 不適用（Ask/Plan人工審查） |
| final-01 | 03-plan-deliver | 249.5秒 | 通過 |
| final-01 | 04-document | 267.9秒 | 通過 |
| final-01 | 05-unit | 250.5秒 | 通過 |
| final-01 | 07-logs | 600.0秒 | 通過 |
| final-01 | 08-sast | 108.3秒 | 通過 |
| final-02 | 01-ask | 63.7秒 | 不適用（Ask/Plan人工審查） |
| final-02 | 02-plan | 125.9秒 | 不適用（Ask/Plan人工審查） |
| final-02 | 03-plan-deliver | 510.6秒 | 失敗，需修正 |
| final-02 | 04-document | 141.9秒 | 通過 |
| final-02 | 05-unit | 234.6秒 | 通過 |
| final-02 | 07-logs | 112.7秒 | 失敗，需修正 |
| final-02 | 08-sast | 239.9秒 | 通過 |

## 修正後驗收

- final-01：修正 logs, manual-review；耗時 307.4 秒；發布版全部驗收 通過；受保護檔案未修改。修正呼叫的error事件數：0。最後另開Bob對話只執行全部驗收：success，17.2秒，error事件0個。
- final-02：修正 plan, logs, manual-review；耗時 286.9 秒；發布版全部驗收 通過；受保護檔案未修改。修正呼叫的error事件數：2。最後另開Bob對話只執行全部驗收：success，14.2秒，error事件0個。

修正採prompts/09-repair.md加實際驗收輸出與人工審查意見。final-02修正時達45回合上限，出現2個error事件，即使最後result寫success也不算乾淨的成功呼叫；其產物通過獨立驗收後，再開新對話讓Bob只執行驗收確認。這項異常如實保留，不能以測試通過抹去。

機器檢查與人工審查分開：主機編碼、資料集組織、外部備份／鎖定、IDSHIFT記憶體修改及CR-01實作範圍均人工核對；參考答案經講師內容審訂。摘要保留Prompt SHA-256；詳細本機記錄未公開，避免把大量中間輸出當教材。

每個最終工作區驗收包含11個獨立Python行為測試、至少3個Bob補充測試、6個SQLite/參數綁定測試，以及plan/docs/log的固定事實與來源引文。45份原始碼與45份閱讀版SHA-256全部核對。

## CIS14進階題

另外實跑06-customer-analysis三個版本，發現過度推論未讀程式用途、縮排/句點混淆與日期算式錯誤；第三版再依人工審查讓Bob修正。確認欄位、狀態分層、缺件與日期運算後，提供reference/customer-analysis.md的精簡審訂答案。GNP/ GU細部分支仍須逐行核對；不把長篇AI回答當成已完整理解主機。

## 網站與下載驗證

11頁靜態網站經HTML本地連結、fragment、標題與Prompt複製目標檢查。Edge實際檢查桌面／390px行動版、課程導覽、核對進度重新整理後保留、複製成功提示及無頁面橫向溢出。剪貼簿內容本身未以瀏覽器工具成功讀回，因此僅記錄複製介面回饋通過。

Windows PowerShell的run-bob.ps1實測UTF-8 stdin，Bob原樣回覆「合庫工作坊 SHELL_OK」，0工具呼叫、成功。原始碼及公開檔案未包含本次API key；原始工作單截圖未公開。

## 尚未實測

- Bob Premium Package for Z的IDE專用模式、Explain／Impact Analysis、Z Understand與授權：需Jackson課前以實際環境驗收。
- COBOL編譯、Enterprise COBOL、JCL提交、IMS runtime與真實transaction log：本機無該環境；合成Python模型不替代主機驗證。
- Fortify／Checkmarx正式掃描／複掃：未提供報告與引擎，使用明確標示的合成SQL injection finding。
- 現場學員數量、網路、額度與模型版本：兩場前仍應依講師手冊重新演練。

方法與失敗案例整理見docs/rehearsal-method.md；機器可讀證據見verification/evidence.json。最終Pages發布與新clone檢查另記於verification/release-check.md。
