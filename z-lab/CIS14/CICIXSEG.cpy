      ***************************************************************   
       01  CIXSEG.                                                      
           02  LL                      PIC 999     COMP VALUE 160.      
           02  CIXKY.                                                   
               03  CIXKY1              PIC X(03)   VALUE SPACE.         
               03  CIXKY2              PIC X(22)   VALUE SPACE.         
50425A     02  CIXKY082     REDEFINES  CIXKY.                           
  "  A         03  CIXKY082-TYPE       PIC X(03).                       
  "  A         03  CIXKY082-CIRID      PIC X(10).                       
  "  A         03  CIXKY082-BRANCH     PIC X(04).                       
  "  A         03  CIXKY082-SEQ        PIC X(03).                       
  "  A         03  CIXKY082-FIL        PIC X(05).                       
70309A     02  CIXKY092     REDEFINES  CIXKY.                           
  "  A         03  CIXKY092-TYPE       PIC X(03).                       
  "  A         03  CIXKY092-BRANCH     PIC X(04).                       
  "  A         03  CIXKY092-SEQ        PIC X(14).                       
70309A         03  CIXKY092-FIL        PIC X(04).                       
71222A     02  CIXKYCXX     REDEFINES  CIXKY.                           
     A         03  CIXKYCXX-TYPE       PIC X(03).                       
     A         03  CIXKYCXX-IDNO       PIC X(10).                       
     A         03  CIXKYCXX-NATI       PIC X(02).                       
71222A         03  CIXKYCXX-FIL        PIC X(10).                       
80103A     02  CIXKYFEE     REDEFINES  CIXKY.                           
     A         03  CIXKYFEE-TYPE       PIC X(03).                       
     A         03  CIXKYFEE-IDNO       PIC X(10).                       
     A         03  CIXKYFEE-SERNO      PIC X(02).                       
80103A         03  CIXKYFEE-FIL        PIC X(10).                       
80103A     02  CIXKYF01     REDEFINES  CIXKY.                           
     A         03  CIXKYF01-TYPE       PIC X(03).                       
     A         03  CIXKYF01-ACNO       PIC X(13).                       
     A         03  CIXKYF01-YYY        PIC X(03).                       
     A         03  CIXKYF01-MM         PIC X(02).                       
80103A         03  CIXKYF01-FIL        PIC X(04).                       
80927A     02  CIXKYNWD     REDEFINES  CIXKY.                           
     A         03  CIXKYNWD-TYPE       PIC X(03).                       
     A         03  CIXKYNWD-SEQ        PIC X(10).                       
80927A         03  CIXKYNWD-ACNO       PIC X(12).                       
81115A     02  CIXKY097      REDEFINES  CIXKY.                          
     A         03  CIXKY097-TYPE        PIC X(03).                      
     A         03  CIXKY097-ACCNO       PIC X(13).                      
     A         03  CIXKY097-ASQ         PIC X(02).                      
81115A         03  CIXKY097-FIL         PIC X(07).                      
91130A     02  CIXKY105      REDEFINES   CIXKY.                         
     A         03  CIXKY105-TYPE       PIC X(03).                       
     A         03  CIXKY105-ACCNO      PIC X(13).                       
     A         03  CIXKY105-SEQ        PIC X(02).                       
91130A         03  CIXKY105-FILLER     PIC X(07).                       
10316A     02  CIXKY109      REDEFINES   CIXKY.                         
     A         03  CIXKY109-TYPE       PIC X(03).                       
     A         03  CIXKY109-ACCNO      PIC X(13).                       
     A         03  CIXKY109-KIND       PIC X(02).                       
     A         03  CIXKY109-SEQ        PIC X(02).                       
10316A         03  CIXKY109-FILLER     PIC X(05).                       
           02  CIX-DATA                PIC X(133)  VALUE SPACE.         
      *                                                                 
           02  CIX-DATA010  REDEFINES  CIX-DATA.                        
      *地址CIXKY1=(011:公司地址)                                    
      *公司地址CIXKY1=011; CIXKY2=CI-KEY                              
               03  CIXAD.                                               
                   04  CIXAD1          PIC X(05).                       
                   04  CIXAD2          PIC X(105).                      
               03  FILLER              PIC X(23).                       
      *                                                                 
80724C     02  CIX-DATA021  REDEFINES  CIX-DATA.                        
      *帳號戶名CIXKY1=021; CIXKY2=帳號                              
      *交易序號                                                       
               03  CIXSNO.                                              
                   04  CIXBHI          PIC X(04).                       
                   04  CIXTLI          PIC X(02).                       
                   04  CIXSEQ          PIC X(06).                       
      *主管代號                                                       
               03  CIXSPR              PIC X(02).                       
      *交易日                                                         
               03  CIXTXD              PIC X(07).                       
      *交易時間                                                       
               03  CIXHMS              PIC X(06).                       
      *交易代號                                                       
               03  CIXTXC              PIC X(08).                       
      *ＣＩＸＮＭ　放帳號戶名                                         
               03  CIXNM               PIC X(60).                       
      *ＣＩＸＰＮ　公庫存款核准文號                                   
               03  CIXPN               PIC X(11).                       
90109A*ＣＩＸＩＤＣＳ　分支機構統一編號                               
90109A         03  CIXIDCS             PIC X(10).                       
90109C         03  FILLER              PIC X(17).                       
80827A*                                                                 
     A*帳號戶名長戶名CIXKY1=022; CIXKY2= 帳號 + X(12)               
     A*                                                                 
     A     02  CIX-DATA022  REDEFINES  CIX-DATA.                        
     A         03  CIXCNML             PIC X(122).                      
     A         03  FILLER              PIC X(11).                       
     A*                                                                 
     A*客戶姓名長戶名CIXKY1=023; CIXKY2= CI-KEY + X(12)               
     A*                                                                 
     A     02  CIX-DATA023  REDEFINES  CIX-DATA.                        
     A         03  CIXRNML             PIC X(122).                      
     A         03  FILLER              PIC X(11).                       
     A*                                                                 
     A*負責人姓名長戶名CIXKY1=024; CIXKY2= CI-KEY + X(12)             
     A*                                                                 
     A     02  CIX-DATA024  REDEFINES  CIX-DATA.                        
     A         03  CIXANML             PIC X(122).                      
80827A         03  FILLER              PIC X(11).                       
      *客戶姓名長戶名（二）                                           
      * CIXKY1=025; CIXKY2= CI-KEY + CIXI25(01前100字02後100字) 
           02  CIX-DATA025  REDEFINES  CIX-DATA.                        
               03  CIXRNML2            PIC X(100).                      
               03  FILLER              PIC X(33).                       
      *                                                                 
      *負責人姓名長戶名（二）                                         
      * CIXKY1=026; CIXKY2= CI-KEY + CIXI26(01前100字02後100字) 
           02  CIX-DATA026  REDEFINES  CIX-DATA.                        
               03  CIXANML2            PIC X(100).                      
               03  FILLER              PIC X(33).                       
      *                                                                 
           02  CIX-DATA031  REDEFINES  CIX-DATA.                        
00328C*電話號碼CIXKY1=031; CIXKY2= SPACE                              
      *電話號碼CIXKY1=031; CIXKY2= CI-KEY + X(12).                    
      *          住家傳真機                                           
                   04  CIXTHF          PIC X(16).                       
      *          住家電話－１                                         
                   04  CIXTH1          PIC X(16).                       
30724C*          其他電話                                             
                   04  CIXTH2          PIC X(16).                       
      *          公司傳真機                                           
                   04  CIXTOF          PIC X(16).                       
      *          公司電話－１                                         
                   04  CIXTO1          PIC X(16).                       
00328A*          公司電話－１分機                                     
00328A             04  CIXTO1X         PIC X(06).                       
00328D*          辦公室電話－２                                       
00328D*            04  CIXTO2          PIC X(10).                       
      *          行動電話－１                                         
                   04  CIXMP1          PIC X(12).                       
      *          行動電話－２                                         
                   04  CIXMP2          PIC X(12).                       
      *          行動電話－３                                         
                   04  CIXMP3          PIC X(12).                       
00328D*          手機－４                                             
00328D*            04  CIXMP4          PIC X(10).                       
00328D*          手機－５                                             
00328D*            04  CIXMP5          PIC X(10).                       
00328D*          手機－６                                             
00328D*            04  CIXMP12         PIC X(10).                       
00328D*          手機－７                                             
00328D*            04  CIXMP13         PIC X(10).                       
00328C*        03  FILLER              PIC X(03).                       
20222A*          手機異動日期                                         
20222A             04  CIXMPD          PIC X(07).                       
20222C         03  FILLER              PIC X(04).                       
      *                                                                 
           02  CIX-DATA032  REDEFINES  CIX-DATA.                        
21119A*英文戶名CIXKY1=032; CIXKY2= CI-KEY + X(12).                    
      *          英文戶名 (銀聯卡)                                  
40716C*        03  CIXENAME            PIC X(26).                       
40716C         03  CIXENAME            PIC X(70).                       
               03  FILLER              PIC X(63).                       
      *                                                                 
30430A     02  CIX-DATA033  REDEFINES  CIX-DATA.                        
      * PEPS     CIXKY1=033; CIXKY2= CI-KEY + X(12).                    
      * PEP註記                                                       
               03  CIXPEP              PIC X(2).                        
50701D*        03  FILLER              PIC X(1).                        
      *註記分行                                                       
               03  CIXPEPBH            PIC X(4).                        
               03  FILLER              PIC X(1).                        
      *註記日期                                                       
               03  CIXPEPDAY           PIC X(7).                        
               03  FILLER              PIC X(1).                        
      *刪除分行                                                       
               03  CIXPEPBHD           PIC X(4).                        
               03  FILLER              PIC X(1).                        
      *刪除日期                                                       
               03  CIXPEPDAY1          PIC X(7).                        
30430A         03  FILLER              PIC X(106).                      
      *                                                                 
      * FATCA金融機構狀態                                             
30623A     02  CIX-DATA034  REDEFINES  CIX-DATA.                        
      *          CIXKY1=034; CIXKY2= CI-KEY + X(12).                    
      *金融機構合規狀態代碼                                           
               03  CIXFINNO            PIC X(1).                        
               03  FILLER              PIC X(1).                        
      *金融機構合規狀態                                               
               03  CIXFIN              PIC X(19).                       
               03  FILLER              PIC X(1).                        
      *註記分行                                                       
               03  CIXFBHI             PIC X(4).                        
               03  FILLER              PIC X(1).                        
      *註記日期                                                       
               03  CIXFDATE            PIC X(7).                        
30623A         03  FILLER              PIC X(99).                       
      *                                                                 
      *KYC風險評估                                                    
