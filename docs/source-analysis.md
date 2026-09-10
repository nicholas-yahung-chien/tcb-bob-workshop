# 程式閱讀筆記

這份筆記整理 bank-source/reading 的程式內容。引用的是檔案實際行號；HLASM 右側的編號另有用途。需要找符號時，可以搭配 [程式索引](source-index.md)。

## CKP02：欄位與批次轉換

先看資料定義，再沿著開檔、處理和關檔的順序閱讀。FILE-CONTROL對應INPUT1，FD為400字元。R-ID是11位群組，其中R-ID-1十位、R-ID-2一位；REDEFINES不增加記錄長度。R-NAME在12–51，所以14–16的EOF檢查位於R-NAME內。

主流程先讀，再迴圈處理，再關檔。IF只包住轉換PERFORM，句點結束後的REWRITE對每筆執行。首兩位00但marker為EOF時，內容保持、I/O仍執行。`00`只是條件名，不是完整統編檢核。

轉換可能非冪等：0000123456→00123456加兩空白→123456加四空白。因此重跑之前，需要確認預覽、備份與回復方式。來源沒有 FILE STATUS 宣告，也沒有附上正式 JCL，相關處理需要補充資料。

## CIS14：資料加工與IMS相依

FD宣告輸入300、分行表80、主輸出917、附記事項輸出1109字元。1000初始化、預讀輸入；有資料才建立最多5000筆分行表。3000-PROCESS清TEMP-AREA，檢查VADOCI，依PROCESS-OK執行3100 GU CIR、3200 GNP CIA；條件符合時3400 GNP CIX覆寫客戶姓名。輸出與下一筆READ則看PGM-OK，因此「單筆查詢失敗」與「程式整體失敗」不是同一件事。

3100/3200/3400依CI-STATUS-CODE區分成功、來源定義的MORE-RESOURCE-NEEDED、查無segment及其他錯誤。各狀態的處理以這支程式的分支為準。GU/GNP透過CBLTDLI，CIPCB的狀態碼欄位、SSACIDB的SSA及segment copybooks互相配合。

3300輸出處理包含帳號／分行轉換、民國年加19110000、電話零值整理、國籍、姓名地址SO/SI處理、交易欄位與錯誤註記。3300-1-TRANS-NAME/ADDR對單雙位元組標記進行辨識；3310/3320使用TAXCOMB的特殊碼條件處理字元。這些處理使用原有編碼下的位元組位置；若改用 Unicode，需要重新比較資料與長度。

3301整體檢核呼叫3303帳號清理、3305客戶預設值、3307交易資料整理、3309日期欄位。XIDCHK負責識別碼外部檢查，BRHIDCNV負責分行轉換；兩者程式未提供。3800最多在TRD-NOTE三個3字元位置填入註記；超過這些位置時應保留哪些問題，需要再確認需求。

3309以年/月/日範圍處理日期，非完整曆法驗證；以CURRENT-DATE減10000做一年前的比較也不等於365天差值。電話 A1/A2 的搜尋可以補測沒有數字、跨筆狀態與邊界位置。

5000印出計數、關檔、呼叫FUNCTION-SYNC，依PGM-END區分正常與RETURN-CODE=99。完整執行仍依賴IMS、PSB/PCB參數順序、正式JCL及測资。閱讀後若要實際執行，需要先準備上述環境。

## Copybooks：閱讀順序

- DLIFUNCT：DL/I功能常數與計數欄位；IMSDBCOD：狀態碼定義。被COPY不代表其中所有功能都被主程式使用。
- SSACIDB：未限定與限定SSA，含CIR/ CIA/ CIX關鍵欄位。依CALL實際傳入的SSA追蹤。
- PCBCIDB與其餘PCB*：DBD名、level、status、proc options、segment、key feedback等PCB欄位。CIS14 ENTRY列出多個PCB及DMY佔位，其順序需與PSB核對。
- CICIRSEG：客戶主資料；CICIASEG：地址相關segment；CICIXSEG：多種擴充佈局，CIS14用其中CIXNM相關欄位。
- VAVADSEG：輸入對應VADSEG及交易欄位定義；分析READ INTO時需比對實際使用區段，不能假設整個copybook就是一筆FD長度。
- TSYNCTSR、SUBCODES：共用通訊／同步欄位與代碼定義，應從符號使用點回查，不把名稱當成執行證據。
- TAXCOMB：特殊字元條件表，參與姓名地址檢核；保留code page前提。

## STANCVT：序號遞增

STANPRM的OLDSTAN/NEWSTAN各7、RETCODE1字元。先處理FFFFFFF→0000001，再處理前六位F，其他情況從右端掃F、置零並在進位位元組TR查表。TABLEA预設FF，填入0–9及A–E的後繼字元對應。

正常返回時OLDSTAN已改寫，MVC複製至NEWSTAN，RETCODE='Y'且RC=0。不存在明確非法字元錯誤返回分支；只有被TR處理的位置會查表，其他非法字元可能原樣保留。常數的實際表示仍要在對應主機確認；呼叫方的並行控制也需要另外查看。

## SYSOCP31：訊息流程與相依邊界

入口初始化返回與輸出工作欄位，依交易條件處理OCPMSG/OCPRTN、錯誤回復及SENDERR。OCPMSG最多檢視兩個訊息槽，PUTMSG決定輸出目的、複製512位元組OUTAREA、可寫交易log、依路由進行code conversion再送出；完成後清理可重用的訊息區。

CLINTSET依輸入路由、交易類別、備援與區域序號選擇client，SWHCLINT依奇偶調整尾碼配合服務切換。SYNCGEN將對應key資料交給缺少的FGSGEN1巨集；目前可以追蹤搬移與呼叫位置，巨集的演算法則要取得來源後才能確認。

OCPRTN最多處理四個format描述槽。FMTOUT→DYLOAD以SYSDLD00載入名稱，再CALL(15)執行；動態相依無法單靠literal CALL枚舉。CODECNV依目的呼叫GBCODEA或SYSCODEA。ISRTMSG先ASMTDLI CHNG後依目的選ISRT格式，失敗呼叫SYSSNAP。

ISRTLOG組TXLSEG並透過ASMTDLI ISRT；ENQBMP送出另一類訊息。OCPEHP執行ROLB，成功後REPODB，依情況REPOAT/REGSTAN及REPOLC重新定位；失敗填返回碼並診斷。REGSTAN可用既有端末序號或呼叫STANGEN，**沒有直接證據連到STANCVT**。SENDERR組對應錯誤訊息再ISRTMSG。

缺少IBBAR、IBDSECT、ASMMSP、FGSGEN1等COPY與外部程式，另有SAVEAREA與可改寫靜態欄位，因此重入、併發、資料長度與交易一致性，需要搭配實際 link-edit／runtime 設定與測試確認。

## 接著可以查什麼

CKP02 可以繼續查正式 JCL 與重跑流程；CIS14 可以追蹤外部呼叫和 IMS 設定；STANCVT 可以確認呼叫方的序號使用方式；SYSOCP31 則需要補上巨集與動態載入的程式。這些資料有助於把程式閱讀延伸到實際執行。
