# 掃描程式與建立資料字典

第 01 單元開始時，先掃描 CKP02 與 CIS14，建立 Local Metadata，供後續閱讀程式與分析相依關係使用。第 02 單元再替 CKP02 建立 Data Dictionary（資料字典），整理各欄位的用途。

## 1. 分析前先掃描程式

1. 切換 Z Architect，將 z-lab/CKP02.cbl 與 z-lab/CIS14/CIS14.cbl 加入對話。
2. 輸入：「請先掃描 z-lab 裡的 CKP02 和 CIS14，建立分析程式與相依關係需要的 Local Metadata。完成後告訴我掃描結果，以及還需要補哪些檔案。」
3. 展開 scan_program 工具紀錄，查看結果並記下檔案位置。

Local Metadata 包含變數使用、敘述位置與程式結構。分析其他程式時，也需要掃描對應來源；修改程式後再掃描一次，讓資訊保持一致。

## 2. 建立資料字典

1. 在 Bob Settings → Skills 啟用 data-dictionary-zh-tw，確認來源為 Workspace。這份技能提供台灣繁體中文的欄位描述指引。
2. 在 Z Architect 點 Start Workflow，選擇本機教材工作區，再啟動 Generate data dictionary。
3. 選取 CKP02，依畫面指示完成掃描、建立描述及核對。確認後選 I'm done editing 或對應的完成操作。
4. 從結果連結開啟 DD.json，閱讀並保留在原來的位置。

將 DD.json 和 CKP02 加入對話，可以這樣問：

> 請用台灣常用的繁體中文，帶我看這份 Data Dictionary。哪些欄位意思可以從 CKP02 確認，哪些還需要問業務同事？有不一致的地方，請指出程式中的依據。

核對時先看欄位名稱、PIC、長度、REDEFINES 及條件值。例如 IN-REF-REC(14:3) 是 R-NAME 的第 3–5 位；註解中的公司統編則是業務線索，需要回到程式確認有哪些檢查。不明確的縮寫可以先記下來，留待業務同事補充。

## 3. 整理中文說明

若字典描述仍是英文，或用語需要調整，將 DD.json 加入 Agent 對話：

> 這份字典的說明還不是台灣常用的繁體中文，請幫我整理。先備份原檔，只改欄位的文字說明，保留變數名稱、數值和 JSON 格式，完成後確認檔案仍能正常讀取。

完成後開啟檔案，查看中文描述與原意是否一致，並核對項目數、變數名稱及數值。原檔備份可用來比較修改內容。

## 4. 接著閱讀與產生文件

依第 02 單元執行 Explain code 與 Generate program documentation，再把文件與資料字典放在一起看。若欄位用途說明不同，請 Bob 對照 CKP02 找出原因。

Explain code 使用 cobol-explain-zh-tw 技能協助中文說明。文件仍是英文時，依課程常見問題處理。

## 找不到工具或工作流程時

- 先確認 Bob 已登入、PPZ 權益可用，並已開啟教材工作區。
- Z Architect 沒有 Generate data dictionary 時，切換 Z Code 查看工作流程清單。
- 缺少 Copybook 時，加入相依檔案再掃描。
- 仍無法執行時，保留錯誤訊息請講師協助；可以先閱讀來源，待工具恢復後補做掃描。

想保留操作筆記，可在 output/analysis-preparation.md 記下工具版本、掃描檔案、結果位置、字典修改與待確認問題。

## 延伸閱讀

- [PPZ 工具與工作流程](https://www.ibm.com/docs/en/bobz/3.0.0?topic=z-using-workflows-skills-tools-commands)
- [Data Dictionary](https://www.ibm.com/docs/en/bobz/3.0.0?topic=applications-working-data-dictionary)
