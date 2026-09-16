# RC 4 修正延伸練習

本練習以學員實際作業的完整紀錄為依據，分別在 Ask 分析、Plan 討論、Agent 產生修正版。Prompt 請從第 04 單元網頁複製。本練習處理編譯警告，不實作需求單中的預覽功能。

## 輸入與保存範圍

使用 z-lab/CKP02.cbl、個人 host-lab/run.jcl、host-lab/environment.md，以及學員加入的實際紀錄目錄。紀錄可以位於工作區根目錄，不限定 host-lab/logs。先確認 owner、job ID、檔案清單及文字可讀性，再分析。

保留 z-lab、z-tests、個人原版 run.jcl 與原版 test-report.md。只在 host-lab/rc4 產生 CKP02R.cbl、run-rc0.jcl、review.md 與修正版 test-report.md。既有修正版先比較再更新，不覆寫學員未確認的修改。不要預先填入未執行的結果。

## 分析與修正邊界

- 閱讀編譯清單開頭、結尾及各階段摘要，搜尋全部診斷代碼，不能只用第一段 Messages 統計推論全檔。工具輸出截斷時分段讀到檔尾；未完整取得時不寫「未出現」。
- 將每個警告對回來源或編譯選項；摘要訊息與引發警告的根因分開記錄。既往已知訊息只是比對線索，不能代替本次實際清單。
- 只處理確認過的警告成因。保留轉換條件、400-byte 欄位布局、讀寫範圍、測資與預期值，不透過修改預期結果、放寬檢查、覆蓋回傳碼或隱藏全部警告來通過測試。
- 固定格式 COBOL 要保留第 7 欄指示位置與有效敘述欄位；編譯選項仍保留 CODEPAGE(937),DBCS。連線使用 tcb-rse（IBM-1371），兩者用途不同。
- 產生新程式時將 PROGRAM-ID 改為 CKP02R；若調整結束位置，核對主流程結束後不會落入下一個段落。

## 修正版 JCL

以個人 run.jcl 建立 run-rc0.jcl，保留帳號、配置及 15 個基準步驟名稱，方便前後比較。CCKP 的 SYSIN 改讀 <自己的帳號>.TCBLAB.COBOL(CKP02R)，LCKP02 的 SYSLMOD 改為 &&LOAD(CKP02R)，RUNONCE、RUNTWICE、RUNEMPTY 的 PGM 均改為 CKP02R。原版 CKP02 成員及 RUN 成員不覆寫。

CCKP 的編譯選項只依已確認的方案調整。JCL 每行維持有效長度，需要時正確續行。保留 SNAP1、SNAP2、BEFOREDD、PRINTDD、兩次完整400-byte比對與空檔測試，不改 GENCKP、CHKCKP 或 fixtures.json。review.md 記錄修改原因、差異、預計上傳位置及待執行檢查。

## 學員執行

1. 審閱 Bob 產生的差異。透過 tcb-rse 在自己的 TCBLAB.COBOL 新增 CKP02R 成員，將 host-lab/rc4/CKP02R.cbl 上傳至該成員。若成員已存在，先比較，不直接覆寫不同版本。
2. 重新從主機開啟 CKP02R，確認 PROGRAM-ID、修改位置、中文與換行。這一步僅上傳新成員，原版課程仍不需上傳 CKP02。
3. 在本機 run-rc0.jcl 選 Submit as JCL，以 tcb-rse 提交。記下新 job ID。不要把新版另存到原本的遠端 RUN。
4. 單獨開啟並以 UTF-8 另存完整的 JES 與編譯清單、GENERATE 及 CHECK1、CHECK2 紀錄。中文不要依賴「全部下載」；先確認內容可讀。若有分頁，載入所有頁面。
5. 將新紀錄加入 Bob，使用網頁的修正版核對 Prompt。確認 CCKP 真正編譯 CKP02R，所有 15 步執行且 RC 0、原警告消失、CHECK1/CHECK2 各七筆 PASS、CHECKED=0007 ERRORS=0000、RUNEMPTY RC 0。其他新警告或缺件分開記錄。

保存每次 job ID 與報告。靜態審閱、上傳成功或整體 RC 0，都不能單獨代表完整測試通過。
