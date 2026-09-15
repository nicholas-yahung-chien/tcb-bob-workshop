# 英文 JCL 與 JES 系統紀錄驗證

2026-09-15，維護紀錄，不納入學員 ZIP。此決策取代 v1.9.2／v1.9.3 將本次所有紀錄以 IBM-937 讀取的指引。

## 原因與範圍

RUN.jcl 不需要中文註解，也沒有內嵌 COBOL。恢復英文註解，以 IBM-1047 保存及提交；COBOL 三個來源成員與 CODEPAGE(937),DBCS 不變。只修改 JCL 的 jobEncoding 不會消除 IBM-937 spool 解碼的 NEL，因此分開指定讀取連線：

| 內容 | Profile | encoding | jobEncoding |
|---|---|---|---|
| COBOL、CCKP/SYSPRINT、CHECK1/SYSOUT、CHECK2/SYSOUT | tcb-rse | IBM-937 | IBM-1047 |
| JCL、提交作業、JESMSGLG、JESJCL、JESYSMSG | tcb-jobs | IBM-1047 | IBM-1047 |

兩個 profile 均使用 RSE API。jobEncoding 僅控制提交內容，不指定被執行程式的來源或輸出編碼。保留現有本機個人 RUN，更新註解即可；不要求重新下載。

## 實測

TCBINS1 JOB00848（dataset 提交）及 JOB00849（string 提交）均完成 13 個步驟：CCKP RC 4 是既有編譯警告，其餘 12 步 RC 0。兩次各七筆完整 400-byte 比對及空檔測試均通過。

全部 25 個帳號的 RUN 已完成位元組及下載比對。套用後抽驗 TCB2101 JOB00874（string）、TCB2401 JOB00875（dataset），均通過同一組執行及字元檢查。

三份 JES 系統紀錄以 IBM-1047 讀取均只有正常 LF，沒有 NEL 或 U+FFFD，內容為 ASCII 可表示字元。含中文的 CCKP/SYSPRINT 及程式比對輸出仍以 IBM-937 讀取，中文及中括號正確，但保留 NEL。沒有宣稱所有 DD 的行尾問題都已消失。

每個 RUN 更新前備份，核對既有 IBM-937 位元組雜湊，避免覆寫個人修改。RSE rawContent 上傳後，讀取原始 FB80 bytes 與前次已驗證的 IBM-1047 備份完全比對；再由 RSE IBM-1047 下載核對所有記錄。沒有新增資料集或成員，未改動 COBOL。

## JOB00846 發現的下載入口差異

使用者下載的 12 份檔案與 RSE 明確指定 IBM-1047 的回應逐位元組一致；CHECK1／CHECK2 的中括號成為 Ý、¨，中文也失真。遠端分頁使用 IBM-937，則中括號正確但帶 NEL。

本機 Zowe Explorer 3.6.0 的 job.actions.downloadSpool 呼叫 downloadSpoolContent 時，只傳入 jobid、jobname、outDir、binary，沒有傳入 encoding。不能以一般開啟 spool 的 fetchSpoolAtUri 流程有傳入 encoding，推論整批下載也會沿用 profile。

課程改為依 DD 開啟對應 profile 的紀錄，再從編輯器另存新檔。這項 GUI 保存操作仍由使用者逐步核對；API 測試不當作 GUI 已驗證。需要整理 IBM-937 閱讀版時，只移除 LF 前額外 NEL，保留原始回應及欄位空白。未修補或替換官方擴充套件。

私有證據：`.work/jcl1047-validation/`、`.work/job00846-analysis/`。既有 JOB00846 下載檔保留，無須重跑該作業。

官方設定說明：[IBM Zowe Explorer jobEncoding](https://ibm.github.io/zopeneditor-about/Docs/interact_zos_zowe_explorer.html)。
