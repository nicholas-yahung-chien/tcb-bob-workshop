# IMS 事件練習主機驗證

2026-09-16：新程式 IMSEVT 與 JCL IMSEVTS 已完成主機實測。學員與講師共用相同來源，各作業使用獨立暫存資料庫。原 CKP02、IMSRUN 與 IMSCKP 未變更。

| 帳號 | Job | 結果 | 等待／GU／案例至 GU 結束（ms） |
|---|---|---|---|
| TCBINS1 | JOB01115 | 16 步 RC 0；CUT U3001；CHECKA RC 0 | 2000 / 10 / 2010 |
| TCBINS1 | JOB01116 | 16 步 RC 0；CUT U3001；CHECKA RC 0 | 2000 / 10 / 2010 |
| TCB2101 | JOB01117 | 16 步 RC 0；CUT U3001；CHECKA RC 0 | 2000 / 10 / 2010 |

以 JOB01115 的實際紀錄為例：

- NORMAL／SYSOUT：OP 0002 GNP 空白狀態，OP 0003 GNP GE，之後正常結束。
- DUP／SYSOUT：原值 0012345678，REPL 後查詢為 12345678 加兩空白；OP 0004 ISRT II，ROLB 空白狀態，重新查詢恢復 0012345678。
- CHECKB、CHECKA／SYSOUT：ROOT ALL 400 BYTES AND CHILD VERIFIED；JESYSMSG 兩步 RC 0。
- CUT／SYSOUT：讀取成功、無 END MODE=CUT；JESYSMSG 的 IEF472I 明示 USER=3001。CHECKA 隨後成功，證明在該作業中仍能重新查詢且資料不變。
- PDUP／SYSPRINT：真實 IMS IEFRDER 經 DFSERA10 列印，DFS707I、DFS708I、DFS703I 正常完成。
- 三項作業的 EVTDB 名稱各異，JESYSMSG 均明示 DELETED；完整重跑重建相同初始資料。

GU 計時刻度是 10 ms，不能據此做高精度效能判斷。延遲由程式在 GU 前呼叫 CEE3DLY；並非主機鎖定或 GU 本身故意延遲。CUT 只讀取，不宣稱已驗證帶更新的異常終止自動回復。DUP 則是真正更新後主動 ROLB，並有獨立查詢證據。

前期 pilot JOB01112 發現日期函數參數型別錯誤，JOB01113 發現不可返回的 PERFORM 警告，均已修正；最終版本 CIMS 為 RC 0。JOB01114 是初次通過的 inline pilot，JOB01115–JOB01117 直接提交已備妥的遠端來源成員與 JCL。

遠端部署清單及來源 SHA-256 存於維護工作區 ims-events-validation/provisioned.json；原始下載紀錄與驗證 JSON 不納入學員 ZIP。以下官方文件用於設計核對，實際結果以以上 job 為依據：

- [IMS GE](https://www.ibm.com/docs/en/ims/15.5.0?topic=explanations-ge)
- [IMS II](https://www.ibm.com/docs/en/ims/15.5.0?topic=explanations-ii)
- [Batch ROLB](https://www.ibm.com/docs/en/ims/15.5.0?topic=rdmdi-backing-out-database-updates-dynamically-roll-rolb-commands)
- [CEE3DLY](https://www.ibm.com/docs/en/zos/3.2.0?topic=services-cee3dlysuspend-processing-active-enclave-in-seconds)
- [CEE3ABD](https://www.ibm.com/docs/en/zos/3.2.0?topic=services-cee3abdterminate-enclave-abend)
- [JCL ABENDCC 條件](https://www.ibm.com/docs/en/zos/3.2.0?topic=field-relational-expression-keywords)

25 個學員與講師帳號的 COBOL(IMSEVT)／JCL(IMSEVTS) 均已建立，並以 IBM-1371 讀回比對來源一致。TCBINS1 與 TCB2101 完成執行驗證，其餘帳號完成檔案部署與讀回驗證，未宣稱逐帳號執行。
