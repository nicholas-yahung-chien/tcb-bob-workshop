請先閱讀 AGENTS.md、SOURCE-MAP.md、bank-source/reading/CKP02.TXT；再用samples/cobol/IDSHIFT.cbl與samples/cobol/IDREC.cpy對照。
使用 Ask 模式，只解釋不改檔。用繁體中文回答：
1. CKP02是否有READ/REWRITE/IMS呼叫？REWRITE在IF內還是外？與IDSHIFT子程式有何不同？
2. 計算400 bytes：REDEFINES是否占用額外空間？第11位及14–16位在哪裡？
3. 條件成立時，舊第3–10位移去哪裡？兩個空白在新記錄哪裡？
4. 資料中的EOF是跳過轉換還是結束批次？未提供的呼叫端能否推斷？
每個結論附檔案及實際行號；不從程式名稱、註解或修訂碼杜撰歷史。
最後列出兩個適合向業務確認的問題，並指出這是靜態解讀、不是合庫程式執行結果。CKP02的R-ID群組為11 bytes，R-ID-1為10，請自己核對來源，不把漏算當成程式異常。
