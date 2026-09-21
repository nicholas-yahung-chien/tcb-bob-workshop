# PPZ 分析前置與 IMS 管理者紀錄閱讀驗證

2026-09-17。第 01 單元增加 Local Metadata，第 02 單元增加 Data Dictionary 人工核對，第 04 單元增加預設收合的共享 IMS 子系統紀錄閱讀。畫面敘述統一為 PPZ；舊 #pp4z 錨點保留以避免破壞既有連結。

## 主機實測

- VS01 的 D A,IMS15* 回應顯示 IMS15CR1／STC00624、IMS15DL1／STC00625、IMS15RC1／STC00626 活動。
- /DIS OLDS ALL 由 IVP1 回應；本次有 IN USE、AVAILABLE、SCHEDULED 狀態，SLDSREAD ON。這些是查詢時點的觀測，不是永久狀態。
- TCBINS1–TCBINS3、TCB2101–TCB2110、TCB2401–TCB2420，共 33 帳號，逐一透過 RSE API／IBM-1371 讀取 STC00624 的 JESMSGLG，均取得含 DFS996I 與 IVP1 的內容。未新增權限。
- 另以 TCB2101 讀取三個區域各自的 JESMSGLG、JESYSMSG、JESJCL，共九份實際紀錄；使用內容端點取得本文，不以檔案列表成功代替讀取成功。
- IMS15CR1 紀錄中可見 IMS READY、region 啟停、external trace 資料集切換及 DISPLAY 回應。活動 spool 會增加；清單的 recordCount 與展開多行的文字行數不能直接視為相同。
- IMS15.* 資料集目錄中辨識到 OLDS 與 RECON，未辨識可用封存 SLDS。本次未完成 archive 作業／RECON 對照，不宣稱全機沒有 SLDS。
- SSH dls 查詢因暫存 DD 配置失敗，改用既有 z/OSMF 唯讀目錄查詢；實際工作紀錄仍統一透過 RSE 取得。

未執行 START、STOP、切換日誌、封存、修改 RECON 或 trace 設定；未重新執行 CKP02／IMSRUN／IMSEVTS。本次不是 IMS 系統健康認證。

## 介面驗證結果與待確認事項

已依 IBM 官方文件核對 scan_program 與 Generate data dictionary 的用途及工作流程。第 01 單元以 Z Architect 執行 scan_program、分析程式角色與相依關係，再切換 Z Code 產生 DD.json 及可閱讀資料字典；若安裝版本的 Z Code 未提供字典工作流程，可改從 Z Architect 啟動。2026-09-20 已以 Bob 2.1.0、PPZ 3.0.22 完成操作驗證：工作流程保存原始 DD.json，再由 Z Code 根據 DD.json 與來源程式產生方便閱讀的繁體中文 Markdown 資料字典。DD.json 不直接翻譯或改寫，聊天摘要與保存檔案不一致時，以實際 DD.json 與原始碼為準。

RSE API 讀取已實測；學員在 Zowe Explorer 的篩選與另存操作仍依教材逐步核對。SYSLOG 學員存取、共享 SLDS 的 DFSERA10 列印尚未驗證，均未列為已備妥操作。
