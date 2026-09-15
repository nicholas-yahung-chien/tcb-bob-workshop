# JCL 與作業紀錄的 IBM-937 驗證

2026-09-15。維護紀錄，不納入學員 ZIP。

## 修正原因

JOB00799 的 CHECK1/SYSOUT 使用 IBM-1047 讀取時，中括號變成 `Ý` 與 `¨`；以 IBM-937 讀取才是 `ACTUAL-ID=[...]`。CCKP/SYSPRINT 內的原始中文註解也需要 IBM-937。因此，原先把所有作業紀錄交由 IBM-1047 讀取的課程指引不完整。

JCL、COBOL 與 JES 訊息的產生來源不同，不能僅因 JCL 使用某字碼便推定所有輸出相同。本次驗證逐一比較實際 DD，才決定課程採用同一個 tcb-rse 連線；此結論不擴及主機其他作業。

## 設定與驗證方式

- tcb-rse 的 `encoding` 與 `jobEncoding` 均為 IBM-937。前者用於資料與 spool 下載，後者用於 JCL 提交。保留 tcb-jobs IBM-1047 供課程以外的既有資料使用。
- RUN 增加一行中文註解，來源仍是同一份 z-lab/CKP02.cbl；GENCKP、CHKCKP 與測試邏輯不變。變更前備份個人 RUN 原始位元組，只覆寫與已發布版本相同的成員。
- RSE rawContent 上傳 JCL 後，使用獨立的主機 iconv 轉換結果核對完整 FB80 位元組；再經 RSE rawContent 下載核對 UTF-8、LF、中文及每筆記錄。維護用 z/OSMF 僅讀取原始位元組作交叉驗證；學員的讀取、提交及 spool 流程均為 RSE。
- 隔離帳號 TCBINS1：JOB00806 使用遠端 dataset 提交、JOB00807 使用本機文字 string 提交，皆經 RSE、IBM-937。
- 兩項作業均有 13 個步驟；CCKP 為既有警告 RC 4，其餘 RC 0。CHECK1、CHECK2 各七筆 `PASS ALL 400 BYTES`，`CHECKED=0007 ERRORS=0000`，空檔 RC 0。JESJCL 中文註解、CCKP 中文來源與 CHECK1／CHECK2 中括號均正確。
- 這兩項作業的 JESMSGLG、JESYSMSG 在排除 RSE 額外 NEL 後，IBM-937 與 IBM-1047 讀取結果相同。
- 全部 25 個帳號（TCB2101–TCB2110、TCB2401–TCB2412、TCBINS1–TCBINS3）的 JCL(RUN) 已完成相同上傳、FB80 位元組比對與 RSE 下載核對，均為 281 筆記錄、280 個 LF，沒有 NEL 或替代字元。沒有新增資料集或成員。
- 套用後抽驗 TCB2101 JOB00833（string 提交）、TCB2401 JOB00834（dataset 提交），兩項均通過相同的 13 步、兩組七筆完整記錄、空檔、中文與中括號檢查。

## 換行與 GUI 限制

RSE spool rawContent 以 IBM-937 回傳時，每行同時帶有 NEL 與 LF。這是尚存的轉換問題，不宣稱控制字元已消除；與先前 z/OSMF 來源完全沒有 LF 不同。下載原檔保留，分析時可忽略行末 NEL，閱讀副本不得取代原始證據。

已檢查本機 Zowe Explorer 3.6.0 與 Z Open Editor 6.7.1 的實作：一般 spool 檔案開啟走 `fetchSpoolAtUri` → `downloadSingleSpool` → RSE `GetContent.jobOutput`，會傳入 profile.encoding（個別檔案覆寫優先）。RSE 舊的 `getSpoolContentById` 介面本身未傳入 profile.encoding，不能拿它代表一般檔案開啟流程。沒有修改官方擴充套件。

API 驗證不取代使用者的 GUI 核對。使用者已確認 COBOL 分行與中文正確；更新後仍需關閉舊遠端分頁並重新載入，再以 tcb-rse 開啟 RUN 及新作業的 spool。

私有原始證據在 `.work/jcl937-validation/` 與 `.work/spool-encoding-validation/`，包含備份、兩種編碼的原始回應及每項作業 validation.json；不包含在教材內。

## 官方依據

- [IBM：Zowe Explorer 的 JCL 提交與 jobEncoding](https://ibm.github.io/zopeneditor-about/Docs/interact_zos_zowe_explorer.html)
- [IBM：EBCDIC 編碼與轉換優先順序](https://ibm.github.io/zopeneditor-about/Docs/ebcdic_encoding.html)
- [IBM：RSE API 發行紀錄](https://ibm.github.io/zopeneditor-about/Blog/new-releases)
