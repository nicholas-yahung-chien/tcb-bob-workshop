# 使用自己的主機帳號

教材已附上 `zowe.config.json` 與 `zowe.schema.json`，放在教材根目錄。主機位址、HTTPS port 與 profile 已填妥，只需要將帳號保留字換成自己的帳號，不必請 Bob 產生設定檔。

## 修改唯一的帳號欄位

1. 在 Bob 用 File → Open Folder 開啟下載的教材資料夾本身。
2. 開啟根目錄的 `zowe.config.json`，找到唯一的 `YOUR_USER_ID`。
3. 換成分配給你的帳號，例如 `TCBINS1`，保留前後雙引號，儲存檔案。

```json
"user": "YOUR_USER_ID"
```

設定使用 `tcb-zosmf` 連線與 `tcb-base` 共用屬性。不要變更 profile 名稱、defaults、host 或 port。`YOUR_USER_ID` 是待替換文字，不是可登入的帳號。

## 在 Zowe Explorer 登入

1. 確認 Zowe Explorer 已啟用。儲存設定後若尚未看到 `tcb-zosmf`，執行 Developer: Reload Window，再查看資料集與工作區塊。
2. 選取 `tcb-zosmf`，使用 Zowe 的認證介面輸入分配的密碼。密碼只在認證欄位輸入，不寫進 JSON，也不貼到 Bob 對話。
3. 在 JOBS 將 owner 篩選為自己的帳號，並搜尋 `<自己的帳號>.TCBLAB.*` 資料集。空清單不一定是錯誤；認證成功與沒有資料要分開判斷。

若只看到舊的 `zosmf` 或 `rse`，先確認開啟的是本次教材根目錄。不要修改父資料夾或全域 profile。若出現 `profLoc` 等擴充套件錯誤，保留訊息及目前設定檔位置，先停止更新認證；不能只憑這個錯誤判定密碼錯誤或主機拒絕登入。

本次個人 profile 使用 `rejectUnauthorized: false`，不需另外設定 CA 信任。HTTPS 仍加密，但不驗證伺服器憑證；這個設定僅供本次工作坊，不套用到正式系統。

## 帳號與作業配置

請使用分配給你的個人帳號，讓提交的作業與查詢結果都能對應到自己的練習。

連線成功後，在 `output/host-lab/environment.md` 記下自己的帳號與 job 名稱，volume 使用 DEVVS1，storage class 使用 SCNOSMS。job 名稱最多八字元，例如 TCBINS1A。不要在這份文件放密碼。

## 執行與保留成果

依 WORKTHROUGH.md 分析 CKP02、產生並提交 run.jcl，從回傳的 job ID 開啟紀錄並核對 owner。將 spool 保存於 `output/host-lab/logs/<job ID>/`，同名 DD 依 step 分開放置。

每份作業重新建立自己的暫存測資。教材與下載的 log 保存在本機；USS 個人目錄只存輕量設定。讀取逾時可以重新整理；提交逾時先搜尋自己的 jobs，確認是否已建立工作，不立即重送。

CKP02 不呼叫 IMS，JES、編譯清單與比較結果不是 IMS transaction log。這個練習不需要啟停 IMS region 或 console 操作權限。