50325A     02  CIX-DATA035  REDEFINES  CIX-DATA.                        
      *          CIXKY1=035; CIXKY2= CI-KEY + X(12).                    
      *評估日期                                                       
               03  CIXKDAT             PIC X(7).                        
               03  FILLER              PIC X(1).                        
               03  CIXKYC              PIC X(1).                        
               03  FILLER              PIC X(1).                        
      *業務來源1: 存款  2:授信  3:信託4: 信用卡 5:其他      
               03  CIXBUSI             PIC X(1).                        
               03  FILLER              PIC X(1).                        
      *帳號                                                           
               03  CIXKACNO            PIC X(20).                       
               03  FILLER              PIC X(1).                        
      *評估項目1                                                      
               03  CIXKYC1             PIC X(1).                        
               03  FILLER              PIC X(1).                        
      *評估項目2                                                      
               03  CIXKYC2             PIC X(1).                        
               03  FILLER              PIC X(1).                        
      *評估項目3                                                      
               03  CIXKYC3             PIC X(1).                        
               03  FILLER              PIC X(1).                        
      *評估項目4                                                      
               03  CIXKYC4             PIC X(1).                        
               03  FILLER              PIC X(1).                        
      *評估項目5                                                      
               03  CIXKYC5             PIC X(1).                        
50325A         03  FILLER              PIC X(91).                       
      *                                                                 
           02  CIX-DATA040  REDEFINES  CIX-DATA.                        
      * Ｅ－ＭＡＩＬCIXKY1=041; CIXKY2=CI-KEY                         
               03  CIXEM               PIC X(50).                       
               03  FILLER              PIC X(83).                       
      *                                                                 
41118A*客戶工作狀態                                                   
  "   * CIXKY1=042; CIXKY2= CI-KEY + X(12)                              
           02  CIX-DATA042  REDEFINES  CIX-DATA.                        
      *工作狀態                                                       
               03  CIXJSTE             PIC X(01).                       
               03  FILLER              PIC X(01).                       
      *任職公司名稱                                                   
               03  CIXCNAM             PIC X(42).                       
               03  FILLER              PIC X(01).                       
      *職業別                                                         
               03  CIXJCATE            PIC X(14).                       
               03  FILLER              PIC X(01).                       
      *職稱                                                         
               03  CIXTITLE            PIC X(22).                       
               03  FILLER              PIC X(01).                       
      *年收入                                                         
               03  CIXYINCM            PIC X(01).                       
30322C         03  FILLER              PIC X(01).                       
     A*任職/機構屬性                                                
     A         03  CIXCPT              PIC X(02).                       
40811A         03  FILLER              PIC X(01).                       
     A*個人職業                                                       
     A         03  CIXOCC              PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A*職業細類                                                       
     A         03  CIXOCC-SUB          PIC X(02).                       
41029A         03  FILLER              PIC X(01).                       
     A*一人公司註記                                                   
41029A         03  CIXSMLLC            PIC X(01).                       
41029C         03  FILLER              PIC X(38).                       
                                                                        
      *親取對帳單指定分行                                             
      * CIXKY1=043; CIXKY2= CI-KEY + X(12)                              
           02  CIX-DATA043  REDEFINES  CIX-DATA.                        
               03  CIXBRNO             PIC X(04).                       
  "            03  FILLER              PIC X(129).                      
41118A                                                                  
50325A*洗錢-高風險註記                                              
  "   * CIXKY1=044; CIXKY2= CI-KEY + X(12)                              
           02  CIX-DATA044  REDEFINES  CIX-DATA.                        
60313A*洗錢-高風險註記                                              
               03  CIXHR               PIC X(02).                       
60313A*洗錢-建檔日期                                                
     A         03  CIXCDAT             PIC X(07).                       
90109A*洗錢-負面新聞類型                                            
     A         03  CIXHNW              PIC X(03).                       
     A*洗錢-負面新聞類型建檔日期                                    
90109A         03  CIXCDAT2            PIC X(07).                       
10412A*洗錢-高風險註記分行                                          
  "            03  CIXHRBR             PIC X(04).                       
  "   *洗錢-負面新聞類型分行                                        
  "            03  CIXHNWBR            PIC X(04).                       
40811A*洗錢-檢警調函查註記(1:有。表示設有負面新聞N16)             
  "  A         03  CIXHNWPO            PIC X(01).                       
  "  A*洗錢-檢警調函查註記異動日期                                  
  "  A         03  CIXHNWDT            PIC X(07).                       
40811C         03  FILLER              PIC X(98).                       
                                                                        
      *總機構統編                                                     
      * CIXKY1=045; CIXKY2= CI-KEY + X(12)                              
           02  CIX-DATA045  REDEFINES  CIX-DATA.                        
               03  CIXIDC              PIC X(10).                       
  "            03  FILLER              PIC X(123).                      
50325A                                                                  
90109A*同一戶名不同統編                                               
     A* CIXKY1=046; CIXKY2= CI-KEY + X(12)                              
     A     02  CIX-DATA046  REDEFINES  CIX-DATA.                        
     A         03  CIXDID              PIC X(10).                       
     A         03  CIXDBH              PIC X(04).                       
     A         03  CIXDDT              PIC X(07).                       
     A         03  FILLER              PIC X(112).                      
90109A*                                                                 
      *                                                                 
      *公庫存款機關代號CIXKY1=051; CIXKY2=CI-KEY                      
           02  CIX-DATA050  REDEFINES  CIX-DATA.                        
      *交易序號至交易代號同CIXKY1=021                                 
               03  FILLER              PIC X(35).                       
      *ＣＩＸＴＮ公庫存款機關代號                                     
               03  CIXTN               PIC X(08).                       
               03  FILLER              PIC X(90).                       
                                                                        
      *居留證號起迄日                                                 
00328A     02  CIX-DATA061  REDEFINES  CIX-DATA.                        
00328A* CIXKY1=061; CIXKY2= CI-KEY + X(12)                              
      *居留證起日                                                     
00328A         03  CIXRDS              PIC X(08).                       
00328A         03  FILLER              PIC X(01).                       
      *居留證迄日                                                     
00328A         03  CIXRDE              PIC X(08).                       
00328A         03  FILLER              PIC X(116).                      
      *                                                                 
      *人民幣業務風險預告書徵提日期,建檔日期,建檔單位             
10303A     02  CIX-DATA062  REDEFINES  CIX-DATA.                        
10303A* CIXKY1=062; CIXKY2= CI-KEY + X(12)                              
10303A         03  CIXDAT              PIC X(08).                       
10303A         03  CIXBD               PIC X(07).                       
10303A         03  CIXBB               PIC X(04).                       
10303A         03  FILLER              PIC X(114).                      
      *                                                                 
      *二代健保不需扣繳之有效迄日                                     
11213A     02  CIX-DATA063  REDEFINES  CIX-DATA.                        
  "  A* CIXKY1=063; CIXKY2= CI-KEY + X(12)                              
  "  A         03  CIX2DAT             PIC X(07).                       
11213A         03  FILLER              PIC X(126).                      
      *                                                                 
      *消費者金融保護法重要內容告知(定存)                           
20415A     02  CIX-DATA064  REDEFINES  CIX-DATA.                        
  "  A* CIXKY1=064; CIXKY2= 分行代號+ X(18)                           
  "  A         03  CIXTXDAY            PIC X(07).                       
  "  A         03  CIXACN              PIC X(13).                       
  "  A         03  FILLER              PIC X(113).                      
      *                                                                 
20719A*消費者金融保護法重要內容告知(外匯定存)                       
  "  A* CIXKY1=065; CIXKY2= 受理單位分行代號+ X(18)                   
      *                                                                 
      *境外法人/自然人相關資料                                      
41118A     02  CIX-DATA066  REDEFINES  CIX-DATA.                        
      * CIXKY1=066; CIXKY2= CI-KEY + X(12)                              
      *境外法人設立狀態:1.核准設立2.重整3.解散4.撤銷          
      *                 5.破產6.其他                              
               03  CIXSETST            PIC X(01).                       
      *境外法人設立日期(YYYMM)                                        
               03  CIXSETDT            PIC X(05).                       
50325C*        03  FILLER              PIC X(127).                      
      *境外法人聯徵虛擬統編                                           
               03  CIX-JCIC            PIC X(10).                       
50325C         03  FILLER              PIC X(01).                       
      *境外法人SWIFT CODE                                             
               03  CIX-SWIFT           PIC X(10).                       
50325C         03  FILLER              PIC X(01).                       
      *法人/自然人 客戶類別:                                      
      * 1授信戶/存款戶                                              
               03  CIX-OBU             PIC X(01).                       
50325C         03  FILLER              PIC X(01).                       
      * 2授信戶/存款戶(海外)                                      
               03  CIX-SEA             PIC X(01).                       
50325C         03  FILLER              PIC X(01).                       
      * 3保證/關係企業                                              
               03  CIX-REL-CO          PIC X(01).                       
50325C         03  FILLER              PIC X(01).                       
      * 4保證/關係人                                                
               03  CIX-REL-NA          PIC X(01).                       
50325C         03  FILLER              PIC X(01).                       
      *境外法人/自然人 註記                                       
      * D 刪除 " " 新增 "A" 刪除後復原                            
               03  CIX-FLAG            PIC X(01).                       
50325C         03  FILLER              PIC X(01).                       
               03  CIX-DWABHI          PIC X(04).                       
50325C         03  FILLER              PIC X(01).                       
               03  CIX-DWATXD7         PIC X(07).                       
50325C         03  FILLER              PIC X(01).                       
5XXXXA         03  CIX-DWAHMS          PIC X(07).                       
     C         03  FILLER              PIC X(01).                       
5XXXXA         03  CIX-DWATLI          PIC X(02).                       
80625A         03  FILLER              PIC X(01).                       
     A* 5投資(非金融機構)                                           
80625A         03  CIX-IVS-FN          PIC X(01).                       
80625C         03  FILLER              PIC X(70).                       
      *                                                                 
      *聯名帳戶資料                                                   
01130A     02  CIX-DATA071  REDEFINES  CIX-DATA.                        
01130A* CIXKY1=071; CIXKY2= 帳號 + X(11)                              
      *聯名戶狀態: I 新增, D 刪除                                 
01130A         03  CIXUNI-STATUS       PIC X(01).                       
      *其他聯名人(071), 本欄位值為'*', 建檔名義人(071)本欄位空白
01130A         03  CIXUNI-CIRID-MARK   PIC X(01).                       
      *建檔名義人CI /其他聯名人CI                                   
      *  (建檔名義人註記='*', CIXUNI-CIRID(1)值為建檔名義人CI)      
