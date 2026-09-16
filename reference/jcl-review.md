# RUN 作業審閱參考

保存為 host-lab/jcl-review.md。本例為核對方式，個人帳號、實際 JCL 路徑、核對日期及版本由學員填入，未檢查項目不能填已通過。

依 host-lab/BOB-GUIDE.md，已提供的本機個人 run.jcl 可直接核對，不必重下載。CGEN／CCKP／CCHK 的 SYSIN 分別讀自己的 GENCKP／CKP02／CHKCKP；LGENCKP／LCKP02／LCHKCKP 連結到作業暫存庫。維持 CODEPAGE(937),DBCS，連線 tcb-rse／IBM-1371。來源及測資編碼與連線編碼分開說明。

| 核對項 | 應確認的內容 | 本次證據 |
|---|---|---|
| 個人配置 | 帳號、job 名稱與資料集符合 environment.md；沒有 YOURUSER 等占位文字 | 待填實際行號 |
| 執行對象 | RUNONCE、RUNTWICE、RUNEMPTY 的 PGM 是原版 CKP02 | 待填實際行號 |
| 轉換前快照 | SNAP1 在 RUNONCE 前、SNAP2 在 RUNTWICE 前；失敗不繼續該次轉換 | 待填 JCL 條件 |
| 比對 | CHECK1／CHECK2 的 BEFOREDD 指向各次快照，ACTUAL 與 EXPECT 由 CHKCKP 比對完整 400 bytes | 待填 DD |
| 空檔 | RUNEMPTY 使用 &&EMPTY | 待填 DD |
| 隔離 | &&WORK 等為本項作業暫存，資料 FB400；PRINTDD FB402 含兩端雙引號 | 待填配置 |

本例不代表已提交或編譯。靜態核對完成後，實際結果寫入 host-lab/test-report.md。第 05 的 CKP02H 不使用此流程上傳或執行。
