# IBM-937 教材驗證紀錄

2026-09-14：教材以 `z-lab/CKP02.cbl` 為閱讀與編譯的共同來源。封裝時將閱讀版 CRLF 統一為 LF，內容、中文註解及欄位位置不變；`source-manifest.json` 記錄封裝後的雜湊。此文件供維護使用，不納入學員 ZIP。

## 2026-09-15 同名成員與預先配置

- 已為 TCB2101–TCB2110、TCB2401–TCB2412、TCBINS1–TCBINS3 共 25 個帳號準備各自的 `TCBLAB.COBOL` 與 `TCBLAB.JCL`，皆為 PDSE、FB80、DEVVS1、SCNOSMS。保留舊資料集與既有成果，新增配置前檢查名稱及內容，遇到不同內容不覆寫。
- 每個 COBOL 資料集有 CKP02、GENCKP、CHKCKP，來源分別是教材 z-lab/CKP02.cbl、z-tests/GENCKP.cbl、z-tests/CHKCKP.cbl，以 IBM-937 寫入。JCL(RUN) 來自 z-tests/run.jcl，只替換個人帳號與 job 名稱，以 IBM-1047 寫入。三個編譯步驟都從同名來源成員讀取，不再內嵌 COBOL。
- 以各帳號本人認證完成 100 個成員的文字回讀與二進位 FB80 比對。IBM-937 預期位元組由主機 iconv 轉換，再按行補齊 80 bytes；確認沒有超長行且每行 SO/SI 配對。對照新版 82 檔教材 ZIP 的 SHA-256，確認每個主機成員與封裝來源一致（JCL 僅個人化）。
- TCBINS1 的 JOB00743、TCB2101 的 JOB00771、TCB2401 的 JOB00770 均完成 13 個步驟；後兩項直接讀取預先備妥的 JCL(RUN) 後提交。三項作業的 CGEN、CCKP、CCHK 清單都有 CODEPAGE(937),DBCS；CCKP 為既有三種警告的 RC 4，其餘 12 步 RC 0。每項作業的 CHECK1、CHECK2 各七筆完整 400-byte 比對通過，RUNEMPTY 實際執行且 RC 0。
- 證據保存在維護工作區 `.work/named-lab-validation/` 的個人配置紀錄及三項作業紀錄，不納入學員 ZIP。這些是基準測試，並未實作新增的預覽需求。其他帳號完成成員配置與讀回核對，未宣稱逐一執行作業。

## 2026-09-14 歷史驗證（舊版 SRC937 配置）

- TCBINS1 經 z/OSMF 8192，以 UTF-8/LF 與 `X-IBM-Data-Type: text;fileEncoding=IBM-937` 寫入個人來源資料集。102 行來源轉換後最長 72 bytes，FB80 共 8,160 bytes；文字往返與轉換後補齊的二進位內容均一致。
- JOB00676、JOB00677 完成隔離測試。25 個學員與講師帳號已各自配置 `<帳號>.TCBLAB.SRC937`（PS、FB80、DEVVS1、SCNOSMS），並用各自帳號核對文字與二進位內容。
- JOB00702 使用本次下載包的 JCL，僅替換 job 名稱與來源資料集為 `TCBINS1.TCBLAB.SRC937`。CCKP 清單確認 `CODEPAGE(937),DBCS`，RC 4 為已知警告；其餘 12 個步驟 RC 0。CHECK1、CHECK2 各七筆完整 400-byte 比對通過，`CHECKED=0007 ERRORS=0000`；RUNEMPTY 實際執行且 RC 0。
- 封裝後 CKP02 SHA-256：`c0a829feb688b5dd0c5e9d726c325392da50b1e64ccea8990a6c7f1380198f6e`。79 份學員檔案中包含 45 份已核對雜湊的 z-lab 檔案；無 CKP02 範本、網站、prompts、bank-source 或 reference。參考答案仍獨立封裝。

## 編碼範圍

`tcb-zosmf` 使用 IBM-937 讀寫課程來源資料集；`tcb-jobs` 使用 IBM-1047 提交 JCL 與讀取一般紀錄。兩者共用 `tcb-base` 認證。沒有修改 z/OSMF 或其他應用的全域編碼，也沒有把一般 MVS 資料集標示成帶有 CCSID 標籤。

IBM-937 的單位元組部分並非完全等同 IBM-1047；實測 `[`、`]`、`^` 的位元組不同，因此不能以「沒有中文」判定可互換。GENCKP、CHKCKP 是測資與比較輔助程式，不是 CKP02 的替代版本；新版與 CKP02 一樣放在 COBOL 資料集，以 IBM-937 保存，不再內嵌於 JCL。暫存商業資料、load module 與其他 binary 檔案不做文字轉碼。

## 待課程操作驗證

驗證使用 z/OSMF API；新版不再要求學員貼上來源。Bob/Zowe Explorer 的展開成員、Download Member... 下載與從本機提交流程仍需以學員實際版本驗證。RSE API 與 15 人同時操作未在本次重新測試。編譯清單包含中文時需核對該 DD 的解碼方式，不能宣稱所有 JES 紀錄均是 IBM-937。這些結果也不代表其餘 44 份 z-lab 程式與相依檔案均已編譯或可獨立執行。

## 官方說明

- [IBM：EBCDIC 編碼與 Zowe 設定](https://ibm.github.io/zopeneditor-about/Docs/ebcdic_encoding.html)
- [IBM：寫入 z/OS 資料集的 REST 介面](https://www.ibm.com/docs/en/zos/3.1.0?topic=interface-write-data-zos-data-set-member)
- [Zowe：下載資料集成員與下載選項](https://docs.zowe.org/stable/user-guide/ze-working-with-data-sets/#downloading-a-data-set-member)
- [Zowe：團隊設定](https://docs.zowe.org/v3.3.x/user-guide/cli-using-editing-team-configuration/)
- [Zowe Explorer：版本紀錄](https://github.com/zowe/zowe-explorer-vscode/releases)（包括 Windows CRLF 傳輸修正；教材統一為 LF，避免依賴特定修正版本。）