50517A         03  CIXUNI-DATA  OCCURS 12  TIMES.                       
01130A             05  CIXUNI-CIRID    PIC X(10).                       
               03  FILLER              PIC X(11).                       
      *                                                                 
      *網銀代表帳號所屬分行及個銀企銀註記                             
11221A     02  CIX-DATA081  REDEFINES  CIX-DATA.                        
11221A* CIXKY1=081; CIXKY2= CI-KEY + X(12)                              
      *網銀代表帳號所屬分行                                           
11221A         03  CIXOBR              PIC X(04).                       
11221A         03  FILLER              PIC X(01).                       
      *個銀/企銀註記, 1 :個銀  2 : 企銀                         
11221A         03  CIXEPQ              PIC X(01).                       
11221A         03  FILLER              PIC X(127).                      
      *                                                                 
      *薪轉主辦行及提款轉帳等優惠次數                                 
21119A     02  CIX-DATA082  REDEFINES  CIX-DATA.                        
50325C* CIXKY1=082; CIXKY2= CI-KEY +分行代號X(4) + 序號X(03)+ X(05) 
      *設定櫃員                                                       
  "  A         03  CIXTLI-82           PIC X(02).                       
  "  A         03  FILLER              PIC X(01).                       
      *設定日期(YYYMMDD)                                              
  "  A         03  CIXDAT-82           PIC X(07).                       
  "  A         03  FILLER              PIC X(01).                       
      *設定時間(HHMMSS)                                               
  "  A         03  CIXHMS-82           PIC X(06).                       
  "  A         03  FILLER              PIC X(01).                       
      *薪轉主辦行／優惠手續費負擔行                                   
  "  A         03  CIXSBR              PIC X(04).                       
  "  A         03  FILLER              PIC X(01).                       
50325A*授權主管代號                                                   
  "  A         03  CIXSPI-82           PIC X(02).                       
  "  A         03  FILLER              PIC X(01).                       
50325A*公文文號                                                       
  "  A         03  CIXDOC-82           PIC X(10).                       
  "  A         03  FILLER              PIC X(01).                       
      *提款優惠次數(00:取消,1-99) 99:無限次                       
  "  A         03  CIX-CNT-W           PIC 9(02).                       
  "  A         03  FILLER              PIC X(01).                       
      *提款優惠手續費                                                 
  "  A         03  CIX-FEE-W           PIC 9(02).                       
  "  A         03  FILLER              PIC X(01).                       
      *轉帳優惠次數(00:取消,1-99) 99:無限次                       
  "  A         03  CIX-CNT-T           PIC 9(02).                       
  "  A         03  FILLER              PIC X(01).                       
      *轉帳優惠手續費                                                 
  "  A         03  CIX-FEE-T           PIC 9(02).                       
  "  A         03  FILLER              PIC X(01).                       
      *優惠類別(S:薪資) (V:理財專戶)                              
  "  A         03  CIX-CHADTYPE        PIC X(01).                       
50325A             88  CIX-CHADTYPE-OK VALUE  'S' 'V'.                  
50325A             88  CIX-CHADTYPE-S  VALUE  'S'.                      
50325A             88  CIX-CHADTYPE-V  VALUE  'V'.                      
  "  A         03  FILLER              PIC X(01).                       
      *手續費優惠減免分行負擔註記－先不開放連線交易設定               
      *   Y :帳戶行負擔手續費費用                                     
      *   N :優惠手續費主辦行／設定行負擔－預設值                     
  "  A         03  CIX-DUNIT-TYPE      PIC X(01).                       
50325A             88  CIX-DUNIT-TYPE-OK VALUE  'Y' 'N'.                
50325A             88  CIX-DUNIT-TYPE-Y  VALUE  'Y'.                    
50325A             88  CIX-DUNIT-TYPE-N  VALUE  'N'.                    
  "  A         03  FILLER              PIC X(01).                       
      *提款與轉帳共用優惠次數(00:取消,1-99) 99:無限次             
  "  A         03  CIX-CNT-W-T         PIC 9(02).                       
  "  A         03  FILLER              PIC X(01).                       
      *提款與轉帳共用優惠註記(Y:ON   N:OFF)                           
  "  A         03  CIX-W-T-TYPE        PIC X(01).                       
50325A             88  CIX-W-T-TYPE-OK VALUE  'Y' 'N'.                  
50325A             88  CIX-W-T-TYPE-Y  VALUE  'Y'.                      
50325A             88  CIX-W-T-TYPE-N  VALUE  'N'.                      
70927A         03  FILLER              PIC X(01).                       
70927A*優惠終止年月                                                   
70927A         03  CIX-END-DATE        PIC X(05).                       
70927C         03  FILLER              PIC X(70).                       
      ******************************************************************
      *媒體薪轉優惠利率                                               
40319A     02  CIX-DAT085   REDEFINES  CIX-DATA.                        
     A* CIXKY1=085    ; CIXKY2= CIRKY (10)+ FILLER(12)                  
      *薪轉優惠利率(輸入值)                                         
     A         03  CIXIRATE            PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
      *薪轉優惠利率                                                   
     A         03  CIXRATE             PIC X(05).                       
     A         03  FILLER              PIC X(01).                       
      *薪轉優惠利率(存放利率指標)                                   
     A         03  CIXIRN              PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
      *薪轉優惠利率門檻                                               
     A         03  CIXDOOR             PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
      *優惠利率起始日                                                 
     A         03  CIXRDATS            PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
      *公文文號                                                       
     A         03  CIXSIGN             PIC X(10).                       
     A         03  FILLER              PIC X(01).                       
      *優惠利率終止日                                                 
     A         03  CIXRDLINE           PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
      *原薪轉適用利率(輸入值)                                       
     A         03  CIXORATE            PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
      *原薪轉適用利率(存放利率指標)                                 
     A         03  CIXIRO              PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
      *設定分行                                                       
     A         03  CIXRBHI             PIC X(04).                       
     A         03  FILLER              PIC X(01).                       
      *主管授權代號                                                   
     A         03  CIXRSP              PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
      *櫃員代號                                                       
     A         03  CIXRTL              PIC X(02).                       
50719A         03  FILLER              PIC X(01).                       
  "  A*優惠額度                                                       
  "  A         03  CIXRMM              PIC S9(11)V99 COMP-3.            
  "  A         03  CIXRMM-X   REDEFINES CIXRMM   PIC X(7).              
50719A         03  FILLER              PIC X(70).                       
50719D*        03  FILLER              PIC X(78).                       
      *##086************************************************************
50719A*優利活期（儲）存款專案 ( 0HJ0建檔)                           
     A     02  CIX-DAT086   REDEFINES  CIX-DATA.                        
     A* CIXKY1=086    ; CIXKY2= 帳號(13)+ FILLER(09)                  
60922A*##091**優質薪轉專案                                            
60922A* CIXKY1=091    ; CIXKY2= CIRKY (10)+ FILLER(12)                  
     A*適用專案                                                       
     A         03  CIXXCS              PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*專案優惠利率(輸入值)                                         
     A         03  CIXXRT              PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*專案優惠利率(加碼值)                                         
     A         03  CIXXRI              PIC S99V999 COMP-3.              
     A         03  FILLER              PIC X(01).                       
     A*專案優惠利率門檻                                               
     A         03  CIXXDR              PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*核准文號                                                       
     A         03  CIXXSN              PIC X(10).                       
     A         03  FILLER              PIC X(01).                       
     A*優惠額度                                                       
     A         03  CIXXMM              PIC S9(11)V99 COMP-3.            
     A         03  FILLER              PIC X(01).                       
     A*優惠利率起始日                                                 
     A         03  CIXXSD              PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*優惠利率終止日                                                 
     A         03  CIXXED              PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*原適用利率(輸入值)                                           
     A         03  CIXXOR              PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*登錄/變更日期                                                
     A         03  CIXXDT              PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*主管授權代號                                                   
     A         03  CIXXSP              PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A*櫃員代號                                                       
     A         03  CIXXTL              PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
60922A*建檔分行                                                       
60922A         03  CIXXBHI             PIC X(04).                       
60922C         03  FILLER              PIC X(68).                       
      *##084************************************************************
40201A     02  CIX-DAT084   REDEFINES  CIX-DATA.                        
      *企業大額牌告起訖日期                                           
     A* CIXKY1=084    ; CIXKY2= 帳號(13)+ FILLER(09)                  
      *大額牌告生效起始日                                             
     A         03  CIXLSTD             PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
      *大額牌告生效結束日                                             
     A         03  CIXLEND             PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
40201A         03  FILLER              PIC X(117).                      
      *                                                                 
      *##087************************************************************
51227A*ATM 身障優惠專案                                             
     A     02  CIX-DAT087   REDEFINES  CIX-DATA.                        
     A* CIXKY1=087    ; CIXKY2= CIRKY (10)+ FILLER(12)                  
     A*現行帳號                                                       
     A         03  CIXW1AN             PIC X(13).                       
     A         03  FILLER              PIC X(01).                       
     A*前一舊帳號                                                     
     A         03  CIXW1ANO            PIC X(13).                       
     A         03  FILLER              PIC X(01).                       
     A*申請通路                                                       
     A         03  CIXW1WY             PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*身障文件之有效期限                                             
     A         03  CIXW1DTA            PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*申請日期                                                       
     A         03  CIXW1DT             PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*申請分行                                                       
     A         03  CIXW1BH             PIC X(04).                       
     A         03  FILLER              PIC X(01).                       
     A*申請櫃員                                                       
     A         03  CIXW1TL             PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A*申請主管                                                       
     A         03  CIXW1SP             PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A*刪除日期                                                       
     A         03  CIXW1DDT            PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*刪除分行                                                       
     A         03  CIXW1DBH            PIC X(04).                       
     A         03  FILLER              PIC X(01).                       
     A*刪除櫃員                                                       
     A         03  CIXW1DTL            PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A*刪除主管                                                       
     A         03  CIXW1DSP            PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A*異動日期W2 ,W3                                                 
     A         03  CIXW2CDT            PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*異動分行                                                       
     A         03  CIXW2CBH            PIC X(04).                       
     A         03  FILLER              PIC X(01).                       
     A*異動櫃員                                                       
     A         03  CIXW2CTL            PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A*異動主管                                                       
     A         03  CIXW2CSP            PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A*變更代號                                                       
     A         03  CIX-CIUCC-087       PIC X(02).                       
     A             88  CIX-CIUCC-087-OK  VALUE  '  ' 'W1'               
     A                                          'W2' 'W3'.              
     A             88  CIX-CIUCC-087-SP  VALUE  '  '.                   
     A             88  CIX-CIUCC-087-W1  VALUE  'W1'.                   
     A             88  CIX-CIUCC-087-W2  VALUE  'W2'.                   
     A             88  CIX-CIUCC-087-W3  VALUE  'W3'.                   
