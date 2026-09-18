# IMS 共享區域紀錄判讀實例

本例使用 2026-09-18 下載的 VS01 實際 JES 紀錄，示範如何整理 `host-lab/ims/admin-report.md`。來源為仍在執行中的 IMS15CR1、IMS15DL1 與 IMS15RC1；因此沒有最終回傳碼，也不能由這份截面紀錄宣稱整個 IMS 子系統持續健康。

## 觀測範圍

| 工作 | STC ID | Owner | 本例使用的 DD | 角色 |
|---|---|---|---|---|
| IMS15CR1 | STC00624 | IBMUSER | JESMSGLG | IMS control region，IMSID 為 IVP1 |
| IMS15DL1 | STC00625 | IBMUSER | JESMSGLG | DL/I separate address space |
| IMS15RC1 | STC00626 | IBMUSER | JESMSGLG | DBRC |

三項工作在取得紀錄時都是 ACTIVE。教材實測也確認講師與學員帳號可透過 RSE API 讀取這些 JES DD；可讀取紀錄不表示具有啟停區域或修改設定的權限。

## 可直接由紀錄確認的事件

| 來源位置 | 訊息 | 判讀 |
|---|---|---|
| STC00624 JESMSGLG 第 229 行 | DFS810A IMS READY | IMS 在該訊息時點進入等待重新啟動指令的狀態。 |
| STC00624 JESMSGLG 第 231、250、253、265 行 | DFS058I、DFS680I、DFS5055I | Normal restart 開始，使用指定 checkpoint，restart log read pass 1 隨後完成。 |
| STC00624 JESMSGLG 第 442–443 行 | DFS4878I、DFS994I | 紀錄顯示 IMS 15.4.0、功能層級 00000002，並完成 warm start。 |
| STC00626 JESMSGLG 第 8 行 | DSP0089I | DBRC 建議為 DBD DBFSAMD4、DDN LOAN 製作 image copy；是否已排程仍需另外確認。 |
| STC00624 JESMSGLG 第 540、542 行 | DFS2864I | External trace 資料集曾在 DFSTRA01 與 DFSTRA02 之間切換。這不是 OLDS 或 SLDS 封存完成的證據。 |
| STC00624 JESMSGLG 第 623–645 行 | DFS4444I 的 OLDS 顯示結果 | 當時兩個 OLDS 為 IN USE、使用率 8%，另有項目為 SCHEDULED 或 AVAILABLE；同一輸出顯示 DUAL OLDS、SINGLE WADS、AUTOMATIC ARCHIVE=01、SLDSREAD ON。 |

## 需要後續確認的訊息

- STC00624 第 8 行有 DFS1921I，指出 `WADS=D` 參數無效。實際運行狀態由後續顯示結果確認為 SINGLE WADS；參數來源與修正時機仍需由管理者核對。
- 第 158、161、204–210 行有 DFS0579W、DFS814I 與 DFS815I，分別涉及找不到 PROCLIB 成員及 line group 初始化失敗。應先確認這些資源在此 IVP 環境是否預期使用，再評估影響。
- 第 227–228 行有 DFS2000I，顯示 PMASTER1 的 OPNDST acquire 失敗。紀錄本身不足以確認節點當前狀態。
- 第 279、281、283 行有 DFS2466I，顯示 authorization RACLIST failed。需結合站點安全設定與同時段系統資料判斷，不能直接由此推論權限已失效或系統存在弱點。
- DFS4444I 顯示 archive job 為 SCHEDULED，只能表示當次顯示的排程狀態，不能當成 SLDS 已產生或封存已完成。

## 交接結論寫法

本次紀錄支持 IMS IVP1 曾完成 warm start，三個區域在擷取時仍為 ACTIVE；同時可見 image copy 建議、參數與 PROCLIB 警告、節點及 RACLIST 相關訊息。上述項目應依站點設定、後續顯示結果及管理程序繼續確認。這份報告沒有分析二進位 IMS 日誌，也沒有執行 START、STOP、日誌切換、封存或設定修改。

學員整理自己的報告時，應改用實際下載檔案的 STC ID、擷取時間和行號；區域重啟後 ID 可能不同。
