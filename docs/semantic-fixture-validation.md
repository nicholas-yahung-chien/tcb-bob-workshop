# 欄位模擬與單行輸出驗證

2026-09-15：依 CKP02 有效資料宣告逐欄配置 400 bytes。姓名、地址使用明示虛構的英文模擬值；PIC 9 欄位皆為足長數字，FILLER 全空白。未提供業務字典的代碼留空，日期格式與人員角色假設在 host-lab/README.md 列明。七筆識別值與 once、twice 預期保持原有回歸案例，未改寫 CKP02。

JOB00950 證實 DISPLAY 預設切成 120 字元；JOB00951 加大 SYSOUT LRECL 後仍切成 256 字元。JOB00952 改為固定長度 WRITE 後保留單行，但 RSE 讀取時省略行尾空白。

最終以 PRINTDD 的 FB／LRECL 402 紀錄保存雙引號、400-byte 原始資料、雙引號；雙引號不是資料。GENCKP 的 SYSOUT 另外列出案例、ID 與第 14–16 位。兩個 DD 皆使用 tcb-jobs／IBM-1047 閱讀，資料使用共同 ASCII 字元範圍。

TCBINS1 JOB00955 實際 RSE spool 驗證：PRINTDD 七行各 402 字元，剝除前後雙引號後逐 byte 與 fixtures 欄位串接結果相符，共 2,800 bytes，包含全部尾端空白。15 步均執行，CCKP RC 4，其餘 RC 0；CHECK1、CHECK2 各七筆 PASS、ERRORS=0000；第二次 BEFORE 等於第一次 ACTUAL；RUNEMPTY RC 0。

維護證據與更新前備份位於私有 semantic-record-validation 目錄，不納入教材。課程與本機 RUN 新增 PRINTDD DD；舊版 RUN 不適用新版 GENCKP，必須成套更新。