51227A         03  FILLER              PIC X(36).                       
      *##089************************************************************
60223A*聯徵P33查詢                                                  
     A* CIXKY1=089    ; CIXKY2= CIRKY (10)+ FILLER(12)                  
     A     02  CIX-DAT089   REDEFINES  CIX-DATA.                        
     A*查詢日期                                                       
     A         03  CIXP33DT            PIC 9(07).                       
     A         03  FILLER              PIC X(01).                       
     A*查詢結果 Y正常無事故, N不正常有事故                        
     A         03  CIXP33RS            PIC X(01).                       
     A*查詢管道(A~Z)(0~9)    O1:財金OUTBOUND                        
     A         03  CIXP3CNL            PIC X(02).                       
     A*查詢交易帳號                                                   
     A         03  CIXP3ACT            PIC X(13).                       
71122A*** 財金跨境電子支付OUTBOUND使用者身分確認                    
71122C*使用者身分確認註記 'Y': 已確認                               
70524A         03  CIXP3CID            PIC X(01).                       
71122A*使用者身分確認日期                                             
     A         03  CIXP3CDT            PIC 9(07).                       
     A*使用者身分確認手機門號                                         
71122A         03  CIXP3CMP            PIC X(12).                       
71226A*跨境支付P33備註欄位                                          
71226A         03  CIXP3-MEMO          PIC X(20).                       
71226C         03  FILLER              PIC X(69).                       
      *##090************************************************************
60809A*金融帳戶核驗錯誤次數(ATM)                                      
     A* CIXKY1=090    ; CIXKY2= 帳號(13)+ FILLER(09)                  
     A     02  CIX-DAT090   REDEFINES  CIX-DATA.                        
     A*錯誤總筆數                                                     
     A         03  CIXECNT             PIC 9(02).                       
     A         03  FILLER              PIC X(01).                       
     A*最近一次錯誤日期                                               
     A         03  CIXEDT              PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*最近一次錯誤時間                                               
     A         03  CIXETM              PIC X(06).                       
     A         03  FILLER              PIC X(01).                       
     A*核驗失敗STAN1                                                  
     A         03  CIXESTN1            PIC X(10).                       
     A         03  FILLER              PIC X(01).                       
     A*核驗失敗類別1                                                  
     A         03  CIXETP1             PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A*核驗失敗資料1                                                  
     A         03  CIXEDA1             PIC X(10).                       
     A         03  FILLER              PIC X(01).                       
     A*核驗失敗STAN2                                                  
     A         03  CIXESTN2            PIC X(10).                       
     A         03  FILLER              PIC X(01).                       
     A*核驗失敗類別2                                                  
     A         03  CIXETP2             PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A*核驗失敗資料2                                                  
     A         03  CIXEDA2             PIC X(10).                       
     A         03  FILLER              PIC X(01).                       
     A*核驗失敗STAN3                                                  
     A         03  CIXESTN3            PIC X(10).                       
     A         03  FILLER              PIC X(01).                       
     A*核驗失敗類別3                                                  
     A         03  CIXETP3             PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A*核驗失敗資料3                                                  
     A         03  CIXEDA3             PIC X(10).                       
60809A         03  FILLER              PIC X(41).                       
70309A*##092************************************************************
     A*保管箱業務                                                     
     A* CIXKY1=092    ; CIXKY2= CIXKY092-BRANCH(4)+CIXKY092-SEQ(14)     
     A     02  CIX-DATA092   REDEFINES  CIX-DATA.                       
     A*保管箱開箱日                                                   
     A         03  CIXBOXOP            PIC X(07).                       
     A*保管箱關箱日                                                   
     A         03  CIXBOXCL            PIC X(07).                       
70309A         03  FILLER              PIC X(119).                      
70524A     02  CIX-DATA093   REDEFINES  CIX-DATA.                       
     A*##093************************************************************
      *TAIWAN PAY額度控管                                           
     A* CIXKY1=093    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
      *臺灣PAY日累計金額                                            
     A         03  CIXTPDM             PIC 9(08).                       
     A         03  FILLER              PIC X(01).                       
      *臺灣PAY月累計金額                                            
     A         03  CIXTPMM             PIC 9(08).                       
     A         03  FILLER              PIC X(01).                       
      *臺灣PAY交易日期                                              
     A         03  CIXTPDAT            PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
      *臺灣PAY日累計金額(一維)                                    
     A         03  CIXTODM             PIC 9(08).                       
     A         03  FILLER              PIC X(01).                       
      *臺灣PAY月累計金額(一維)                                    
     A         03  CIXTOMM             PIC 9(08).                       
     A         03  FILLER              PIC X(01).                       
      *臺灣PAY交易日期(一維)                                      
     A         03  CIXTODAT            PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
      *臺灣PAY行動網銀綁定之帳號                                    
     A         03  CIXTPACT            PIC X(13).                       
70524A         03  FILLER              PIC X(68).                       
71122A     02  CIX-DATA094   REDEFINES  CIX-DATA.                       
     A*##094************************************************************
      *詢證函企業約定授權交易                                       
     A* CIXKY1=094    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
91119A* A.企業授權（授權會計師事務所）                                
      *是否授權執行查核作業                                           
     A         03  CIXQCHK             PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
      *會計師事務所統編                                               
     A         03  CIXQAID             PIC X(10).                       
     A         03  FILLER              PIC X(01).                       
      *授權起始日                                                     
     A         03  CIXQBDT             PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
      *授權到期日                                                     
     A         03  CIXQEDT             PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
      *電子簽章約定書                                               
     A         03  CIXQAUT             PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
      *備註說明                                                       
     A         03  CIXQCMT             PIC X(20).                       
81115A         03  FILLER              PIC X(01).                       
     A*終止授權起始日                                                 
     A         03  CIXQEAS             PIC X(07).                       
91119A         03  FILLER              PIC X(01).                       
  "  A* B.企業查核授權（授權企業查核單位）                            
  "  A*是否授權                                                       
  "  A         03  CIXQCHKB            PIC X(01).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A*查核單位統一編號                                               
  "  A         03  CIXQAIDB            PIC X(10).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A*授權起始日                                                     
  "  A         03  CIXQBDTB            PIC X(07).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A*授權到期日                                                     
  "  A         03  CIXQEDTB            PIC X(07).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A*電子簽章                                                       
  "  A         03  CIXQAUTB            PIC X(01).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A*終止授權起始日                                                 
  "  A         03  CIXQEASB            PIC X(07).                       
91119C         03  FILLER              PIC X(35).                       
80321A     02  CIX-DATA095   REDEFINES  CIX-DATA.                       
     A*##095************************************************************
     A* 雲端發票載具設定                                          
     A* CIXKY1=095    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
     A*捐贈愛心碼                                                     
     A         03  CIXSLOV             PIC X(08).                       
     A         03  FILLER              PIC X(01).                       
     A*雲端發票條碼                                                 
     A         03  CIXSPER             PIC X(08).                       
     A         03  FILLER              PIC X(01).                       
     A*發票預設值 1:雲端發票條碼2:捐贈愛心碼                    
     A         03  CIXSRMK             PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*設定日                                                         
     A         03  CIXSDAT             PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*設定行                                                     
     A         03  CIXSBRH             PIC X(04).                       
80321A         03  FILLER              PIC X(101).                      
80425A*##096************************************************************
     A     02  CIX-DATA096   REDEFINES  CIX-DATA.                       
     A* 各項業務ＥＤＭ行銷註記                                      
     A* CIXKY1=096    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
     A*存款ＥＤＭ行銷註記　　　　０：訂閱　１：取消                   
     A         03  CIXEDMPB            PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*外匯ＥＤＭ行銷註記　　　　０：訂閱　１：取消                   
     A         03  CIXEDMXS            PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*貸款ＥＤＭ行銷註記　　　　０：訂閱　１：取消                   
     A         03  CIXEDMLA            PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*理財ＥＤＭ行銷註記　　　　０：訂閱　１：取消                   
     A         03  CIXEDMMF            PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*電子金融ＥＤＭ行銷註記　　０：訂閱　１：取消                   
     A         03  CIXEDMNT            PIC X(01).                       
     A         03  FILLER              PIC X(25).                       
     A*設定日                                                         
     A         03  CIXEDMDT            PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*設定行                                                     
     A         03  CIXEDMBH            PIC X(04).                       
80425A         03  FILLER              PIC X(087).                      
81115A*##097************************************************************
     A*職災補償金專戶設定                                             
     A*                                                                 
     A     02  CIX-DATA097   REDEFINES  CIX-DATA.                       
     A         03  CIX97-STATE         PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX97-DOC1          PIC X(14).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX97-DOC2          PIC X(12).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX97-TRANTYP       PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX97-CCNT          PIC 9(02).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX97-CAMT          PIC 9(11).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX97-PCNT          PIC 9(02).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX97-PBRCD         PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX97-OBHI          PIC X(04).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX97-OTLI          PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX97-ODAT          PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX97-OHMS          PIC X(06).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX97-MTLI          PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX97-MDAT          PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX97-MHMS          PIC X(06).                       
81115A         03  FILLER              PIC X(40).                       
90324A*##098************************************************************
     A*　辦理外收委託保全匯款註記設定                                 
     A*                                                                 
     A     02  CIX-DATA098   REDEFINES  CIX-DATA.                       
     A         03  CIX98-STATE         PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A         03  CIX98-DWABHI        PIC X(04).                       
90324A         03  FILLER              PIC X(127).                      
90924A*##099************************************************************
  "  A*　合庫證券基本資料拋轉同意註記                                 
  "  A* CIXKY1=099    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
  "  A     02  CIX-DATA099   REDEFINES  CIX-DATA.                       
  "  A         03  CIX99-AGREE         PIC X(01).                       
21116A*  合庫證券客戶同意資產查詢註記                                 
     A         03  CIX99-BALINQ        PIC X(01).                       
     A*  合庫證券客戶同意資產查詢設定日期                             
