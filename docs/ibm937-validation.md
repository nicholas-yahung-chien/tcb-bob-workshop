# IBM-937 教材驗證紀錄

2026-09-14：教材以 `z-lab/CKP02.cbl` 為閱讀與編譯的共同來源。封裝時將閱讀版 CRLF 統一為 LF，內容、中文註解及欄位位置不變；`source-manifest.json` 記錄封裝後的雜湊。此文件供維護使用，不納入學員 ZIP。

## 已驗證

- TCBINS1 經 z/OSMF 8192，以 UTF-8/LF 與 `X-IBM-Data-Type: text;fileEncoding=IBM-937` 寫入個人來源資料集。102 行來源轉換後最長 72 bytes，FB80 共 8,160 bytes；文字往返與轉換後補齊的二進位內容均一致。
- JOB00676、JOB00677 完成隔離測試。25 個學員與講師帳號已各自配置 `<帳號>.TCBLAB.SRC937`（PS、FB80、DEVVS1、SCNOSMS），並用各自帳號核對文字與二進位內容。
- JOB00702 使用本次下載包的 JCL，僅替換 job 名稱與來源資料集為 `TCBINS1.TCBLAB.SRC937`。CCKP 清單確認 `CODEPAGE(937),DBCS`，RC 4 為已知警告；其餘 12 個步驟 RC 0。CHECK1、CHECK2 各七筆完整 400-byte 比對通過，`CHECKED=0007 ERRORS=0000`；RUNEMPTY 實際執行且 RC 0。
- 封裝後 CKP02 SHA-256：`c0a829feb688b5dd0c5e9d726c325392da50b1e64ccea8990a6c7f1380198f6e`。79 份學員檔案中包含 45 份已核對雜湊的 z-lab 檔案；無 CKP02 範本、網站、prompts、bank-source 或 reference。參考答案仍獨立封裝。

## 編碼範圍

`tcb-zosmf` 使用 IBM-937 讀寫課程來源資料集；`tcb-jobs` 使用 IBM-1047 提交 JCL 與讀取一般紀錄。兩者共用 `tcb-base` 認證。沒有修改 z/OSMF 或其他應用的全域編碼，也沒有把一般 MVS 資料集標示成帶有 CCSID 標籤。

IBM-937 的單位元組部分並非完全等同 IBM-1047；實測 `[`、`]`、`^` 的位元組不同，因此不能以「没有中文」判定可互換。JCL 內嵌的 GENCKP、CHKCKP 是測資與比較輔助程式，不是 CKP02 的替代版本。暫存商業資料、load module 與其他 binary 檔案不做文字轉碼。

## 待課程操作驗證

本次驗證使用 z/OSMF API；Bob/Zowe Explorer 的開啟、貼上、儲存與重新開啟流程仍需以學員實際版本驗證。RSE API 與 15 人同時操作未在本次重新測試。編譯清單包含中文時需核對該 DD 的解碼方式，不能宣稱所有 JES 紀錄均是 IBM-937。這些結果也不代表其餘 44 份 z-lab 程式與相依檔案均已編譯或可獨立執行。

## 官方說明

- [IBM：EBCDIC 編碼與 Zowe 設定](https://ibm.github.io/zopeneditor-about/Docs/ebcdic_encoding.html)
- [IBM：寫入 z/OS 資料集的 REST 介面](https://www.ibm.com/docs/en/zos/3.1.0?topic=interface-write-data-zos-data-set-member)
- [Zowe：團隊設定](https://docs.zowe.org/v3.3.x/user-guide/cli-using-editing-team-configuration/)
- [Zowe Explorer：版本紀錄](https://github.com/zowe/zowe-explorer-vscode/releases)（包括 Windows CRLF 傳輸修正；教材統一為 LF，避免依賴特定修正版本。）
