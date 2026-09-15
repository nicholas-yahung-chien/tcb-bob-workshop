# 使用自己的主機帳號

教材已附上 `zowe.config.json` 與 `zowe.schema.json`，放在教材根目錄。主機位址、HTTPS port 與 profile 已填妥，只需要將帳號保留字換成自己的帳號，不必請 Bob 產生設定檔。

## 修改唯一的帳號欄位

1. 在 Bob 用 File → Open Folder 開啟下載的教材資料夾本身。
2. 開啟根目錄的 `zowe.config.json`，找到唯一的 `YOUR_USER_ID`。
3. 換成分配給你的帳號，例如 `TCBINS1`，保留前後雙引號，儲存檔案。

```json
"user": "YOUR_USER_ID"
```

本次工作坊的來源、JCL、作業提交與中英文作業紀錄，統一使用 `tcb-rse`（IBM-1371），透過 IBM RSE API（8195）連線。教材設定與已通過 GUI 驗證的配置一致，不另外設定 jobEncoding。不要變更 profile 名稱、defaults、host 或 port。

## 在 Zowe Explorer 登入

1. 確認 IBM Z Open Editor 與 Zowe Explorer 都已啟用；IBM Z Open Editor 提供 RSE 連線支援。儲存設定後若尚未看到 `tcb-rse`，執行 Developer: Reload Window，再查看資料集與工作區塊。
2. 選取 `tcb-rse`，使用 Zowe 的認證介面輸入分配的密碼。密碼只在認證欄位輸入，不寫進 JSON，也不貼到 Bob 對話。
3. 在資料集的 tcb-rse 搜尋 `<自己的帳號>.TCBLAB.*`，應能找到已備妥的 `<自己的帳號>.TCBLAB.COBOL`（CKP02、GENCKP、CHKCKP 三個成員）與 `<自己的帳號>.TCBLAB.JCL`（RUN 成員）。COBOL 以 tcb-rse 開啟，JCL 以 tcb-rse 開啟。在 JOBS 選 tcb-rse，將 owner 篩選為自己的帳號；尚未提交作業時，作業清單可能為空。來源資料集找不到時先確認帳號與篩選條件，再請講師協助，不使用其他帳號的資料集。

若只看到舊的 `zosmf` 或 `rse`，先確認開啟的是本次教材根目錄。不要修改父資料夾或全域 profile。本次驗證限工作坊資料；其他資料集需依其實際字碼選擇。無中文不代表字碼完全相容。不要把 IBM-937 套用到所有 USS 檔案、binary 資料或 load module。若出現 `profLoc` 等擴充套件錯誤，保留訊息及目前設定檔位置，先停止更新認證；不能只憑這個錯誤判定密碼錯誤或主機拒絕登入。

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

關閉先前以 tcb-zosmf 開啟的遠端分頁，不儲存異常內容。按 Ctrl+Shift+P 執行 Developer: Reload Window，再從資料集的 tcb-rse 開啟自己的 TCBLAB.COBOL(CKP02)。應能分行顯示並看到中文註解。JCL(RUN) 與 JES 系統紀錄從 tcb-rse 開啟；比對輸出從 tcb-rse 開啟，含中文的編譯清單從 tcb-rse 開啟。

教材已將來源連線改為 RSE，避開本環境 z/OSMF 將 IBM-937 的記錄分隔符轉為 NEL 的問題。這不需要更改主機成員、刪除中文或安裝自訂擴充套件。若未出現 tcb-rse，先確認 IBM Z Open Editor 已啟用，再重新載入視窗。

## 讀取中文作業輸出

本次工作坊統一使用 tcb-rse（IBM-1371）開啟來源、JCL、JES 紀錄、中文 PRINTDD 與編譯清單。從「工作 → tcb-rse → 自己的作業」開啟所需 DD，確認中文與換行正常，再另存至 host-lab/logs/<job ID>/<step>/。保留雙引號內尾端空白；Alt+Z 可切換畫面自動折行。

若仍顯示舊的異常內容，關閉舊分頁並執行 Developer: Reload Window，再從 tcb-rse 開啟。仍有問題時，可由講師使用已安裝的官方 RSE CLI 指定字碼重新讀取；JOB12345 與 108 必須替換為實際 job ID 與 DD 編號：

```powershell
zowe rse view spool-file-by-id JOB12345 108 --rse-profile tcb-rse --encoding IBM-1371
```

這是排查用替代步驟，不是每項作業的必要前置操作。完整批次下載仍須核對中文與空白，不把失真內容當成程式事實。連線字碼調整不代表重新編碼既有來源或測資；編譯仍依教材使用 CODEPAGE(937),DBCS。
