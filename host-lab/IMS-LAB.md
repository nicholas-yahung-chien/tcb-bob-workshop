# CKP02 與真實 IMS 資料庫延伸練習

本練習確實執行 IMS DL/I 資料庫呼叫，再串接原本的 CKP02；測試資料仍是課程的七筆合成資料。這是獨立批次 IMS DB，不是線上 IMS 交易，也不使用客戶或共享 IVP 範例資料庫。

## 準備與執行

1. 開啟已備妥的個人 `<帳號>.TCBLAB.COBOL`，其中有 CKP02、GENCKP、CHKCKP，以及本練習新增的 IMSCKP。IMSCKP 對應教材 `z-tests/IMSCKP.cbl`，可直接閱讀，不需上傳。使用既有 tcb-rse／IBM-1371 連線。
2. 在 Zowe Explorer 的「資料集 → tcb-rse」搜尋自己的 `<帳號>.TCBLAB.JCL`，開啟已備妥的 `IMSRUN`。它與教材 `z-tests/ims-run.jcl` 內容相同，使用 `&SYSUID` 指向提交者自己的 COBOL 資料集。學員不需要產生、下載或上傳另一份 JCL。
3. 將本機 `z-tests/ims-run.jcl`、`z-tests/IMSCKP.cbl` 與個人環境資料交給 Bob 說明流程，把執行前核對結果保存在 `host-lab/ims/review.md`。核對遠端 IMSRUN 與教材範本一致，CIMS 的 SYSIN 應讀取自己的 COBOL(IMSCKP)，不更改共享 IMS 設定。
4. 在自己的遠端 `IMSRUN` 成員按右鍵，選取提交作業（Submit Job）。記下實際 job ID；作業名稱為 TCBIMSP，使用 owner 篩選自己的作業。原本的 RUN 成員不變。
5. 完成後檢查下表的步驟及訊息。依實際下載的資料夾讀取紀錄，把分析保存在 `host-lab/ims/test-report.md`；缺少的證據列為待確認。

IMSCKP 已拆成獨立原始碼：本機為 `z-tests/IMSCKP.cbl`，遠端為 `<帳號>.TCBLAB.COBOL(IMSCKP)`。IMSRUN 不再內嵌 COBOL；CIMS 從該成員編譯，LIMS 連結至作業專用的暫存程式庫。DBD 與 PSB 定義仍保留在 JCL 中。提交後由作業自動組譯、編譯、建立隔離資料庫及載入測資，不需學員額外部署或初始化。作業結束只清除暫存執行檔與資料庫，遠端 IMSCKP 原始碼成員會保留。既有 CKP02 不變，沒有改成另一套 IMS 轉換邏輯。

只有想修改作業時，才另存個人 `host-lab/ims/run.jcl`，保留遠端已備妥的 IMSRUN。提交個人版本後，分析時須加入實際提交的 JCL，不能仍把共用範本當成本次版本。

這份 JCL 對應目前課程主機：CLASS=A、MSGCLASS=H、UNIT=3390、VOL=DEVVS1、STORCLAS=SCNOSMS；IMS 執行庫為 `IMS.V15R1M0.SDFSRESL`，巨集庫為 `IMS.V15R1M0.SDFSMAC`，PROCLIB 為 `IMS.V15R1M0.PROCLIB`。COBOL 編譯庫為 `IGY.V6R4M0.SIGYCOMP`，Language Environment 使用 `CEE.SCEELKED`／`CEE.SCEERUN`，組譯及連結使用主機可取得的 ASMA90／IEWL。這些名稱是既有環境設定，不代表其他主機可以直接沿用。已為 22 個學員帳號與 3 個講師帳號備妥遠端 IMSRUN 與獨立的 IMSCKP，逐帳號讀回核對。獨立來源版本另以講師與學員帳號實際提交通過。不需為本練習授予管理共享 IMS 的權限；尚未驗證全班同時執行的容量。

## 這次作業真的做了什麼

| 步驟 | 動作與核對依據 |
| --- | --- |
| GENERATE | 產生與前面相同的七筆、每筆 400 bytes 的中文測試資料；PRINTDD 保留完整資料樣態。 |
| DBLOAD | 用 ISRT 把七筆資料放入本次作業的 IMS HDAM 資料庫。新增資料沒有「轉換前的 IMS 值」。 |
| EXPORT | 用 GU 依 CASEKEY 讀出七筆資料，輸出為 400-byte 循序檔。 |
| BASECHK | 在轉換前重新 GU，逐筆比較整個 400-byte payload 與原始測資；應為 CHECKED=0007 ERRORS=0000。 |
| CONVERT | 真正執行原本的 CKP02，更新 EXPORT 產生的循序檔。 |
| CHKFILE | 用 CHKCKP 比較轉換檔與已知預期結果，每筆須 PASS ALL 400 BYTES，最後 ERRORS=0000。 |
| ROLLBACK | 逐筆 GHU、REPL，模擬不接受此次更新，呼叫 ROLB 後再 GU；比較全部 400 bytes 是否恢復到該次更新前。ROLB STATUS 應為兩個空白，ERRORS=0000。 |
| UPDATE | 重新 GHU、REPL 套用 CKP02 的結果，再 CHKP 提交；CHKP STATUS 應為兩個空白。 |
| VERIFY | 另一個 IMS 批次步驟重新 GU，比較全部 400 bytes 是否等於 CKP02 的轉換結果；CHECKED=0007 ERRORS=0000。 |
| PROLLBAC、PUPDATE | IBM DFSERA10 讀取 ROLLBACK、UPDATE 的真實 IEFRDER 系統日誌，產生十六進位列印。應有 DFS707I、DFS708I、DFS703I 正常結束訊息。 |

