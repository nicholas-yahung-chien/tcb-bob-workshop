# 中文 IBM-937 測資導入

使用者已確認：官方 RSE CLI 指定 IBM-937 讀取 JOB00983／PRINTDD(108) 後，從 Zowe Explorer 的 tcb-rse 開啟可正常顯示中文。因此將中文原型納入正式教材與主機程式。

GENCKP 來源維持 UTF-8／LF，主機傳輸及編譯使用 IBM-937、CODEPAGE(937),DBCS。姓名、公司名稱、地址及備註改用虛構中文，識別值與 once、twice 回歸預期不變；CKP02 未修改。欄寬計入 DBCS 與 SO/SI，不以 Unicode 字數代替 bytes，超出欄寬即拒絕產生。PRINTDD 保留單行 400-byte 資料與前後雙引號；摘要改為 EOF-MARKER-AT-014=YES/NO，避免將半個中文字直接顯示。

25 個課程帳號的 GENCKP 均已更新，主機二進位內容與 IBM-937 轉碼結果一致，RSE 來源讀回亦相符。學員帳號 TCB2101／JOB01010、TCB2401／JOB01012 皆實際完成 15 步，CCKP RC 4、其餘 RC 0；CHECK1、CHECK2 各七筆 PASS、ERRORS=0000；RUNEMPTY RC 0。各筆中文輸出與欄位補白預期一致，回轉 IBM-937 後皆為 400 bytes，SO/SI 成對，第 14–16 bytes 僅 CASE 0003 為 EOF，末 91 bytes 全空白。

RSE 伺服器串流問題仍存在：相同 rawContent 請求的解碼可能受前次 JSON content 請求影響。已以外掛相同標頭重現，不能歸因為標頭大小寫或額外參數。官方 RSE CLI 6.7.1 的 view spool-file-by-id --encoding IBM-937 已驗證可正確取得中文，且後續串流內容一致。此為替代讀取流程，不是伺服器修補。

00、03、04 網頁及 CONNECTION、BOB-GUIDE 說明每項新作業都需用自己的 job ID 與中文 DD spool ID 執行該命令；範例編號不可固定套用。JCL、JES、英文摘要及 CHECK1/CHECK2 維持 IBM-1047；中文 PRINTDD、CGEN/CCKP 編譯清單使用 IBM-937。課前需安裝符合官方相容性要求的 Zowe CLI 與 RSE 外掛。

維護備份與逐筆驗證資料留在私有工作目錄，不納入學員 ZIP。使用者的既有文件與作業紀錄保留。
