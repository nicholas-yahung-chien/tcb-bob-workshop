# 把 CKP02 跑起來，再看主機怎麼回答

讀完程式後，試著把七筆資料交給真正的 COBOL 程式處理。這次會留下三種結果：編譯清單、JES 作業紀錄，以及兩次執行後的資料比對。

## 先準備好自己的工作區

在 Bob 開啟教材資料夾，確認 pp4z 與 Zowe Explorer 可用，並使用分配給你的個人主機連線。先在 JOBS 檢視確認自己的帳號；連線認證不需要貼到 Bob 對話中。

連線步驟見 [CONNECTION.md](CONNECTION.md)。把自己的帳號、job 名稱、volume 與 storage class 寫入 host-lab/environment.md，後面的提問可以直接引用這份資料。

你會用到 `z-lab/CKP02.cbl`、`z-tests/fixtures.json` 和 `host-lab/README.md`。主機連線與配置值以本場提供的設定為準。

## 1. 先猜結果，再執行

把 CKP02 和 z-tests/fixtures.json 加入 Bob 對話，切到 Ask，輸入：

```text
我準備用這七筆資料測試 CKP02。請依程式說明每筆資料第一次、第二次執行後會變成什麼，並指出判斷依據。特別看看資料中的 EOF 和讀到檔尾有什麼不同，以及同一筆資料重跑會不會再變一次。
```

這則問題先交代「要測什麼」，再把注意力放在容易看錯的兩個地方。你也可以先問正常資料，理解後再追問 EOF 和重跑案例。

## 2. 開啟已備妥的來源與作業

依課程網頁，以 tcb-rse（IBM-937）開啟自己的 <帳號>.TCBLAB.COBOL(CKP02)，核對中文註解與本機 z-lab/CKP02.cbl 的內容。同一資料集也已備妥 GENCKP、CHKCKP，不需上傳或貼上。

先使用本機 host-lab/run.jcl；只有缺檔時，才以 tcb-rse（IBM-937）從 <帳號>.TCBLAB.JCL(RUN) 下載一次。將它與 environment.md、BOB-GUIDE.md 加入對話，使用課程網頁的「一起看這份主機作業」Prompt。

三個編譯步驟分別從自己的 COBOL 資料集讀取同名成員，都使用 CODEPAGE(937),DBCS。RUN 已填入自己的帳號與 job 名稱。請 Bob 帶你核對編譯、執行與比對流程，再由你提交。七筆測資與空檔由 GENCKP 自動建立。

## 3. 從編輯器提交

開啟 `host-lab/run.jcl`。在編輯器按右鍵，選擇 **Submit as JCL**，再選擇 tcb-rse（IBM-937）連線。記下回傳的 job ID，從 JOBS 檢視找到這一項作業。

先確認 owner 是自己，再看作業是否已完成。整體 RC 4 不代表每一步都失敗：這版 CKP02 有已核對的編譯警告，仍須打開清單確認內容。

## 4. 把實際結果交給 Bob

這次分析的是 JES、編譯與測試紀錄。CKP02 沒有 IMS 呼叫，這些檔案不是 IMS transaction log。

打開該作業的 JESMSGLG、JESYSMSG、CCKP 的 SYSPRINT，以及 CHECK1、CHECK2 的 SYSOUT，加入同一個 Bob 對話：

```text
這是我剛執行 CKP02 的作業紀錄。請幫我確認哪些步驟真的有執行、RC 4 來自哪裡，以及兩次資料比對和空檔測試是否成功。每個結論請指出對應的步驟與訊息；目前沒有的紀錄就先列為待確認。
```

這則問題把「提交成功」和「程式結果正確」分開檢查。先讓 Bob 說明你手上的紀錄，再決定是否需要修正，會比只問「為什麼出錯」更容易找到原因。

下面的步驟名稱來自產生的 run.jcl。對照作業清單，你應該看到：

- CHECK1、CHECK2 各有七筆 `PASS ALL 400 BYTES`，結尾為 `CHECKED=0007 ERRORS=0000`。
- RUNONCE、RUNTWICE、RUNEMPTY 都實際執行，RC 為 0。
- CKP02 編譯警告與 README 中列出的項目一致，沒有其他未核對的警告。

## 5. 再跑一次，確認能重做

重新提交整份 `run.jcl`，使用新的 job ID 檢查結果。每項作業都會重建自己的測資，所以整份練習可以重做；這與拿同一份已轉換的資料再交給 CKP02 處理，是兩件不同的事。

完成後，試著用自己的話回答：資料中的 EOF 如何處理？哪一筆重跑還會改變？你是從哪一份主機紀錄確認結果？
