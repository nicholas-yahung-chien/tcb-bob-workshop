請閱讀samples/cobol/IDSHIFT.cbl、samples/cobol/IDREC.cpy、samples/cobol/TESTSHIFT.cbl、samples/jcl/IDSHIFT.jcl及bank-source/reading/CKP02.TXT。
比較CKP02的內嵌資料宣告與IDSHIFT的COPY，計算10+1+389與REDEFINES。
說明IDSHIFT會修改傳入記憶體，但沒有檔案I/O；這不等於已實作dry-run。
說明JCL的EXEC對象、尚未填入的欄位、缺少的主機資訊，以及為何不能當作CKP02正式批次作業。
每項結論附檔案及行號，只作靜態解釋，不提交JCL。