21116A         03  CIX99-SETDAT        PIC X(07).                       
21116C         03  FILLER              PIC X(124).                      
01005A*##101************************************************************
  "  A*  優化洗錢及資恐風險評估新增欄位                               
  "  A*                                                                 
  "  A* CIXKY1=101    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
  "  A     02  CIX-DATA101   REDEFINES  CIX-DATA.                       
  "  A*  國籍/法人註冊地國籍                                        
  "  A         03  CIX101-NATION1      PIC X(02).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A*  通訊地國籍/法人營運地國籍                                  
  "  A         03  CIX101-NATION2      PIC X(02).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A*  傳真電話                                                     
  "  A         03  CIX101-FAXTEL       PIC X(10).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A*  外籍人士居留證號碼                                           
  "  A         03  CIX101-FID          PIC X(12).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A*  名下帳戶數                                                   
  "  A         03  CIX101-ACTCNT       PIC 9(06).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A*  業務關係金額-最近一年                                      
  "  A         03  CIX101-LASTYEAR     PIC 9(13)V99.                    
10922A         03  FILLER              PIC X(01).                       
10922A*  全數位帳戶註記                                               
10922A         03  CIX101-DIGITAL      PIC X(01).                       
20222A         03  FILLER              PIC X(01).                       
20222A*  監度強度註記代號                                             
20222A         03  CIX101-MONITOR      PIC X(01).                       
20823C         03  FILLER              PIC X(01).                       
20823A*  上次總存款                                                   
20823A         03  CIX101-BAMT         PIC S9(15)V99.                   
21027C         03  FILLER              PIC X(01).                       
21027A*  實收資本額                                                   
21027A         03  CIX101-CAPAMT       PIC 9(15) COMP-3.                
30926A         03  FILLER              PIC X(01).                       
30926A*  核准設立日期                                                 
30926A         03  CIX101-OPDATE       PIC X(07).                       
40219A         03  FILLER              PIC X(01).                       
40219A*  法人或非法人團體負責人已異動註記                             
40219A         03  CIX101-PCHG         PIC X(01).                       
40219A         03  FILLER              PIC X(01).                       
40409A*  子公司高風險婉拒客戶註記                                     
40409A         03  CIX101-SCHRFLG      PIC X(01).                       
40409C         03  FILLER              PIC X(38).                       
90722A*##102************************************************************
  "  A*  風險等級調整註記                                             
  "  A*                                                                 
  "  A* CIXKY1=102    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
  "  A     02  CIX-DATA102   REDEFINES  CIX-DATA.                       
  "  A*  人工調整風險等級註記                                         
  "  A         03  CIX102-RLFLG        PIC X(01).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A*  人工調整風險等級日期                                         
  "  A         03  CIX102-RLDAT        PIC X(07).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A*  申請調整風險評級分行代號                                     
  "  A         03  CIX102-RLBRH        PIC X(04).                       
90722A         03  FILLER              PIC X(119).                      
90924A*##103************************************************************
  "  A*  定期審查客戶未提供資料                                       
  "  A*                                                                 
  "  A* CIXKY1=103    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
  "  A     02  CIX-DATA103   REDEFINES  CIX-DATA.                       
  "  A         03  CIX103-RCUP         PIC X(01).                       
00121A         03  FILLER              PIC X(01).                       
00121A         03  CIX103-RCUPBH       PIC X(04).                       
00310A         03  FILLER              PIC X(01).                       
00310A         03  CIX103-RCUPDT       PIC X(07).                       
00310C         03  FILLER              PIC X(119).                      
90924A*        03  FILLER              PIC X(132).                      
      ******************************************************************
41126C*綜轉定自動化月累積金額+ ATM現金存款累計金額(BY ID)           
21023A     02  CIX-DATA311  REDEFINES  CIX-DATA.                        
  "  A* CIXKY1=311; CIXKY2= CI-KEY + X(12)                              
  "  A         03  CIXEDAY             PIC X(07).                       
  "  A         03  CIXEAMT             PIC S9(11)V99 COMP-3.            
41126A         03  FILLER              PIC X(01).                       
41126A         03  CIXATM-DP-LDATE     PIC X(07).                       
41126A         03  CIXATM-DP-AMT       PIC S9(11)V99 COMP-3.            
41126C         03  FILLER              PIC X(104).                      
91130A*##104************************************************************
91130A*台灣PAY紅利點數                                              
     A* CIXKY1=104    ; CIXKY2= CIRKY (10)+ FILLER(12)                  
     A     02  CIX-DAT104   REDEFINES  CIX-DATA.                        
     A* TPAY開關（開啟："Y")                                          
     A         03  CIXPYB-TFG          PIC  X(01).                      
     A* EPAY開關（開啟："Y")                                          
     A         03  CIXPYB-EFG          PIC  X(01).                      
     A*紅利點數                                                       
     A         03  CIXPYB-POT          PIC S9(07).                      
     A*上次交易日                                                     
     A         03  CIXPYB-LTXDT        PIC  X(07).                      
     A*月累計點數                                                     
     A         03  CIXPYB-MCNTPOT      PIC S9(07).                      
91130A         03  FILLER              PIC  X(110).                     
91130A*##105************************************************************
91130A*手機門號轉帳綁定帳號                                           
      ******************************************************************
           02  CIX-DATA105  REDEFINES  CIX-DATA.                        
               03  CIXMPH-STATUS       PIC X(01).                       
               03  CIXMPH-PHONE        PIC X(10).                       
               03  CIXMPH-DATE         PIC X(07).                       
               03  CIXMPH-TIME         PIC X(06).                       
               03  CIXMPH-APPL         PIC X(05).                       
               03  CIXMPH-PHONETYPE    PIC X(01).                       
               03  FILLER              PIC X(103).                      
00905A*##106************************************************************
  "  A*  行號負責人已異動                                             
  "  A*                                                                 
  "  A* CIXKY1=106    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
  "  A     02  CIX-DATA106   REDEFINES  CIX-DATA.                       
  "  A         03  CIX106-CBUS         PIC X(01).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A         03  CIX106-CBUSBH       PIC X(04).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A         03  CIX106-CBUSDT       PIC X(07).                       
00905A         03  FILLER              PIC X(119).                      
00705A*##107************************************************************
  "  A*  實體ATM轉帳1萬元以上通知機制                             
  "  A*  雲支付消費5仟元以上通知機制                                
10215A*   AI社群綁定通知機制                                          
20112A*  全繳非約定交易通知註記ID+ACT                                 
  "  A*                                                                 
  "  A* CIXKY1=107    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
  "  A     02  CIX-DATA107   REDEFINES  CIX-DATA.                       
  "  A*實體ATM轉帳1萬元通知機制                                   
  "  A* (Y:恢復通知 N:取消通知空白:預設通知)                    
  "  A         03  CIX107-RATM         PIC X(01).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A*實體ATM轉帳1萬元通知機制異動分行                           
  "  A         03  CIX107-RATMBH       PIC X(04).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A*實體ATM轉帳1萬元通知機制異動日期                           
  "  A         03  CIX107-RATMDT       PIC X(07).                       
  "  A         03  FILLER              PIC X(01).                       
  "A*雲支付消費5仟元以上通知機制                                  
  "  A* (Y:恢復通知 N:取消通知空白:預設通知)                    
  "  A         03  CIX107-CPAY         PIC X(01).                       
  "  A         03  FILLER              PIC X(01).                       
  "A*雲支付消費5仟元以上通知機制異動分行                          
  "  A         03  CIX107-CPAYBH       PIC X(04).                       
  "  A         03  FILLER              PIC X(01).                       
  "A*雲支付消費5仟元以上通知機制異動日期                          
  "  A         03  CIX107-CPAYDT       PIC X(07).                       
00215A         03  FILLER              PIC X(01).                       
     A*AI狀態註記 Y有效, N取消, 空白未定義                      
     A         03  CIX107-AIFLAG       PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*AI註記申請管道-> A : AI                                    
     A         03  CIX107-AIAPATH      PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*AI申請日期                                                 
     A         03  CIX107-AIBDAT       PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*AI註記取消管道-> A : AI / T:ETABS                              
     A         03  CIX107-AICPATH      PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*AI取消日期                                                   
10215A         03  CIX107-AIEDAT       PIC X(07).                       
20113A         03  FILLER              PIC X(01).                       
20113A*全繳非約定交易通知註記ID+ACT ; 異動通知管道                
20113A* 註記 (Y:恢復通知 N:取消通知空白:預設通知)             
20113A* 管道 (WA: WEB-ATMNB:網銀MB:行動網銀)                  
20113A         03  CIX107-P226X        PIC X(01).                       
20113A         03  FILLER              PIC X(01).                       
20113A         03  CIX107-P226XCNL     PIC X(02).                       
20113C         03  FILLER              PIC X(77).                       
10215C*        03  FILLER              PIC X(82).                       
00905A*##108************************************************************
  "  A*  存續證明種類、存續證明簽發日期                               
  "  A*                                                                 
  "  A* CIXKY1=108    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
  "  A     02  CIX-DATA108   REDEFINES  CIX-DATA.                       
  "  A         03  CIX108-COL          PIC X(01).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A         03  CIX108-COLBH        PIC X(04).                       
  "  A         03  FILLER              PIC X(01).                       
  "  A         03  CIX108-COLDT        PIC X(08).                       
00905A         03  FILLER              PIC X(118).                      
10316A*##109************************************************************
     A*特殊優惠主辦行及提款轉帳等優惠次數                             
     A     02  CIX-DATA109  REDEFINES  CIX-DATA.                        
     A* CIXKY1=109; CIXKY2= ACNO(13)+優惠類別(X02)+序號(X02)        
     A*優惠帳號                                                       
     A         03  CIX109-ACNO         PIC X(13).                       
     A         03  FILLER              PIC X(01).                       
     A*申請分行                                                       
     A         03  CIX109-DWABHI       PIC X(04).                       
     A         03  FILLER              PIC X(01).                       
     A*設定櫃員                                                       
     A         03  CIX109-TLI          PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A*設定日期(YYYMMDD)                                              
     A         03  CIX109-DAT          PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*設定時間(HHMMSS)                                               
     A         03  CIX109-HMS          PIC X(06).                       
     A         03  FILLER              PIC X(01).                       
     A*薪轉主辦行／優惠手續費負擔行                                   
     A         03  CIX109-SBR          PIC X(04).                       
     A         03  FILLER              PIC X(01).                       
     A*授權主管代號                                                   
     A         03  CIX109-SPI          PIC X(02).                       
     A         03  FILLER              PIC X(01).                       
     A*公文文號                                                       
     A         03  CIX109-DOC          PIC X(10).                       
     A         03  FILLER              PIC X(01).                       
     A*提款優惠次數(00:取消,1-99) 99:無限次                       
     A         03  CIX109-CNT-W        PIC 9(02).                       
     A         03  FILLER              PIC X(01).                       
     A*提款優惠手續費                                                 
     A         03  CIX109-FEE-W        PIC 9(02).                       
     A         03  FILLER              PIC X(01).                       
     A*轉帳優惠次數(00:取消,1-99) 99:無限次                       
     A         03  CIX109-CNT-T        PIC 9(02).                       
     A         03  FILLER              PIC X(01).                       
     A*轉帳優惠手續費                                                 
     A         03  CIX109-FEE-T        PIC 9(02).                       
     A         03  FILLER              PIC X(01).                       
