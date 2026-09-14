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

## 建立個人作業配置

請使用分配給你的個人帳號，讓提交的作業與查詢結果都能對應到自己的練習。

`output/host-lab/environment.md` 是這一步才建立的個人文件，下載教材或登入 Zowe 時不會自動產生。確認已能查詢自己的資料集與作業後，從課程網頁複製「記下我的作業配置」prompt，交給 Bob 執行。

Bob 建立文件時，依序完成以下事項：

1. 從教材根目錄 `zowe.config.json` 只取 `profiles.tcb-base.properties.user` 與 `defaults.zosmf`。不要輸出整份設定，也不讀取認證儲存區或父目錄設定。帳號若仍是 YOUR_USER_ID、缺少或無法判讀，先詢問學員，不猜帳號。
2. 將帳號轉為大寫，使用「帳號加 A」作為 job 名稱，例如 TCB2101A。job 名稱須以 TCB 開頭、共 4–8 個大寫英文字母或數字；不符合時先詢問學員要使用的名稱，不截斷帳號。
3. 建立 `output/host-lab` 資料夾與 `environment.md`。已有文件時先比較；內容相同就沿用，有差異則列出差異並詢問，不覆寫個人修改。
4. 文件使用下列欄位，將中括號換成實際值，不包含密碼。volume 與 storage class 使用本練習範本的 DEVVS1、SCNOSMS。

```markdown
# 我的主機作業配置

- 帳號：[自己的帳號]
- Zowe 連線：tcb-zosmf
- Job 名稱：[帳號加 A]
- Volume：DEVVS1
- Storage class：SCNOSMS
```

完成後開啟這份文件，確認帳號與 Zowe 登入帳號一致、job 名稱正確、沒有保留字或密碼，再繼續準備 JCL。建立配置文件不代表已提交或執行任何作業。

## 執行與保留成果

依課程網頁的主機實作步驟分析 CKP02、產生並提交 run.jcl，從回傳的 job ID 開啟紀錄並核對 owner。將 spool 保存於 `output/host-lab/logs/<job ID>/`，同名 DD 依 step 分開放置。

每項作業重新建立自己的暫存測資。教材與下載的 log 保存在本機；USS 個人目錄只存輕量設定。讀取逾時可以重新整理；提交逾時先搜尋自己的 jobs，確認是否已建立工作，不立即重送。

CKP02 不呼叫 IMS，JES、編譯清單與比較結果不是 IMS transaction log。這個練習不需要啟停 IMS region 或 console 操作權限。
