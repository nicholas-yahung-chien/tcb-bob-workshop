# 掃描程式與建立資料字典

第 01 單元開始時，先掃描 CKP02 與 CIS14，建立 Local Metadata，接著替 CKP02 產生 DD.json，並另外整理成方便閱讀的 Data Dictionary（資料字典）。完成這些準備後，再閱讀程式與分析相依關係；第 02 單元沿用可閱讀的資料字典進行文件化。

## 1. 分析前先掃描程式

1. 切換 Z Architect，將 z-lab/CKP02.cbl 與 z-lab/CIS14/CIS14.cbl 加入對話。
2. 輸入：「請先掃描 z-lab 裡的 CKP02 和 CIS14，建立分析程式與相依關係需要的 Local Metadata。完成後告訴我掃描結果，以及還需要補哪些檔案。」
3. 展開 scan_program 工具紀錄，查看結果並記下檔案位置。

Local Metadata 包含變數使用、敘述位置與程式結構。分析其他程式時，也需要掃描對應來源；修改程式後再掃描一次，讓資訊保持一致。

驗收時將 scan_program 實際掃描的來源檔案，與資料庫因 CALL 等相依關係建立的外部程式參照分開列出；不能用資料庫的程式節點數判定已有幾支完整來源。只有參照、沒有來源的外部呼叫仍列為待補，不能宣稱已掃描或已完成其程式分析。

## 2. 產生 DD.json

1. 在 Z Architect 點 Start Workflow，選擇本機教材工作區，再啟動 Generate data dictionary。
2. 選取 CKP02，依畫面指示完成掃描、建立描述及核對。在 Update data dictionary 的差異畫面確認後，選 I'm done editing 或對應的完成操作，直到工作流程顯示完成。只看到變數數量或差異預覽，還不算完成保存。
3. 從結果連結開啟實際保存的 DD.json，記下位置，確認內容非空、CKP02 條目的 programName 為 CKP02，並對照 z-lab/CKP02.cbl 核對變數名稱，例如 IN-REF-REC、R-ID-1。保留原檔，不改寫或翻譯。
4. 將完成摘要與實際檔案比較。摘要若列出原始碼與 DD.json 都沒有的陌生欄位，記下差異，不把摘要當成字典內容，也不據此修改 DD.json。下一步使用實際 DD.json 與 CKP02 原始碼。若保存檔案為空、程式名稱不符或缺少內容，保留現況並請講師協助，不自行補造。

## 3. 產生方便閱讀的資料字典

1. 在 Bob Settings → Skills 啟用 data-dictionary-zh-tw，確認來源為 Workspace。
2. 將實際產生的 DD.json、z-lab/CKP02.cbl 與本指引加入 Agent 對話。
3. 輸入：

> 我想把方才資料字典裡的內容另外整理成一份同事容易查閱的格式。請對照 CKP02，並使用台灣常用的繁體中文。看不出欄位用途，或兩份資料對不起來的地方，請列出來讓我確認。

完成後開啟 `output/CKP02-data-dictionary.md`，核對欄位名稱、PIC、長度、REDEFINES、條件值與來源位置。確認 DD.json 的內容未被這個步驟修改。

核對時也檢查文件的分類與敘述：CH-RPD-KEY、R-ID-1、CH-R-ID-2 宣告於 FILE SECTION，不是 WORKING-STORAGE；CH-RPD-KEY 成立且 IN-REF-REC(14:3) 不等於 EOF 才轉換。摘要、表格與詳細說明須一致。DD.json 中 AI 展開的英文縮寫若沒有程式或已確認業務資料支持，保留為待確認。標示「DD.json 未收錄」前先逐項查原檔；點選 Markdown 來源連結，確認從 output/ 能開啟正確檔案，例如 `../z-lab/CKP02.cbl`。

將 DD.json、CKP02 與可閱讀的資料字典加入 Ask 對話，可以這樣問：

> 請帶我核對這份可閱讀的資料字典。哪些欄位意思可以從 CKP02 與 DD.json 確認，哪些還需要問業務同事？有不一致的地方，請指出來源。

例如 IN-REF-REC(14:3) 是 R-NAME 的第 3–5 位；註解中的公司統編則是業務線索，需要回到程式確認有哪些檢查。不明確的縮寫先列為待確認。

## 4. 接著閱讀與產生文件

依第 02 單元執行 Explain code 與 Generate program documentation，再把文件與 `output/CKP02-data-dictionary.md` 放在一起看。若欄位用途說明不同，請 Bob 對照 DD.json 與 CKP02 找出原因。

Explain code 使用 cobol-explain-zh-tw 技能協助中文說明。文件仍是英文時，依課程常見問題處理。

## 找不到工具或工作流程時

- 先確認 Bob 已登入、PPZ 權益可用，並已開啟教材工作區。
- Z Architect 沒有 Generate data dictionary 時，切換 Z Code 查看工作流程清單。
- 缺少 Copybook 時，加入相依檔案再掃描。
- 仍無法執行時，保留錯誤訊息請講師協助；可以先閱讀來源，待工具恢復後補做掃描。

想保留操作筆記，可在 output/analysis-preparation.md 記下工具版本、掃描檔案、DD.json 位置與保存核對結果、可閱讀資料字典的位置、摘要與實際檔案的差異，以及待確認問題。

## 延伸閱讀

- [PPZ 工具與工作流程](https://www.ibm.com/docs/en/bobz/3.0.0?topic=z-using-workflows-skills-tools-commands)
- [Data Dictionary](https://www.ibm.com/docs/en/bobz/3.0.0?topic=applications-working-data-dictionary)
