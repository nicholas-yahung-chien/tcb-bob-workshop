# 使用自己的主機帳號

教材根目錄已備妥 `zowe.config.json` 與 `zowe.schema.json`。先在課程網頁登記帳號，再用 Agent 模式請 Bob 設定：

> 我選的帳號是〈填入帳號〉。請依 CONNECTION.md，幫我把帳號和密碼直接填進這個工作區的 zowe.config.json，讓我可以用 Zowe Explorer 登入。完成後告訴我怎麼查看自己的資料集和作業。

## 填入本機登入資訊

Bob 只修改目前教材工作區根目錄的 `zowe.config.json`，依下列步驟處理：

1. 將學員提供的帳號轉成大寫，填入 `profiles.tcb-base.properties.user`。尚未提供帳號時先詢問，不自行挑選。
2. 密碼使用帳號第一個字母大寫、其餘英文字母小寫，再接 `TCBBob@2026`，填入同一 profile 的 `properties.password`。這次練習明確使用本機明文設定，不查詢其他位置的密碼。
3. 從這份設定中相關 profile 的 `secure` 清單移除 `user`、`password`，保留其他項目。確認 `tcb-rse` 沒有另外指定不同的帳號密碼；若有，只移除這份檔案內的重複認證欄位，讓它使用 `tcb-base`。保留 host、port、defaults、編碼及其餘設定。
4. 確認 JSON 可正常解析，帳號與密碼規則一致；回覆只說明帳號及設定完成，不列印密碼或整份設定。
5. 不修改父資料夾、全域 profile、憑證庫或 Zowe Explorer 儲存狀態。若另有專案使用者設定覆蓋這些欄位，說明衝突位置，先請學員確認，不直接刪除其他設定。

明文密碼只放在自己的本機設定檔，不複製到 AGENTS.md、environment.md、報告或共用教材，也不要提交到 Git。

本次工作坊的來源、JCL、作業提交與中英文作業紀錄，統一使用 `tcb-rse`（IBM-1371），透過 IBM RSE API（8195）連線。保留教材的 profile 名稱、defaults、host 與 port，其餘字碼設定也沿用範本即可。

## 在 Zowe Explorer 登入

1. 確認 IBM Z Open Editor 與 Zowe Explorer 都已啟用；IBM Z Open Editor 提供 RSE 連線支援。儲存設定後查看資料集與工作區塊。若尚未看到 `tcb-rse`，點「資料集」的 **＋（Add profile）**，選擇帶資料夾圖示、屬於目前教材工作區的 **tcb-rse**；出現是否適用所有目錄結構的詢問時選擇**是**，再確認資料集與工作都顯示此連線。這是加入教材已有的 profile，不建立另一份設定檔。若加入清單也沒有它，確認開啟的是含 `zowe.config.json` 的教材根目錄，再執行 Developer: Reload Window 後重試。
2. 選取目前教材工作區的 `tcb-rse`，使用剛才儲存的登入資訊。如果仍提示密碼或顯示舊帳號，先確認選到正確工作區的 profile，再執行 Developer: Reload Window。仍有問題時請講師協助檢查設定覆蓋或已保存的認證，不反覆嘗試登入。
3. 在資料集的 tcb-rse 搜尋 `<自己的帳號>.TCBLAB.*`，應能找到已備妥的 `<自己的帳號>.TCBLAB.COBOL`（CKP02、GENCKP、CHKCKP 三個成員）與 `<自己的帳號>.TCBLAB.JCL`（RUN 成員）。COBOL 以 tcb-rse 開啟，JCL 以 tcb-rse 開啟。在 JOBS 選 tcb-rse，將 Owner 篩選為自己的帳號，Prefix 與 Status 設為 `*`；尚未提交作業時，作業清單可能為空。來源資料集找不到時先確認帳號與篩選條件，再請講師協助，不使用其他帳號的資料集。

篩選器不會變更登入身分。請核對連線實際使用的帳號；若成員清單出現 `Abend`、`EXECIO`、`System` 等異常項目，保留訊息，先檢查登入帳號是否與資料集擁有者一致，不直接建立或覆寫成員。

若只看到舊的 `zosmf` 或 `rse`，先確認開啟的是本次教材根目錄。不要修改父資料夾或全域 profile。課程資料沿用教材字碼設定；閱讀其他資料集時，請先確認其編碼。文字轉碼不適用於 binary 資料或 load module；其他 USS 檔案須依實際編碼處理。若出現 `profLoc` 等擴充套件錯誤，保留訊息及目前設定檔位置，先停止更新認證；不能只憑這個錯誤判定密碼錯誤或主機拒絕登入。

本次個人 profile 使用 `rejectUnauthorized: false`，不需另外設定 CA 信任。HTTPS 仍加密，但不驗證伺服器憑證；這個設定僅供本次工作坊，不套用到正式系統。

## 建立個人作業配置

請使用分配給你的個人帳號，讓提交的作業與查詢結果都能對應到自己的練習。