40219C*優惠類別 (1:特殊優惠2:國外提款手續費優惠)                  
     A         03  CIX109-CHADTYPE     PIC X(01).                       
40219C             88  CIX109-TYPE-OK  VALUE  '1' '2'.                  
     A             88  CIX109-TYPE-1   VALUE  '1'.                      
40219A             88  CIX109-TYPE-2   VALUE  '2'.                      
     A         03  FILLER              PIC X(01).                       
     A*提款與轉帳共用優惠次數(00:取消,1-99) 99:無限次             
     A         03  CIX109-CNT-W-T      PIC 9(02).                       
     A         03  FILLER              PIC X(01).                       
     A*提款與轉帳共用優惠註記(Y:ON   N:OFF)                           
     A         03  CIX109-TYPE-W-T     PIC X(01).                       
     A             88  CIX109-W-T-OK   VALUE  'Y' 'N'.                  
     A             88  CIX109-W-T-Y    VALUE  'Y'.                      
     A             88  CIX109-W-T-N    VALUE  'N'.                      
     A         03  FILLER              PIC X(59).                       
110041*##110************************************************************
     A* ACCOUNT-LINK消費額度控管                                      
     A* CIXKY1=110    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
     A     02  CIX-DATA110  REDEFINES  CIX-DATA.                        
     A* ACCOUNT-LINK日累計金額                                        
     A         03  CIXDAMT             PIC S9(08).                      
     A* ACCOUNT-LINK月累計金額                                        
     A         03  CIXMAMT             PIC S9(08).                      
     A* ACCOUNT-LINK交易日期                                          
     A         03  CIXPDATE            PIC X(07).                       
11004A         03  FILLER              PIC X(110).                      
10617A*##111************************************************************
  "  A*  親子帳戶 CIXKY2=子身分證字號 CIX111-KIND = '1'             
  "  A*           CIXKY2=母身分證字號 CIX111-KIND = '2'             
  "  A*                                                                 
  "  A* CIXKY1=111    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
  "  A     02  CIX-DATA111   REDEFINES  CIX-DATA.                       
  "  A         03  CIX111-KIND             PIC X(01).                   
  "  A         03  CIX111-FILLER           PIC X(132).                  
  "  A         03  CIX111-CHILD-DATA   REDEFINES  CIX111-FILLER.        
  "  A             05  CIX111-899-ACCT     PIC X(13).                   
  "  A             05  CIX111-MOTHER-IDNO  PIC X(10).                   
  "  A             05  CIX111-SET-DATE     PIC X(07).                   
  "  A             05  CIX111-SET-BHID     PIC X(04).                   
  "  A             05  CIX111-RELEASE-DATE PIC X(07).                   
  "  A             05  FILLER              PIC X(91).                   
  "  A         03  CIX111-MOTHER-DATA  REDEFINES  CIX111-FILLER.        
  "  A             05  CIX111-SON1-ACCT    PIC X(13).                   
  "  A             05  CIX111-SON1-IDNO    PIC X(10).                   
  "  A             05  CIX111-SON2-ACCT    PIC X(13).                   
  "  A             05  CIX111-SON2-IDNO    PIC X(10).                   
  "  A             05  CIX111-SON3-ACCT    PIC X(13).                   
  "  A             05  CIX111-SON3-IDNO    PIC X(10).                   
  "  A             05  CIX111-SON4-ACCT    PIC X(13).                   
  "  A             05  CIX111-SON4-IDNO    PIC X(10).                   
  "  A             05  CIX111-SON5-ACCT    PIC X(13).                   
  "  A             05  CIX111-SON5-IDNO    PIC X(10).                   
  "  A             05  FILLER              PIC X(17).                   
10617A*                                                                 
20628A*##112************************************************************
  "  A*  自行派員外收                                                 
  "  A*                                                                 
  "  A* CIXKY1=112    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
  "  A     02  CIX-DATA112   REDEFINES  CIX-DATA.                       
  "  A*自行派員外收註記                                           
  "  A         03  CIX112-OUT          PIC X(01).                       
  "  A         03  FILLER              PIC X(01).                       
30422A         03  CIX112-CTABLE  OCCURS 10  TIMES.                     
30422A*建檔分行                                                   
30422A             05  CIX112-CBRCH    PIC X(04).                       
30422A             05  FILLER          PIC X(01).                       
30422A*建檔日期                                                   
30422A             05  CIX112-CDATE    PIC X(07).                       
30422A             05  FILLER          PIC X(01).                       
30422C         03  FILLER              PIC X(01).                       
20823A*##113************************************************************
     A*  黃金存摺ＫＹＣ註記                                           
     A*                                                                 
     A* CIXKY1=113    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
     A     02  CIX-DATA113   REDEFINES  CIX-DATA.                       
     A*自行派員外收註記                                           
     A         03  CIX113-GDKYC        PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*建檔分行                                                   
     A         03  CIX113-GDBRCH       PIC X(04).                       
     A         03  FILLER              PIC X(01).                       
     A*建檔日期                                                   
     A         03  CIX113-GDDATE       PIC X(07).                       
20823A         03  FILLER              PIC X(119).                      
21222A*##114************************************************************
     A*   VIP客戶資料註記                                             
     A*                                                                 
     A* CIXKY1=114    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
     A     02  CIX-DATA114   REDEFINES  CIX-DATA.                       
     A*法人金融部VIP註記                                        
     A         03  CIX114-CORVIP       PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*個人金融部VIP註記                                        
     A         03  CIX114-PERVIP       PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*國外部VIP註記                                            
     A         03  CIX114-FORVIP       PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*業務發展部VIP註記                                        
     A         03  CIX114-BUSVIP       PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*財富管理部VIP註記                                        
     A         03  CIX114-WEAVIP       PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*建檔日期                                                   
     A         03  CIX114-DATE         PIC X(07).                       
21222A         03  FILLER              PIC X(116).                      
21222A*##115************************************************************
     A*  第三方支付能量登錄                                           
     A*                                                                 
     A* CIXKY1=115    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
     A     02  CIX-DATA115   REDEFINES  CIX-DATA.                       
     A*第三方支付能量登錄註記                                         
     A         03  CIX115-THDRMK       PIC X(01).                       
     A         03  FILLER              PIC X(01).                       
     A*能量登錄有效日期                                               
     A         03  CIX115-THDDAT       PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*能量登錄建檔分行                                               
     A         03  CIX115-THDBRH       PIC X(04).                       
     A         03  FILLER              PIC X(01).                       
     A*能量登錄異動日期                                               
     A         03  CIX115-THDBDT       PIC X(07).                       
21222A         03  FILLER              PIC X(111).                      
21215A*##116************************************************************
     A*  告誡登錄                                                     
     A*                                                                 
     A* CIXKY1=116    ; CIXKY2= 身分證字號(10)+ FILLER(12)            
     A     02  CIX-DATA116   REDEFINES  CIX-DATA.                       
     A*告誡日期                                                       
     A         03  CIX116-WDATE        PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*告誡期限                                                       
     A         03  CIX116-EDATE        PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*告誡分局中文全名                                               
     A         03  CIX116-ISSUER       PIC X(32).                       
     A         03  FILLER              PIC X(01).                       
     A*異動日期                                                       
     A         03  CIX116-CDATE        PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*建檔分行                                                       
     A         03  CIX116-CBR          PIC X(04).                       
     A         03  FILLER              PIC X(01).                       
     A*刪除日期                                                       
     A         03  CIX116-DDATE        PIC X(07).                       
     A         03  FILLER              PIC X(01).                       
     A*刪除告誡分局中文全名                                           
     A         03  CIX116-DISSUER      PIC X(32).                       
21222A         03  FILLER              PIC X(31).                       
40219A*##117************************************************************
     A     02  CIX-DATA117  REDEFINES  CIX-DATA.                        
     A* CIXKY1=117; CIXKY2= CI-KEY + X(12)                              
     A*語音代表帳號                                                   
     A         03  CIXVORAN            PIC X(13).                       
     A*語音帳號使用狀態0: 正常1:解除                              
     A         03  CIXVORDL            PIC X(01).                       
     A*語音帳號申請分行                                               
     A         03  CIXVOBRH            PIC X(04).                       
     A*語音帳號異動日期                                               
40219A         03  CIXVODAT            PIC X(07).                       
40624A*語音轉帳交易種類註記                                           
     A         03  CIXVORTN            PIC X(01).                       
     A*傳真機號碼                                                     
40624A         03  CIXVORFX            PIC X(10).                       
40624C         03  FILLER              PIC X(97).                       
      *                                                                 
40317A*##118************************************************************
     A     02  CIX-DATA118  REDEFINES  CIX-DATA.                        
     A* CIXKY1=118; CIXKY2= CI-KEY + X(12)                              
     A*外籍移工在臺狀態註記0:境內1:離境2:行方不明3:收容遣返   
     A         03  CIX118-MARK         PIC X(01).                       
     A*出境／失聯／查獲日期                                           
     A         03  CIX118-DATE         PIC X(07).                       
     A*在台狀態-資料日期                                            
     A         03  CIX118-IMMI-CDATE   PIC X(07).                       
     A*在台狀態-資料狀態                                            
     A         03  CIX118-IMMI-TYPE    PIC X(01).                       
     A*在台狀態-出境日期                                            
     A         03  CIX118-IMMI-DATE    PIC X(07).                       
     A*在台狀態-在臺狀態                                            
     A         03  CIX118-IMMI-INTW    PIC X(01).                       
     A*行方不明-資料日期                                            
     A         03  CIX118-FLED-CDATE   PIC X(07).                       
     A*行方不明-資料狀態                                            
     A         03  CIX118-FLED-TYPE    PIC X(01).                       
     A*行方不明-失聯日期                                            
     A         03  CIX118-FLED-DATE    PIC X(07).                       
     A*收容遣返-資料日期                                            
     A         03  CIX118-PUNISH-CDATE PIC X(07).                       
     A*收容遣返-資料狀態                                            
     A         03  CIX118-PUNISH-TYPE  PIC X(01).                       
     A*收容遣返-查獲日期                                            
     A         03  CIX118-PUNISH-DATE  PIC X(07).                       
40624A*臨櫃鍵入-異動日期                                            
  "  A         03  CIX118-TELLER-CDATE PIC X(07).                       
  "  A*臨櫃鍵入-外籍移工在臺狀態註記                                
  "  A         03  CIX118-TELLER-MARK  PIC X(01).                       
  "  A*臨櫃鍵入-出境／失聯／查獲日期                                
