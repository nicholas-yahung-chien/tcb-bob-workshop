# 分析前的程式掃描與 Data Dictionary

IBM Bob Premium Package for Z 在教材中簡稱 PPZ。先建立 Local Metadata，再分析需求影響；文件化前先建立並核對 Data Dictionary。這些成果不修改原始 CKP02。

## 1. 建立 Local Metadata

1. 開啟 z-lab/CKP02.cbl，切換 Z Architect，加入這支程式。
2. 輸入：「請先掃描 CKP02，建立後續分析需要的本機程式資訊。完成後，告訴我掃描了哪些檔案，有沒有缺少的內容。」
3. 展開工具紀錄，確認 scan_program 的實際執行與回傳位置。記下掃描檔案、時間、缺少的相依及 Bob／PPZ 版本。資料庫位置依工具回傳，不自行建立同名檔冒充成果。
4. 若工具不可用，確認 PPZ 權益、模式及語言服務；若缺 Copybook，加入相依再掃描。仍不可用時記錄原因，以來源審閱繼續，明確標為未完成掃描。

scan_program 建立變數使用、敘述參照與程式結構資訊。它與第 05 單元的 ZCodeScan 檢查不同，也不代表整套系統或未提供的呼叫者已被分析。來源修改後需重新掃描；不因存在舊 metadata 就認定內容最新。

## 2. 文件化前建立字典

2026-09-17 使用者已確認 Z Architect 會呼叫 scan_program，也能看到並執行 Data Dictionary；當次字典描述未使用台灣地區用語的繁體中文。Bob／PPZ 精確版本尚未提供。

開始前在 Bob Settings → Skills 確認 data-dictionary-zh-tw 為 Workspace 且 Active。新技能旨在引導欄位描述直接使用繁體中文，但尚未驗證工作流程是否會載入它；以實際描述與工具紀錄為準。

1. 先在 Z Architect 的 Start Workflow 選擇目前本機工作區，尋找 Generate data dictionary。
2. 若此模式未提供，切換 Z Code 再查看。團隊建議使用 Z Architect；IBM 3.0.0 公開文件以 Z Code 為入口。依本機版本實際提供的功能操作，不假定兩者均可用，也不把找不到功能記為成功。
3. 選 CKP02，依流程完成掃描、產生描述及人工核對。確認後依介面選擇 I'm done editing 或相應的完成操作。
4. 從結果連結開啟實際 DD.json，記錄位置。加入該檔與 CKP02，請 Bob 協助核對；不要把路徑猜成固定的 docs 或 output 目錄。

核對重點：欄位名稱、PIC／長度、REDEFINES 重疊關係、條件值和程式中的實際用途。IN-REF-REC(14:3) 是 R-NAME 的第 3–5 位，不是獨立具名欄位。公司統編是註解提供的業務線索，不代表程式做了有效性檢查。待確認的業務意思不要直接批准為事實。

若描述仍非台灣繁體中文，保存工作流程成果，將實際 DD.json 加入 Agent 對話：

> 這份字典的說明還不是台灣常用的繁體中文，請幫我整理。先備份原檔，只改欄位的文字說明，保留變數名稱、數值和 JSON 格式，完成後確認檔案仍能正常讀取。

核對原檔備份、更新後 JSON 可解析、項目數及非描述資料一致。這是尚未達成中文直接產出時的補救，不宣稱工作流程原生已支援繁體中文。不要只翻譯對話而漏改字典，也不另造不相容 schema。

## 3. 使用經確認的字典

接續 Explain code 與 Generate program documentation。檢查流程是否引用字典；若無法確認，將實際 DD.json 加入後續文件核對對話，要求指出一致與不一致之處，不宣稱已自動採用。

Explain code 目前沿用已驗證的 cobol-explain-zh-tw skill。團隊回饋後續更新將加強中文支援，但未將未發布版本當成現有功能；升級後重新驗證。Generate program documentation 沿用目前中文輸出，不加翻譯步驟。

可保存簡短核對筆記於 output/analysis-preparation.md，列出實際版本、掃描紀錄、metadata 路徑、DD.json 路徑、人工修正與未確認事項。這份筆記不代替工具成果。

## 官方依據

- [PPZ 工具與工作流程](https://www.ibm.com/docs/en/bobz/3.0.0?topic=z-using-workflows-skills-tools-commands)
- [Data Dictionary](https://www.ibm.com/docs/en/bobz/3.0.0?topic=applications-working-data-dictionary)

掃描及字典入口已獲使用者實測確認；中文描述 skill 的套用效果與整理後檔案驗證仍待回報，不混同入口可用與中文產出已通過。
