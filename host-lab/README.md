# CKP02 主機練習

這個練習在 z/OS 編譯並執行 CKP02，使用七筆合成資料比較第一次與第二次執行的結果，再確認空檔能正常結束。每項作業使用獨立暫存資料集。

開始前，先確認自己的主機連線可用，並備妥本場提供的作業名稱與配置值。操作步驟與對話範例請看 [WORKTHROUGH.md](WORKTHROUGH.md)。

連線與帳號使用方式請看 [CONNECTION.md](CONNECTION.md)。將不含密碼的個人配置放在 output/host-lab/environment.md；Bob 應保留這份檔案。

在 Bob 對話中，可以先請它閱讀 `fixtures.json` 和 CKP02，說明每筆資料應如何變化，再檢視產生的 JCL。`GENCKP` 建立測資，`CHKCKP` 比較整筆 400 bytes；這兩支是練習的輔助程式。CKP02 本身沒有新增 log 或 IMS 呼叫。

請將 [BOB-GUIDE.md](BOB-GUIDE.md) 交給 Bob，依第二節從 templates/run.jcl 建立個人作業，依第三節分析實際紀錄。不需要本機 Python。範本保留相同的程式與七筆測資，僅替換個人 job 名稱；完成後先審閱，再由學員提交。

作業應依序完成配置、三支程式的編譯與連結、測資建立、第一次執行與比對、第二次執行與比對，以及空檔執行。編譯警告需要逐項核對，連結必須 RC 0；提交成功不等於作業成功。兩次比對各應顯示 `CHECKED=0007 ERRORS=0000`，且每筆完整 400 bytes 相同。

這版 CKP02 的實測編譯結果為 RC 4：清單包含序號欄位警告 `IGYLI0090-W`、對應摘要 `IGYSC0205-W`，以及 `IGYCB7310-W`，指出呼叫關檔段落的 PERFORM 不會返回。該段落以 `STOP RUN` 結束程式。三個連結與後續執行、比對步驟均為 RC 0；遇到不同警告或步驟未執行時，應先檢查清單。

所需環境：與來源相容的 Enterprise COBOL、LE、JES、可寫入的 DASD 資料集空間及個人工作權限。JCL 中的 compiler library、LE library、CLASS、MSGCLASS、UNIT 與帳務欄位須符合使用環境。INPUT1 使用定長 400-byte 資料集，不以 USS 文字檔取代。

若暫時無法連上主機，可先完成程式閱讀與本機實作。取得實際作業紀錄後，再補上主機執行結果。
