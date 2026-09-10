請閱讀 AGENTS.md、SOURCE-MAP.md、specs/change-request.md、specs/customer-context.md、bank-source/reading/CKP02.TXT、samples/cobol/IDSHIFT.cbl、IDREC.cpy，及前一步可用的CR-01規劃。
切換 Agent 模式，只建立 output/architecture.md 與 output/checklist.md；若本對話沒有前一步內容，依相同需求重建計畫。
architecture必須有As-is、To-be、資料流、風險、缺件，以及COBOL、Java、Database、Transaction、API、Batch、Test七個領域的分析；明確區分來源事實與提案。
checklist用Markdown核取清單，涵蓋分析、設計、實作、測試、部署、回復，每項列角色、依賴和驗收。加入dry-run、計數語意、非冪等重跑、備份、並行、編碼。未實際執行的項目保持未勾選。
每個來源結論引用讀過的檔案行號。未提供的Java/API/Database/JCL/主機runtime明示未知。禁止將Python驗證稱為主機驗證。
只寫上述兩個檔案，不執行程式，不實作需求。完成後摘要兩份產出與待確認事項。

請控制每份文件在1500中文字左右，避免長篇重複。交付前做一致性檢查：R-ID是11 bytes的群組，R-ID-1才是10；第14–16位在R-NAME（12–51）內，不是R-PID；COBOL常數不能推論主機使用ASCII；來源只證明沒有內建回復，不能宣稱有備份也無法回復；0000123456第一次變成00123456加兩空白，第二次變成123456加四空白，因此不能寫「轉換一次後必不再以00開頭」。
在architecture.md末尾加入一個JSON fenced block作為來源核對，鍵為id_group_bytes、id_field_bytes、marker_field、rewrite_scope、mainframe_encoding_confirmed、repeat_input、repeat_once、repeat_twice；repeat值用完整十字元字串保留尾端空白。rewrite_scope以all-read-records或eligible-only二選一。以上數值請核對來源與推導，正文不得與JSON矛盾。
