這是合庫原始素材的加深題。先閱讀SOURCE-MAP.md與bank-source/manifest.json。
只閱讀bank-source/reading/CKP02.TXT、bank-source/reading/CIS14/CIS14.TXT及直接需要的copybooks。不要掃描其他客戶資料。
請分析：
1. CKP02的REWRITE是否受IF限制？資料內EOF與AT END有何不同？R-ID群組合計幾bytes、補白在哪？引用行號，勿從修訂標記推論日期。
2. CIS14的3000-PROCESS-RTN如何分別使用PROCESS-OK與PGM-OK？列GU/GNP相依、輸入輸出長度、XIDCHK/BRHIDCNV缺件。
3. 日期範圍檢查是否等於完整曆法檢查？CURRENT-DATE對重現性有何影響？
4. 若將識別欄位規則變更，哪些呼叫關係已證實、哪些還未知？不能把CKP02、CIS14、SYSOCP31、STANCVT接成未證實的呼叫鏈。
每項分來源事實、推論、缺件。這是靜態分析，沒有主機執行證據。不要把samples/的答案套到原始程式。
交付前核對：CKP02的實際資料集組織未提供，圖與正文都不稱它為已確認的VSAM或循序資料集；CIS14的日期運算是YYYYMMDD數值減10000，不是完整曆法的一年或365天。若說外部子程式或copybook缺少，先確認manifest及內嵌宣告，不把LINKAGE參數名直接當COPY檔名。
用800中文字左右的四段摘要回答，不畫圖。不描述本題未讀取的SYSOCP31或STANCVT用途，不從名稱猜測業務。CALL字面值不能證明編譯時採動態或靜態繫結。只確認這兩支已讀程式的直接CALL，其他跨程式或排程關係保留未知；不要把未掃描的全系統關係宣判不存在。