40624A         03  CIX118-TELLER-DATE  PIC X(07).                       
40624C         03  CIX118-FILLER       PIC X(64).                       
      *                                                                 
40417A*##119************************************************************
     A     02  CIX-DATA119  REDEFINES  CIX-DATA.                        
     A* CIXKY1=119; CIXKY2= CI-KEY + X(12)                              
     A*外籍移工聘僱狀態註記                                           
     A         03  CIX119-MARK           PIC X(02).                     
     A*解聘／失聯／離境日期                                           
     A         03  CIX119-DATE           PIC X(07).                     
     A*解聘資料-資料日期                                            
     A         03  CIX119-LAYOFF-CDATE   PIC X(07).                     
     A*解聘資料-資料狀態                                            
     A         03  CIX119-LAYOFF-TYPE    PIC X(01).                     
     A*解聘資料-撤銷函日期                                          
     A         03  CIX119-LAYOFF-EXPDAT  PIC X(07).                     
     A*解聘資料-打詐通報種類代碼                                    
     A         03  CIX119-LAYOFF-IMCODE  PIC X(02).                     
     A*解聘資料-動態通知日期                                        
     A         03  CIX119-LAYOFF-KNODAT  PIC X(07).                     
40624A*臨櫃鍵入-異動日期                                            
  "  A         03  CIX119-TELLER-CDATE   PIC X(07).                     
  "  A*臨櫃鍵入-外籍移工聘僱狀態註記                                
  "  A         03  CIX119-TELLER-MARK    PIC X(02).                     
  "  A*臨櫃鍵入-解聘／失聯／離境日期                                
40624A         03  CIX119-TELLER-DATE    PIC X(07).                     
40624C         03  CIX119-FILLER         PIC X(84).                     
      *                                                                 
40624A*##120************************************************************
     A     02  CIX-DATA120  REDEFINES  CIX-DATA.                        
     A* CIXKY1=120; CIXKY2= CI-KEY + X(12)                              
     A*地方資產管理專區客戶註記                                       
     A         03  CIX120-AMH-FLAG       PIC X(01).                     
     A*地方資產管理專區異動日期                                       
     A         03  CIX120-AMH-DATE       PIC X(07).                     
     A*地方資產管理專區異動分行                                       
     A         03  CIX120-AMH-BRH        PIC X(04).                     
     A*特店收單業務註記                                               
     A         03  CIX120-SMF-FLAG       PIC X(01).                     
     A*特店收單業務異動日期                                           
     A         03  CIX120-SMF-DATE       PIC X(07).                     
41029A*高敏感客戶                                                     
  "  A         03  CIX120-SENSI-CUST     PIC X(01).                     
41223A*現金或其他貴重物品運送保全業者註記                             
     A         03  CIX120-CAD-FLAG       PIC X(01).                     
     A*現金或其他貴重物品運送保全業者異動日期                         
     A         03  CIX120-CAD-DATE       PIC X(07).                     
50211A*管制名單Y:是                                                 
  "  A         03  CIX120-CONTROL-ID     PIC X(01).                     
50211A*管制原因                                                       
  "  A         03  CIX120-CONTROL-REASON PIC X(02).                     
  "  C         03  CIX120-FILLER         PIC X(101).                    
      *                                                                 
40624A*##121************************************************************
     A     02  CIX-DATA121  REDEFINES  CIX-DATA.                        
     A* CIXKY1=121; CIXKY2= CI-KEY + X(12)                              
     A*關懷註記                                                       
     A         03  CIX121-FLAG           PIC X(01).                     
     A*通報分行                                                       
     A         03  CIX121-BRH            PIC X(04).                     
     A*通報行員                                                       
     A         03  CIX121-TL             PIC X(02).                     
     A*核准主管                                                       
     A         03  CIX121-SP             PIC X(02).                     
     A*建檔日期                                                       
     A         03  CIX121-ONDATE         PIC X(07).                     
     A*解除日期                                                       
     A         03  CIX121-OFFDATE        PIC X(07).                     
     A*說明                                                           
     A         03  CIX121-DESC           PIC X(82).                     
     A*帳號                                                           
     A         03  CIX121-ACCNO          PIC X(13).                     
40624A         03  CIX121-FILLER         PIC X(15).                     
      *                                                                 
40924A*##122************************************************************
     A     02  CIX-DATA122  REDEFINES  CIX-DATA.                        
     A* CIXKY1=122; CIXKY2= CI-KEY + X(12)                              
     A*關懷註記-金融阻詐聯防平台                                    
     A         03  CIX122-FLAG           PIC X(01).                     
     A*通報分行                                                       
     A         03  CIX122-BRH            PIC X(04).                     
     A*通報行員                                                       
     A         03  CIX122-TL             PIC X(02).                     
     A*核准主管                                                       
     A         03  CIX122-SP             PIC X(02).                     
     A*建檔日期                                                       
     A         03  CIX122-ONDATE         PIC X(07).                     
     A*解除日期                                                       
     A         03  CIX122-OFFDATE        PIC X(07).                     
     A*說明                                                           
     A         03  CIX122-DESC           PIC X(82).                     
     A*帳號(未用)                                                   
     A         03  CIX122-ACCNO          PIC X(13).                     
40924A         03  CIX122-FILLER         PIC X(15).                     
      *                                                                 
40924A*##123************************************************************
     A     02  CIX-DATA123  REDEFINES  CIX-DATA.                        
     A* CIXKY1=123; CIXKY2= CI-KEY + X(12)                              
     A*關懷註記-警政署潛在被害人                                    
     A         03  CIX123-FLAG           PIC X(01).                     
     A*通報分行                                                       
     A         03  CIX123-BRH            PIC X(04).                     
     A*通報行員                                                       
     A         03  CIX123-TL             PIC X(02).                     
     A*核准主管                                                       
     A         03  CIX123-SP             PIC X(02).                     
     A*建檔日期                                                       
     A         03  CIX123-ONDATE         PIC X(07).                     
     A*解除日期                                                       
     A         03  CIX123-OFFDATE        PIC X(07).                     
     A*說明                                                           
     A         03  CIX123-DESC           PIC X(82).                     
     A*帳號(未用)                                                   
     A         03  CIX123-ACCNO          PIC X(13).                     
     A*通報類別                                                       
50630A         03  CIX123-TYPE           PIC X(02).                     
  "  C         03  CIX123-FILLER         PIC X(13).                     
      *                                                                 
41223A*##124************************************************************
     A     02  CIX-DATA124  REDEFINES  CIX-DATA.                        
     A*  定存解約及大額轉匯出指定聯絡人                               
     A* CIXKY1=124; CIXKY2= CI-KEY + X(12)                              
     A*指定聯絡人註記                                                 
     A         03  CIX124-CONT-FLG     PIC X(01).                       
     A*指定聯絡人姓名                                                 
     A         03  CIX124-CONT-NAME    PIC X(16).                       
     A*指定聯絡人關係                                                 
     A         03  CIX124-CONT-REL     PIC X(16).                       
     A*指定聯絡人行動電話                                             
     A         03  CIX124-CONT-PHONE   PIC X(10).                       
     A*異動日期                                                       
     A         03  CIX124-DATE         PIC X(7).                        
     A*異動分行                                                       
     A         03  CIX124-BR           PIC X(4).                        
41223A         03  FILLER              PIC X(79).                       
50324A*##125************************************************************
     A     02  CIX-DATA125  REDEFINES  CIX-DATA.                        
     A* 自行派員外收                                             1
     A* CIXKY1=125; CIXKY2= BRANCH-NO X(4) + X(18)                      
     A*建檔日期                                                       
     A         03  CIX125-CDATE        PIC X(7).                        
     A*核准文號                                                       
     A         03  CIX125-DOC          PIC X(10).                       
50324A         03  FILLER              PIC X(116).                      
10316A********************************************************          
      *                                                                 
      *個資告知-各業務告知代數CIXNT1~10                             
11213A     02  CIX-DATAA00  REDEFINES  CIX-DATA.                        
11213A* CIXKY1=A00,B00; CIXKY2= CI-KEY + X(12)                          
01130A         03  CIXNTA-DATA  OCCURS  10 TIMES.                       
      *各項個資代數                                                   
11213A             05  CIXNT           PIC X(02).                       
11213A             05  FILLER          PIC X(01).                       
11213A         03  FILLER              PIC X(103).                      
      *                                                                 
      *個資告知-拒絕行銷                                            
11213A     02  CIX-DATAXX   REDEFINES  CIX-DATA.                        
11213A* CIXKY1=A01~B10; CIXKY2= CI-KEY + CIXNT(2) + X(10)               
      *拒絕行銷及勿擾(A01,B01)                                        
11213A         03  CIXDSC              PIC X(01).                       
11213A         03  FILLER              PIC X(01).                       
      *帳號X(16)                                                      
11213A         03  CIXAC               PIC X(16).                       
11213A         03  FILLER              PIC X(01).                       
      *建檔日                                                         
11213A         03  CIXTXDT             PIC X(07).                       
11213A         03  FILLER              PIC X(01).                       
      *簽署分行                                                       
11213A         03  CIXBH               PIC X(04).                       
11213A         03  FILLER              PIC X(01).                       
      *櫃號                                                           
11213A         03  CIXTL               PIC X(02).                       
11213A         03  FILLER              PIC X(01).                       
      *徵提日                                                         
11213A         03  CIXQDT              PIC X(07).                       
11213A         03  FILLER              PIC X(01).                       
      *序號                                                           
11213A         03  CIXBCINT            PIC X(05).                       
11213A         03  FILLER              PIC X(01).                       
      *結清日                                                         
11213A         03  CIXECD              PIC X(07).                       
11213A         03  FILLER              PIC X(01).                       
      *刪除註記                                                       
11213A         03  CIXDEL              PIC X(01).                       
40917M         03  FILLER              PIC X(01).                       
      *受理行員ID                                                     
