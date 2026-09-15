# RSE 連線與換行修正驗證

2026-09-15。此文件供教材維護，不納入學員 ZIP。

本頁記錄 v1.9.1 的歷史驗證。後續實測已修正「一般作業紀錄不可統一 IBM-937」的結論：本次課程改為 tcb-rse 的 encoding 與 jobEncoding 均為 IBM-937，詳見 [JCL 與 spool 驗證](jcl937-validation.md)。舊測試只比對 PASS 字串，未驗證 IBM-937 程式輸出的中括號，不能據此宣稱 IBM-1047 適用所有 spool。

## 問題與修正

z/OSMF 以 IBM-937 讀取 CKP02 時，回應有 102 個 U+0085 NEL，沒有 LF。原始 FB80 位元組仍符合已配置的來源雜湊。先前驗證使用 Python splitlines()，把 NEL 與 LF 視為相同，漏掉 VS Code 分行相容性；來源編譯成功不等於 Zowe Explorer 顯示成功。

教材改為兩個 IBM RSE API profile，均使用 HTTPS 8195、basePath=rseapi，沿用 tcb-base 個人帳號認證：

| Profile | 用途 | 內容編碼 |
|---|---|---|
| tcb-rse | COBOL 來源 | IBM-937 |
| tcb-jobs | JCL、作業提交、狀態與一般 spool | IBM-1047 |

default rse=tcb-rse，提交及閱覽 JCL/JES 時明確選 tcb-jobs。移除教材的 tcb-zosmf profile 與 zosmf default。未更改主機現用成員、全域轉碼設定或擴充套件程式碼。

## 已驗證

- 25 個學員及講師帳號，共 100 個成員，經 RSE `/datasets/{dsn}/rawContent`、`Binary: false`、對應 Host-Encoding 與 Local-Encoding=UTF-8 下載，中文與內容一致、NEL 與 U+FFFD 均為零。
- 比對只使用 LF 分隔，不使用 splitlines()。保留實際空白記錄；CKP02 為 102 筆 FB80 記錄，RSE 回傳 101 個記錄間 LF，末筆是空白記錄。固定記錄尾端的空白填補與 UTF-8 換行不拿來冒充來源變更。
- TCBINS1 JOB00799、TCB2101 JOB00800、TCB2401 JOB00801：RSE 下載個人 JCL、以 `/jobs/string` 的 JSON jcl 欄位提交、查詢 job 與下載 spool。三項作業的 13 個步驟均執行；CCKP 是既有警告 RC 4，其餘 RC 0。CHECK1、CHECK2 各七筆完整 400 bytes 通過，RUNEMPTY RC 0。
- RSE 的完成狀態為 COMPLETED；測試不再只等待 z/OSMF 的 OUTPUT。JCL 及一般作業紀錄以 IBM-1047 讀取，不能因介面統一而把編碼也全部改為 IBM-937。
- 先前 251 個舊資料集已備份清理；隔離探測建立的 NLTEST 成員也已移除，現用資料集仍只有 COBOL 的三個來源成員與 JCL(RUN)。

## 限制與操作核對

本輪最初驗證為 API 與本機設定/schema/教材檢查；使用者後續已提供 IBM Bob 畫面，確認經 tcb-rse 開啟 CKP02 能正常分行並顯示中文註解。JCL 與 spool 的 GUI 操作另行核對，不由來源畫面推論通過。原始來源在課程中只讀；不改寫 z-lab 或主機基準程式。

另測的 JSON records 原樣回寫未通過 FB80 完全一致檢查，不能列為寫入往返成功；該測試僅使用臨時 NLTEST，已移除，沒有覆寫現用程式。若未來課程新增遠端編輯步驟，須另驗證實際 SDK 的讀取／儲存流程與末端空白記錄，不沿用本次只讀結論。

原始證據：維護工作區 `.work/rse-newline-validation/raw-read-all.json`、三項 job 目錄及各帳號 execution.json。先前 JSON 讀取探測不是串流下載驗收的替代品。

## 官方依據

- [IBM：Zowe 與 RSE profile 設定](https://ibm.github.io/zopeneditor-about/Docs/zowe_config_examples.html)
- [IBM：EBCDIC 編碼與轉換](https://ibm.github.io/zopeneditor-about/Docs/ebcdic_encoding.html)
- [VS Code：只將 CR、LF、CRLF 作為行分隔符](https://github.com/microsoft/vscode/issues/98989)
