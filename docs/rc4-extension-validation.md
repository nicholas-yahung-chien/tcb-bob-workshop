# RC 4 延伸練習維護驗證

2026-09-16。此文件屬維護證據，不納入學員 ZIP。

原版 JOB01024 的完整 CCKP/SYSPRINT 共 1344 行：第94行 IGYLI0090-W（2 sequence errors）；第1330行 IGYSC0205-W；第1334行 IGYCB7310-W（PERFORM line68.1 cannot reach its exit）。學員 Bob 報告只以第94–96行的前段摘要判斷全檔，錯誤記錄後兩者不存在。因此強化課程對全檔、各階段摘要及截斷輸出的核對，不把已知警告當成本次必定出現的答案。

隔離修正版：TCBINS1.TCBLAB.COBOL(CKP02R)，原版 CKP02 與 JCL(RUN) 未改。將 PROGRAM-ID 改為 CKP02R；把 STOP RUN 移至主流程 PERFORM 3000-CLOSE-RTN 之後，使關檔段落可返回；CCKP 加 NOSEQ。JCL SYSIN、連結成員與三次執行均指向 CKP02R，其餘測資與比對保留。來源上傳、JCL 提交與紀錄取得使用 RSE IBM-1371；編譯保留 CODEPAGE(937),DBCS。

實際作業：TCBINS1R / JOB01038。ALLOC、CGEN、LGENCKP、CCKP、LCKP02、CCHK、LCHKCKP、GENERATE、SNAP1、RUNONCE、CHECK1、SNAP2、RUNTWICE、CHECK2、RUNEMPTY 全15步 RC0000。CCKP 完整清單未出現 Warning/Error/Severe 診斷；CHECK1、CHECK2 各7筆 PASS ALL 400 BYTES，CHECKED=0007 ERRORS=0000。RUNEMPTY 已執行且 RC0。

來源與紀錄保存於維護工作區 .work/rc0-validation/。這是講師隔離驗證，不代表學員修正版已執行。學員需取得自己的新 job ID 並核對全部步驟、完整清單與資料結果。

官方依據：
- [IBM SEQUENCE](https://www.ibm.com/docs/en/cobol-zos/6.4.0?topic=options-sequence)：第1–6欄的來源序號檢查及 NOSEQUENCE。
- [IBM Transfer of control](https://www.ibm.com/docs/en/cobol-zos/6.3.0?topic=structure-transfer-control)：程序控制流程。

主流程維持原版RC4基準；延伸練習目標才是RC0。修正不涉及預覽需求實作，也未將修正版答案納入學員教材。
