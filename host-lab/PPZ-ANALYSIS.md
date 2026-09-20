# 掃描程式與建立資料字典

第 01 單元開始時，以 Z Architect 掃描 CKP02 與 CIS14，建立 Local Metadata，並分析程式角色與相依關係；接著切換 Z Code，替 CKP02 產生 DD.json、可閱讀的 Data Dictionary（資料字典），再閱讀單支程式。第 02 單元沿用可閱讀的資料字典進行文件化。

一般分析與討論不寫檔；掃描與字典工作流程依步驟產生分析資料。收到已確認範圍的文件產出要求時，Z Code 可保存可閱讀資料字典，Z Architect 可保存架構與實作清單；教材文件只寫 output/，不改來源、已產生的 DD.json 或測試，也不提交主機作業。

## 1. 分析前先掃描程式

1. 切換 Z Architect，將 z-lab/CKP02.cbl 與 z-lab/CIS14/CIS14.cbl 加入對話。
2. 輸入：「請先掃描 z-lab 裡的 CKP02 和 CIS14，建立分析程式與相依關係需要的 Local Metadata。完成後告訴我掃描結果，以及還需要補哪些檔案。」
3. 展開 scan_program 工具紀錄，查看結果並記下檔案位置。
4. 沿用 Z Architect，依課程頁面的「分清用途與相依關係」提示分析各程式角色；只讀與討論，不寫檔。

Local Metadata 包含變數使用、敘述位置與程式結構。分析其他程式時，也需要掃描對應來源；修改程式後再掃描一次，讓資訊保持一致。

驗收時將 scan_program 實際掃描的來源檔案，與資料庫因 CALL 等相依關係建立的外部程式參照分開列出；不能用資料庫的程式節點數判定已有幾支完整來源。只有參照、沒有來源的外部呼叫仍列為待補，不能宣稱已掃描或已完成其程式分析。

## 2. 產生 DD.json

1. 切換 Z Code，點 Start Workflow，選擇本機教材工作區，再啟動 Generate data dictionary。
2. 選取 CKP02，依畫面指示完成掃描、建立描述及核對。在 Update data dictionary 的差異畫面確認後，選 I'm done editing 或對應的完成操作，直到工作流程顯示完成。只看到變數數量或差異預覽，還不算完成保存。
3. 從結果連結開啟實際保存的 DD.json，記下位置，確認內容非空、CKP02 條目的 programName 為 CKP02，並對照 z-lab/CKP02.cbl 核對變數名稱，例如 IN-REF-REC、R-ID-1。保留原檔，不改寫或翻譯。
4. 將完成摘要與實際檔案比較。摘要若列出原始碼與 DD.json 都沒有的陌生欄位，記下差異，不把摘要當成字典內容，也不據此修改 DD.json。下一步使用實際 DD.json 與 CKP02 原始碼。若保存檔案為空、程式名稱不符或缺少內容，保留現況並請講師協助，不自行補造。

## 3. 產生方便閱讀的資料字典

1. 在 Bob Settings → Skills 啟用 data-dictionary-zh-tw，確認來源為 Workspace。
2. 將實際產生的 DD.json、z-lab/CKP02.cbl 與本指引加入 Z Code 對話。
3. 以下是建立文件的要求，只保存 output/CKP02-data-dictionary.md，保留 DD.json 原樣；輸入：

> 我想把方才資料字典裡的內容另外整理成一份同事容易查閱的格式。請對照 CKP02，並使用台灣常用的繁體中文。看不出欄位用途，或兩份資料對不起來的地方，請列出來讓我確認。

完成後開啟 `output/CKP02-data-dictionary.md`，核對欄位名稱、PIC、長度、REDEFINES、條件值與來源位置。確認 DD.json 的內容未被這個步驟修改。

核對時也檢查文件的分類與敘述：CH-RPD-KEY、R-ID-1、CH-R-ID-2 宣告於 FILE SECTION，不是 WORKING-STORAGE；CH-RPD-KEY 成立且 IN-REF-REC(14:3) 不等於 EOF 才轉換。摘要、表格與詳細說明須一致。DD.json 中 AI 展開的英文縮寫若沒有程式或已確認業務資料支持，保留為待確認。標示「DD.json 未收錄」前先逐項查原檔；點選 Markdown 來源連結，確認從 output/ 能開啟正確檔案，例如 `../z-lab/CKP02.cbl`。

將 DD.json、CKP02 與可閱讀的資料字典加入同一個 Z Code 對話，這次只讀核對、不修改檔案，可以這樣問：

> 請帶我核對這份可閱讀的資料字典。哪些欄位意思可以從 CKP02 與 DD.json 確認，哪些還需要問業務同事？有不一致的地方，請指出來源。先不要修改檔案。

例如 IN-REF-REC(14:3) 是 R-NAME 的第 3–5 位；註解中的公司統編則是業務線索，需要回到程式確認有哪些檢查。不明確的縮寫先列為待確認。

## 4. 接著閱讀與產生文件

第 01 單元的單支 CKP02 閱讀沿用 Z Code；需求釐清使用 Ask，影響分析、架構討論及確認後的 architecture.md／checklist.md 保存使用 Z Architect。文件確認前只討論，確認後也只寫 output/，不因需要存檔而切換 Agent。

依第 02 單元在 Z Code 執行 Explain code 與 Generate program documentation，再把文件與 `output/CKP02-data-dictionary.md` 放在一起看。工作流程原稿保留在 docs/；若欄位用途說明不同，請 Bob 對照 DD.json 與 CKP02 找出原因。

Explain code 使用 cobol-explain-zh-tw 技能協助中文說明。文件仍是英文時，依課程常見問題處理。

## 找不到工具或工作流程時

- 先確認 Bob 已登入、PPZ 權益可用，並已開啟教材工作區。
- 先從 Z Code 找 Generate data dictionary；版本沒有此入口時，可切換 Z Architect 查看。2026-09-20 以 Bob 2.1.0／PPZ 3.0.22 實測 Z Architect 路徑完成 6/6。
- 缺少 Copybook 時，加入相依檔案再掃描。
- 仍無法執行時，保留錯誤訊息請講師協助；可以先閱讀來源，待工具恢復後補做掃描。

想保留操作筆記，可在 output/analysis-preparation.md 記下工具版本、掃描檔案、DD.json 位置與保存核對結果、可閱讀資料字典的位置、摘要與實際檔案的差異，以及待確認問題。

## 延伸閱讀

- [PPZ 工具與工作流程](https://www.ibm.com/docs/en/bobz/3.0.0?topic=z-using-workflows-skills-tools-commands)
- [Data Dictionary](https://www.ibm.com/docs/en/bobz/3.0.0?topic=applications-working-data-dictionary)