原 CKP02 的 CCKP 編譯步驟仍可能 RC 0004，原因須核對實際編譯清單；其他上述執行與比對步驟應為 RC 0000。整項作業 RC 0004 不代表 IMS 更新或比對失敗，也不能只看最高 RC 就說全部成功。本練習保留原程式基準，不自動使用 RC 0000 延伸練習的修正版。

例如 CASE 0001 的 ROLLBACK 應可看到 BEFORE-ID="0012345678"、TARGET-ID="12345678  "、AFTER-ROLB-ID="0012345678"。ID 只是方便閱讀；程式實際比較全部 400 bytes。

## 資料模型、隔離與重置

DBD 名稱 TCBCKDB，單一根區段 CKPROOT 為 404 bytes：前四個 bytes 是測試專用 CASEKEY，其後才是原本完整的 400-byte 資料。CASEKEY 不等於被 CKP02 修改的 ID；後者可能重複或空白，不能直接當本練習的 IMS 唯一索引鍵。這是教學模型，不宣稱是客戶資料庫結構。

TCBCKPL 是載入 PSB；TCBCKPU 是更新／查詢 PSB。PSB 使用 CMPAT=YES，提供 I/O PCB 作為 CHKP／ROLB 呼叫的參數，DB PCB 則用於 GU／GHU／ISRT／REPL。

每項作業有自己產生的暫存 DBD／PSB／程式庫、資料庫與日誌，不更新共享 IVP 資料庫或 ACBLIB。DBRC=NO、IRLM=NO 僅用於這個獨立暫存批次練習，不是正式環境建議。重新提交會從七筆原始測資重新建庫；作業結束時暫存資料集自動清除，不需要手動清除共享資料。

這裡驗證的是程式主動以 ROLB 取消更新，以及 CHKP 後重新查詢的提交結果；尚未驗證強制終止、主機故障、XRST 或線上交易復原。不得把重新產生測資當成 IMS rollback。

## 三種紀錄要分開

- **應用程式診斷：** 各步驟 SYSOUT 的 APPLICATION DIAGNOSTIC、呼叫狀態、前後 ID 與 400-byte 比對；由 IMSCKP 自己印出。
- **JES 與 IMS 執行訊息：** JESYSMSG 的 IEF142I 證明哪些步驟執行及 RC；JESMSGLG 的 DFS035I 是 IMS 批次初始化，DFS681I 可佐證本次 CHKP。訊息中的預設 IMSID 不代表它是在共享控制區執行線上交易。
- **IMS 系統日誌：** IEFRDER 的原始二進位日誌，由 IMS 執行期產生；PROLLBAC／PUPDATE 的 SYSPRINT 是 DFSERA10 對該日誌的真實十六進位列印，不是人工 CSV。此練習保留列印於 JES，原始暫存日誌隨作業清除；不是永久日誌保存或災難復原設計。

DFSERA10 右側字元欄不一定能呈現雙位元中文字，核對紀錄時以十六進位資料為準。不要把十六進位的紀錄種類或筆數自行當成業務交易筆數。

中文 PRINTDD 與編譯清單請單獨開啟、確認中文正常後另存 UTF-8；「全部下載」尚不能保證正確轉碼。ASCII 診斷與十六進位日誌列印可供 Bob 一起閱讀，請保留 job ID、step 與 DD 名稱。

## IBM 官方依據

- [批次程式的 ROLL／ROLB](https://www.ibm.com/docs/en/ims/15.5.0?topic=rdmdi-backing-out-database-updates-dynamically-roll-rolb-commands)：本練習使用 DASD 日誌及 BKO=Y。
- [DFSERA10 系統日誌列印](https://www.ibm.com/docs/en/ims/15.5.0?topic=reports-file-select-formatting-print-utility-dfsera10)。
- [IMS ISRT 呼叫](https://www.ibm.com/docs/en/ims/15.4.0?topic=management-isrt-call)。


IMSEVTS 是獨立的 IMS 事件練習，請依 host-lab/IMS-EVENTS.md 與 specs/log-schema.md 核對，閱讀 z-tests/IMSEVT.cbl、z-tests/imsevts.jcl。不要套用 IMSRUN 的步驟清單：IMSEVTS 共 17 步，16 步 RC 0，只有 CUT 預期 U3001，且 CHECKA 必須執行。報告另存 host-lab/ims/events-report.md；只提供部分紀錄時保留待確認，補齊後更新結論。