40917A         03  CIXID               PIC X(10).                       
80724A         03  FILLER              PIC X(01).                       
     A*合作金庫金融控股股份有限公司拒絕行銷註記(A01)                  
     A         03  CIXHOLD             PIC X(1).                        
     A         03  FILLER              PIC X(1).                        
     A*合作金庫商業銀行股份有限公司拒絕行銷註記(A01)                  
     A         03  CIXBANK             PIC X(1).                        
     A         03  FILLER              PIC X(1).                        
     A*合作金庫人壽保險股份有限公司拒絕行銷註記(A01)                  
     A         03  CIXBNP              PIC X(1).                        
     A         03  FILLER              PIC X(1).                        
     A*合作金庫創業投資股份有限公司拒絕行銷註記(A01)                  
     A         03  CIXVBS              PIC X(1).                        
     A         03  FILLER              PIC X(1).                        
     A*合作金庫證券投資信託股份有限公司拒絕行銷註記(A01)              
     A         03  CIXVCC              PIC X(1).                        
     A         03  FILLER              PIC X(1).                        
     A*合作金庫證券股份有限公司拒絕行銷註記(A01)                      
     A         03  CIXSEC              PIC X(1).                        
     A         03  FILLER              PIC X(1).                        
     A*合作金庫資產管理股份有限公司拒絕行銷註記(A01)                  
     A         03  CIXAMC              PIC X(1).                        
     A         03  FILLER              PIC X(1).                        
     A*合作金庫票券金融股份有限公司拒絕行銷註記(A01)                  
80724A         03  CIXBFC              PIC X(1).                        
80724C         03  FILLER              PIC X(48).                       
60623A* OBU客戶清查                                                   
     A     02  CIX-DATAO01  REDEFINES  CIX-DATA.                        
     A* CIXKY1=O01; CIXKY2= CI-KEY + X(12)                              
     A         03  CIXOBU              PIC X.                           
     A         03  CIXTXDO1            PIC X(8).                        
     A         03  CIXBHO1             PIC X(4).                        
     A         03  FILLER              PIC X(120).                      
71222A******************************************************************
     A* CRS檔案出生國描述                                             
     A     02  CIX-DATAC01  REDEFINES  CIX-DATA.                        
     A         03  CIXNATP             PIC  X(70).                      
     A         03  FILLER              PIC  X(63).                      
     A* CRS檔案出生城市描述                                           
     A     02  CIX-DATAC02  REDEFINES  CIX-DATA.                        
     A         03  CIXCTYP             PIC  X(70).                      
     A         03  FILLER              PIC  X(63).                      
     A* CRS通訊地址路街　　　                                         
     A     02  CIX-DATAC03  REDEFINES  CIX-DATA.                        
     A         03  CIXCROD             PIC  X(80).                      
     A         03  FILLER              PIC  X(53).                      
     A     02  CIX-DATAC04  REDEFINES  CIX-DATA.                        
     A* CRS通訊地址城市                                               
     A         03  CIXCCTY             PIC  X(80).                      
     A         03  FILLER              PIC  X(01).                      
     A* CRS通訊地址國別                                               
     A         03  CIXCTRY             PIC  X(02).                      
     A         03  FILLER              PIC  X(01).                      
     A* CRS通訊地址郵遞區號                                           
     A         03  CIXCPOS             PIC  X(10).                      
71222A         03  FILLER              PIC  X(39).                      
80103A******************************************************************
     A*各項跨行手續費優惠設定總檔(KEY=L25,DATA=L133)                  
     A     02  CIX-DATAFEE  REDEFINES  CIX-DATA.                        
     A* CIXKY1=FEE, CIXKY2= CI-KEY(10)+總檔序號00~XX(2)+X(10)         
     A**是否有下一個總檔序號註記(初值N,當不夠用時改Y並設下筆)   
     A**目前不使用                                                    
     A         03  CIXFNN              PIC X(01).                       
     A         03  FILLER      OCCURS  3  TIMES.                        
     A***是否享有此類優惠註記(Y:有/N:無/ X ) -> 3種優惠INDEX    
     A             05  CIXFAG          PIC X(01).                       
91124A***對應CIXFAG享有之優惠類別(E或空白：員工優惠/M會員兌點)  
     A*** (/D數位存款/S薪轉/V理財(S.V先保留未使用)              
91124A             05  CIXFTYPE        PIC X(01).                       
91124D*        03  FILLER              PIC X(03).                       
     A***各項手續費優惠內容                                           
     A         03  FILLER      OCCURS  3  TIMES.                        
00527C****優惠迄日/ (數位存款優惠-放開戶日)                       
     A             05  CIXFEDT         PIC 9(07)   COMP-3.              
00527C****優惠帳號/ (數位存款優惠-放數位存款開戶帳號)             
     A             05  CIXFACNO        PIC X(13).                       
     A****優惠負擔行(不需設定的優惠此欄位空白,EX:員工)            
     A             05  CIXFCBR         PIC X(04).                       
     A****是否為跨提跨轉共用次數(Y:為共用次數/N:非共用次數)       
     A             05  CIXFMK          PIC X(01).                       
     A*****設定優惠筆數(跨提)                                       
     A             05  CIXFCT-W        PIC S9(03)  COMP-3.              
     A*****設定優惠金額(跨提)                                       
     A             05  CIXFAM-W        PIC S9(02)  COMP-3.              
     A*****已使用優惠筆數(跨提)                                     
     A             05  CIXFCTS-W       PIC S9(03)  COMP-3.              
     A*****上次優惠交易日(跨提)                                     
     A             05  CIXFLTD-W       PIC 9(07)   COMP-3.              
     A*****設定優惠筆數(跨轉)                                       
     A             05  CIXFCT-T        PIC S9(03)  COMP-3.              
00527A             05  FILLER          REDEFINES   CIXFCT-T.            
     A****(數存優惠->放是否為全新戶註記, Y表全新戶N非全新)      
     A                 10  CIXFNEW     PIC X(01).                       
     A****(數存優惠->放是否變更為一般存款戶,Y表已變更N未變更)   
00527A                 10  CIXFNOR     PIC X(01).                       
     A*****設定優惠金額(跨轉)                                       
     A             05  CIXFAM-T        PIC S9(02)  COMP-3.              
     A*****已使用優惠筆數(跨轉)                                     
     A             05  CIXFCTS-T       PIC S9(03)  COMP-3.              
     A*****上次優惠交易日(跨轉)                                     
     A             05  CIXFLTD-T       PIC 9(07)   COMP-3.              
80103A***============================================================***
     A*跨行手續費優惠明細檔- F01行員優惠(KEY=L25,DATA=L133)         
     A     02  CIX-DATAF01  REDEFINES  CIX-DATA.                        
     A* CIXKY1=F01~F0*; CIXKY2= ACNO(13)+年月YYYMM (5)+X(4)           
     A**帳務行                                                        
     A         03  CIXFMBR             PIC X(04).                       
     A**身份證統編                                                    
     A         03  CIXFID              PIC X(10).                       
     A****已使用優惠筆數(跨提)                                      
     A         03  CIXFDCT-W           PIC S9(03)  COMP-3.              
     A****已使用優惠金額(跨提)                                      
     A         03  CIXFDAM-W           PIC S9(05)  COMP-3.              
     A****上次優惠交易日(跨提)                                      
     A         03  CIXFDLDT-W          PIC 9(07)  COMP-3.               
     A****已使用優惠筆數(跨轉)                                      
     A         03  CIXFDCT-T           PIC S9(03)  COMP-3.              
     A****已使用優惠金額(跨轉)                                      
     A         03  CIXFDAM-T           PIC S9(05)  COMP-3.              
     A****上次優惠交易日(跨轉)                                      
     A         03  CIXFDLDT-T          PIC 9(07)  COMP-3.               
     A         03  FILLER              PIC X(101).                      
     A*                                                                 
80103A******************************************************************
80927A*##NWA-***********************************************************
     A*無卡提款綁定帳號資料(LEN=133)                                  
     A* CIXKY1=NWA    ; CIXKY2= ACNO(13)+ FILLER(9)                     
     A     02  CIX-DATNWA   REDEFINES  CIX-DATA.                        
     A*申請通路 (A:ATM / M:行動網銀OTP )                            
     A         03  CIXWWY              PIC X(01).                       
     A*申請狀態 (1:申請中未綁定/ 2:已完成綁定/ D:已取消綁定)    
     A         03  CIXWTUS             PIC X(01).                       
     A*申請日期                                                       
     A         03  CIXWDTA             PIC X(07).                       
     A*申請時間                                                       
     A         03  CIXWHMA             PIC X(06).                       
     A*綁定日期                                                       
     A         03  CIXWDTB             PIC X(07).                       
     A*綁定時間                                                       
     A         03  CIXWHMB             PIC X(06).                       
     A*取消綁定日期                                                   
     A         03  CIXWDTC             PIC X(07).                       
     A*取消綁定時間                                                   
     A         03  CIXWHMC             PIC X(06).                       
     A*申請有效迄時(YYYMMDDHHMMSS)                                    
     A         03  CIXWUTD             PIC X(13).                       
     A*手機設備認證碼(僅供ATM申請時讓行動網銀綁定認證使用)        
     A         03  CIXWCOD             PIC X(08).                       
     A*手機設備認證碼錯誤次數                                         
     A         03  CIXWCNT             PIC 9(01).                       
     A*手機設備認證碼上次錯誤日期                                     
     A         03  CIXWDTE             PIC X(07).                       
     A*手機設備認證碼上次錯誤時間                                     
     A         03  CIXWHME             PIC X(06).                       
     A         03  FILLER              PIC X(57).                       
     A*##NWD-***********************************************************
     A*無卡提款預約提款明細資料(LEN=133)                              
     A* CIXKY1=NWD    ; CIXKY2= SEQ(10)+ACNO(12)                        
     A     02  CIX-DATNWD   REDEFINES  CIX-DATA.                        
     A*預約有效迄時(YYYMMDDHHMMSS)                                    
     A         03  CIXNWD-EXPIRY       PIC X(13).                       
     A*預約狀態(1正常2已提領3取消4錯誤３次5系統取消)        
     A         03  CIXNWD-STAUS        PIC X(01).                       
     A*預約帳號                                                       
     A         03  CIXNWD-ACNO         PIC X(13).                       
     A*預約交易日期                                                   
     A         03  CIXNWD-DATE         PIC X(07).                       
     A*預約交易時間                                                   
     A         03  CIXNWD-TIME         PIC X(06).                       
     A*預約金額                                                       
     A         03  CIXNWD-AMT          PIC 9(11).                       
     A*交易成功日期/取消日期                                        
     A         03  CIXNWD-TXDATE       PIC X(07).                       
     A*交易成功時間/取消時間                                        
     A         03  CIXNWD-TXTIME       PIC X(06).                       
     A*執行交易成功之ATM序號(銀行碼3+序號7)                     
     A         03  CIXNWD-STAN         PIC X(10).                       
     A*交易沖正時間                                                   
     A         03  CIXNWD-TXTIME-RVS   PIC X(06).                       
     A*成功交易實際手續費                                             
     A         03  CIXNWD-FEE          PIC 9(02).                       
80927A         03  FILLER              PIC X(51).                       
      ******************************************************************
      *                                                                 