`host-lab/environment.md` 是這一步才建立的個人文件，下載教材或登入 Zowe 時不會自動產生。確認已能查詢自己的資料集與作業後，從課程網頁複製「記下我的作業配置」prompt，交給 Bob 執行。

Bob 建立文件時，依序完成以下事項：

1. 從教材根目錄 zowe.config.json 只讀取 profiles.tcb-base.properties.user、defaults.rse 與 profiles.tcb-rse.properties.encoding。不要輸出整份設定或讀取認證。帳號仍是 YOUR_USER_ID 時先請學員填入。
2. 將帳號轉為大寫，使用「帳號加 A」作為 job 名稱，例如 TCB2101A。job 名稱須以 TCB 開頭、共 4–8 個大寫英文字母或數字；不符合時先詢問學員要使用的名稱，不截斷帳號。
3. 建立 `host-lab` 資料夾與 `environment.md`。已有文件時先比較；內容相同就沿用，有差異則列出差異並詢問，不覆寫個人修改。
4. 文件使用下列欄位，將中括號換成實際值，不包含密碼。volume 與 storage class 使用本練習範本的 DEVVS1、SCNOSMS。

```markdown
# 我的主機作業配置

- 帳號：[自己的帳號]
- 來源連線：tcb-rse（IBM-1371）
- 作業連線：tcb-rse（IBM-1371）
- 中文編譯清單：tcb-rse（IBM-1371）
- CHECK1、CHECK2 比對輸出：tcb-rse（IBM-1371）
- 本機來源：z-lab/CKP02.cbl（UTF-8、LF）
- 來源資料集：[自己的帳號].TCBLAB.COBOL(CKP02)（PDSE、FB、LRECL=80）
- 測試輔助程式：同一 COBOL 資料集的 GENCKP、CHKCKP 成員
- 已備妥作業：[自己的帳號].TCBLAB.JCL(RUN)（PDSE、FB、LRECL=80）
- 編譯選項：CODEPAGE(937),DBCS
- Job 名稱：[帳號加 A]
- Volume：DEVVS1
- Storage class：SCNOSMS
```

完成後開啟這份文件，確認帳號與 Zowe 登入帳號一致、job 名稱正確、沒有保留字或密碼，再繼續準備 JCL。建立配置文件不代表已提交或執行任何作業。

## 執行與保留成果

依課程網頁開啟已備妥的 CKP02，直接核對並提交現有的 host-lab/run.jcl；本機缺少 JCL 時才從自己的遠端 RUN 下載一次。提交後，從回傳的 job ID 開啟紀錄並核對 owner。將 spool 保存於 `host-lab/logs/<job ID>/`，同名 DD 依 step 分開放置。

每項作業重新建立自己的暫存測資。教材與下載的 log 保存在本機；USS 個人目錄只存輕量設定。讀取逾時可以重新整理；提交逾時先搜尋自己的 jobs，確認是否已建立工作，不立即重送。

CKP02 不呼叫 IMS，JES、編譯清單與比較結果不是 IMS transaction log。這個練習不需要啟停 IMS region 或 console 操作權限。

## 遠端程式擠成一行時

關閉先前以舊連線或舊編碼開啟的遠端分頁，不儲存異常內容。按 Ctrl+Shift+P 執行 Developer: Reload Window，再從資料集的 tcb-rse 開啟自己的 TCBLAB.COBOL(CKP02)。應能分行顯示並看到中文註解。JCL(RUN) 與 JES 系統紀錄從 tcb-rse 開啟；比對輸出從 tcb-rse 開啟，含中文的編譯清單從 tcb-rse 開啟。

目前經驗證的操作配置是 tcb-rse（IBM-1371）。這不需要更改主機成員、刪除中文或安裝自訂擴充套件。若未出現 tcb-rse，先確認 IBM Z Open Editor 已啟用，再重新載入視窗。

## 讀取中文作業輸出

使用 tcb-rse（IBM-1371），在「工作」對自己的 JOB 按右鍵選「全部下載」，保存完整紀錄，例如 host-lab/logs/<job ID>/。保留下載產生的檔名與目錄結構，不選「以二進位全部下載」。開啟下載的 PRINTDD 與編譯清單，確認中文、換行及雙引號內的空白正常；若個別檔案有亂碼，再從 tcb-rse 開啟該 DD，載入全部內容並另存 UTF-8 副本。Alt+Z 可切換畫面自動折行。

若仍顯示舊的異常內容，關閉舊分頁並執行 Developer: Reload Window，再從 tcb-rse 開啟。仍有問題時，可由講師使用已安裝的官方 RSE CLI 指定字碼重新讀取；JOB12345 與 108 必須替換為實際 job ID 與 DD 編號：

```powershell
zowe rse view spool-file-by-id JOB12345 108 --rse-profile tcb-rse --encoding IBM-1371
```

這是排查用替代步驟，不是每項作業的必要前置操作。若下載時已發生錯誤轉碼，單純更換本機開啟編碼無法還原中文；請從 tcb-rse 開啟受影響的 DD，確認文字正常並載入所有頁面後，另存 UTF-8 副本。正常的下載檔可直接使用。編譯仍依教材使用 CODEPAGE(937),DBCS。
