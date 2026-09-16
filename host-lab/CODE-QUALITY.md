# COBOL 程式碼檢查與改善

第 05 單元改善 CKP02 的檔案錯誤處理，不實作預覽、防止重跑或 IMS 改寫。提問從課程網頁複製。ZCodeScan 須以 IDE 實際結果為證，教材不提供預製掃描報告。

## 成果與保留範圍

只在 host-lab/hardening 建立 CKP02H.cbl、before.txt、run-quality.jcl、review.md、test-report.md 及個別失敗案例 JCL。before.txt 保存改為 PROGRAM-ID CKP02H 後、尚未改善的來源。既有成果先比較，不覆寫不同版本。保留 z-lab、z-tests、原版 run.jcl、主機成員 CKP02／RUN 與原版報告。

Improve Code 會建立 Agent 任務，可能修改選取程式。新任務不保證帶入前一段對話，須先讀本指引與工作區規則。逐項審閱差異，不任意重構或改變業務條件。

## 改善範圍

檢查 SELECT 的 FILE STATUS 與 OPEN、READ、REWRITE、CLOSE 的處理。新增狀態欄位，區分成功、正常檔尾及其他 I/O 失敗。開檔失敗不能繼續讀寫，讀取失敗不能回寫未確認的記錄。錯誤退出時關閉已開啟的檔案，後續 CLOSE 不可掩蓋原始錯誤。

本練習約定 I/O 失敗回傳 12，正常及空檔回傳 0。診斷印出程式名、操作及 FILE STATUS，不印整筆客戶資料。實際狀態以主機與編譯器文件為準。原地更新沒有自動回復能力：中途失敗時，之前成功回寫的資料可能已改變，報告須說明此限制。

保留 400-byte 記錄布局、中文資料、轉換條件與讀寫範圍。IN-REF-REC(14:3) 的 EOF 標記與實體檔尾不同。第 0004 筆第二次仍會轉換是原版行為，本節不改成冪等。不修改 fixtures.json 或 CHKCKP 預期值。

固定格式 COBOL 保留有效欄位及第 7 欄。編譯保留 CODEPAGE(937),DBCS，連線使用 tcb-rse 的 IBM-1371，兩者用途不同。既有編譯警告依 RC4-LAB.md 分析，與新增錯誤處理分開記錄。

## JCL 與回歸

以個人 host-lab/run.jcl 建立 run-quality.jcl，保留配置及 15 個基準步驟。CCKP 的 SYSIN 改讀自己的 TCBLAB.COBOL(CKP02H)，LCKP02 的 SYSLMOD 改為 &&LOAD(CKP02H)，RUNONCE、RUNTWICE、RUNEMPTY 的 PGM 均改為 CKP02H。保留 SNAP1、SNAP2、BEFOREDD、PRINTDD、GENERATE、兩次完整比對及空檔測試。不覆寫回傳碼或放寬條件來隱藏錯誤。

上傳新成員 CKP02H 後，從主機重新開啟核對，再從本機提交新 JCL。保存來源、job ID 及完整紀錄。確認編譯及連結確實使用 CKP02H，兩次各七筆完整 400 bytes 比對通過，RUNEMPTY RC 0。不能僅看整體作業 RC 或編譯成功。

## 失敗案例另外驗證

先由 Bob 提出個別案例與 JCL，確認只使用本項作業建立的暫存測試資料集。可評估以錯誤記錄長度的暫存資料集觸發 OPEN 失敗；必須核對實際配置、OPEN 診斷及 FILE STATUS，不預先宣稱一定得到某狀態。缺少 DD 可能在配置階段失敗，不必然進入 COBOL 錯誤分支。

每個案例記錄預計觸發的操作、預期回傳碼、實際 job／step／DD／訊息、是否進入新增分支及停止後續讀寫。READ／REWRITE／CLOSE 故障若無可控且隔離的方法，先做分支審閱並明列未實測，不在共用或正式資料集製造故障。正常流程通過與錯誤流程尚未完整驗證必須同時呈現。

## 檢查紀錄

review.md 記錄掃描版本／規則設定、原始訊息、來源位置、Bob 建議、採用修改及原因。無權益或命令失敗時記為未執行，不生成替代的假報告。修改後用相同規則重掃描，無診斷不代表全部行為正確。

test-report.md 對應實際來源、JCL 與紀錄位置，分開列出靜態檢查、正常回歸、失敗案例與未驗證事項。RC 4 依完整編譯清單追因，掃描規則、編譯診斷與執行 FILE STATUS 不混為一談。

## CIS14 延伸範圍

以 z-lab/CIS14 與 Copybook 審閱 GU、GNP、更新及同步呼叫。先確認使用的 PCB，再追查相對應狀態欄位。DISPLAY 的 JOBABEND 文字與實際 ABEND 不同。缺少的 XIDCHK、BRHIDCNV、正式 DBD／PSB 及配置列為缺件，不宣稱已完整執行 CIS14。IMSCKP 與 IMSEVT 是不同的教學程式。
