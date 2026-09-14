      ****************************************************************  
       01  VADSEG.                                                      
           02  LL                      PIC 999         COMP VALUE 300.  
           02  VADKY.                                                   
               03  VADBH               PIC X(4)        VALUE SPACE.     
90224C         03  VADOXD              PIC X(7)        VALUE SPACE.     
90224C         03  VADTP               PIC X(1)        VALUE SPACE.     
               03  VADOST              PIC X(6)        VALUE SPACE.     
           02  VADKY1  REDEFINES  VADKY.                                
               03  VADUNT              PIC X(08).                       
               03  VADTYP              PIC X(05).                       
               03  VADNO               PIC X(04).                       
               03  FILLER              PIC X(01).                       
           02  VADKY2  REDEFINES  VADKY.                                
               03  VADTXD              PIC 9(07).                       
               03  VADSEQ              PIC 9(06).                       
               03  FILLER              PIC X(05).                       
           02  VADKY3  REDEFINES  VADKY.                                
               03  VADACCSEQ.                                           
                   05  VADACC          PIC X(03).                       
                   05  VADSEQ3         PIC X(06).                       
               03  VADEUM              PIC X(08).                       
               03  FILLER              PIC X(01).                       
      *  省水入帳通知2252 (0560688) 使用                            
80512A     02  VADKY6  REDEFINES  VADKY.                                
     A         03  VADKY6-TP           PIC X(02).                       
     A         03  VADKY6-DATE         PIC 9(07).                       
     A         03  VADKY6-SEQ          PIC X(04).                       
80512A         03  FILLER              PIC X(05).                       
           02  VADKY8  REDEFINES  VADKY.                                
      *  銀行交易日期(彰化地方法院虛擬帳號)                         
               03  VADTRDT8            PIC 9(07).                       
               03  VADTRSQ8            PIC 9(06).                       
               03  FILLER              PIC X(05).                       
           02  VADKY9  REDEFINES  VADKY.                                
      *  全國性繳費控制檔                                             
               03  VADTRDT9            PIC X(04).                       
               03  FILLER              PIC X(14).                       
           02  VADKYA  REDEFINES  VADKY.                                
      *  國民年金　　                                               
               03  VADIDNO             PIC X(10).                       
               03  FILLER              PIC X(08).                       
61030A     02  VADKY10 REDEFINES  VADKY.                                
     A*  消費扣款財金特店檔                                           
     A         03  VADTRDT10           PIC X(16).                       
61030A         03  FILLER              PIC X(02).                       
71216A     02  VADKY11 REDEFINES  VADKY.                                
71216A*  全國性繳費控制檔                                             
71216A         03  VAD11CI             PIC X(10).                       
71216A         03  VAD11UN             PIC X(08).                       
71216A     02  VADKY12 REDEFINES  VADKY.                                
71216A*  全國性繳費索引檔                                             
71216A*  全國性繳費控制檔－為方便讀取沿用VADDAT9                      
71216A         03  VAD90212            PIC X(05).                       
71216A         03  VAD90312            PIC X(04).                       
71216A         03  VAD90112            PIC X(09).                       
80516A*會計外匯帳務上傳明細                                           
80516A     02  VADKY13 REDEFINES  VADKY.                                
80516A*交易日期                                                       
80516A         03  VADKY-TXDATE        PIC 9(7)        COMP-3.          
80516A*交易幣別                                                       
80516A         03  VADKY-CCY           PIC 9(2).                        
80516A*交易科子目代號                                                 
80516A         03  VADKY-ACTNO         PIC X(9).                        
80516A*交易序號                                                       
80516A         03  VADKY-SEQNO         PIC S9(5)       COMP-3.          
80930A     02  VADKY15 REDEFINES  VADKY.                                
     A*   WFT                                                           
               03  VADKY15-ORG         PIC X(02).                       
               03  VADKY15-KEY         PIC X(16).                       
81001A     02  VADKYB   REDEFINES  VADKY.                               
   "  ********交易日期               ***************************      
   "           03  VADOPD                PIC  9(07).                    
   "  ********交易時間               ***************************      
   "           03  VADOPT                PIC  9(08).                    
81001A         03  VADSEQA               PIC  9(03).                    
71130A     02  VADKY16 REDEFINES  VADKY.                                
               03  VAD16-BHI             PIC  X(04).                    
               03  VAD16-TXD             PIC  X(07).                    
               03  VAD16-SEQ             PIC  X(06).                    
               03  FILLER                PIC  X(01).                    
00601A     02  VADKY17 REDEFINES  VADKY.                                
     A         03  VADKY17-BINLEN      PIC X(02).                       
     A         03  VADKY17-BIN         PIC X(12).                       
00601A         03  FILLER              PIC X(04).                       
20201A     02  VADKYK  REDEFINES  VADKY.                                
  "            03  VADSNO              PIC 9(04).                       
  "            03  FILLER              PIC X(14).                       
21016A     02  VADKY18 REDEFINES  VADKY.                                
      *交易日期                                                       
     A         03  VADKY18-DATE        PIC X(07).                       
      *項目代號(會計明細帳摘要使用)                                 
     A         03  VADKY18-ACTNO.                                       
     A             05  VADKY18-ACT3NO  PIC X(04).                       
      *******    903塊數                                              
     A             05  VADKY18-903     PIC X(02).                       
     A         03  VADKY18-FEE-NO      REDEFINES  VADKY18-ACTNO.        
      *******    IB手續費代號                                         
     A             05  VADKY18-FEE     PIC X(06).                       
      *現金轉帳借貸註記, 1:借現 2:借轉  3.貸現   4.貸轉       
     A         03  VADKY18-DC-MK       PIC X(01).                       
      *交易序號                                                       
21016A         03  VADKY18-DWASEQ      PIC 9(06) COMP-3.                
      *                                                                 
40112A     02  VADKY19 REDEFINES  VADKY.                                
  "  A*資料類型                                                       
  "  A         03  VADKY19-TYPE        PIC X(01).                       
  "  A*上傳日期                                                       
  "  A         03  VADKY19-DATE        PIC X(08).                       
  "  A*補摺機型號                                                     
  "  A         03  VADKY19-PAM         PIC X(08).                       
40112A         03  VADKY19-NO          PIC 9(01).                       
      *                                                                 
30723A     02  VADKY20 REDEFINES  VADKY.                                
      *交易日期                                                       
     A         03  VADKY20-DATE        PIC X(07).                       
      *交易時間                                                       
     A         03  VADKY20-TIME        PIC X(06).                       
      * 903項目代號                                                   
     A         03  VADKY20-903ACT      PIC X(03).                       
30723A         03  VADKY20-FIL         PIC X(02).                       
      *                                                                 
30312A     02  VADKYCN REDEFINES  VADKY.                                
     A         03  VADKYCN-TYPE        PIC X(02).                       
     A         03  VADKYCN-KEY         PIC X(13).                       
     A         03  VADKYCN-FIL         PIC X(03).                       
      *                                                                 
31212A*代理業務-信用卡額度不足時改扣存款之設定檔                    
  "  A     02  VADKY21 REDEFINES  VADKY.                                
  "  A** PURKEY(客戶帳號/信用卡號13碼)                            
  "  A         03  VADKY21-PURKEY      PIC X(13).                       
  "  A**代繳種類:  01水費 02台電 03中華電信                     
  "  A         03  VADKY21-CALSS       PIC X(02).                       
  "  A**類別序號                                                      
31212A         03  VADKY21-SEQ         PIC 9(03).                       
      *                                                                 
40917A     02  VADKY22 REDEFINES  VADKY.                                
      *法人戶最終控制權自然人資料                                     
     A         03  VADKY22-CIRID       PIC X(15).                       
40917A         03  VADKY22-FIL         PIC X(03).                       
      *                                                                 
41222A     02  VADKY23 REDEFINES  VADKY.                                
      *數位存款帳戶                                                 
     A         03  VADKY23-PBRAN       PIC X(13).                       
41222A         03  VADKY23-FILLER      PIC X(05).                       
90924A     02  VADKY24 REDEFINES  VADKY.                                
     A         03  VAD24-BHI             PIC  X(04).                    
     A         03  VAD24-TXD             PIC  X(07).                    
     A         03  VAD24-SEQ             PIC  X(06).                    
90924A         03  FILLER                PIC  X(01).                    
50810A     02  VADKYP77 REDEFINES  VADKY.                               
     A         03  VADKYP77-BR         PIC X(04).                       
     A         03  VADKYP77-TL         PIC X(02).                       
     A         03  VADKYP77-TP         PIC X(01).                       
     A         03  VADKYP77-SQ         PIC X(06).                       
50810A         03  FILLER              PIC X(05).                       
60912A     02  VADKYP78 REDEFINES  VADKY.                               
     A         03  VADKYP78-CHK-NUM    PIC X(07).                       
60912A         03  FILLER              PIC X(11).                       
60912A     02  VADKYP79 REDEFINES  VADKY.                               
     A         03  VADKYP79-CHK-NUM    PIC X(07).                       
     A         03  VADKYP79-SEQ        PIC X(06).                       
60912A         03  FILLER              PIC X(05).                       
70312A     02  VADKYDDA REDEFINES  VADKY.                               
     A         03  VADKYDDA-TIX        PIC X(03).                       
     A         03  VADKYDDA-CID        PIC X(10).                       
70312A         03  FILLER              PIC X(05).                       
91130A     02  VADKYMPH REDEFINES  VADKY.                               
91130A         03  VADKYMPH-OPDATE     PIC X(07).                       
     A         03  VADKYMPH-OPTIME     PIC X(06).                       
     A         03  VADKYMPH-SEQ        PIC 9(02).                       
91130A         03  FILLER              PIC X(03).                       
00127A     02  VADKYCHM REDEFINES  VADKY.                               
  "  A         03  VADKYCHM-DATE       PIC X(07).                       
  "  A         03  VADKYCHM-BRH        PIC X(04).                       
  "  A         03  VADKYCHM-SEQ        PIC X(06).                       
00127A         03  FILLER              PIC X(01).                       
10727A     02  VADKYBM1 REDEFINES  VADKY.                               
     A         03  VADBM1-BHI          PIC  X(04).                      
     A         03  VADBM1-TXD          PIC  X(07).                      
     A         03  VADBM1-SEQ          PIC  X(06).                      
10727A         03  VADBM1-TYP          PIC  X(01).                      
20222A     02  VADKYAML REDEFINES  VADKY.                               
     A         03  VADAML-ITEM-KEY     PIC  X(02).                      
40624D*        03  VADAML-MON-KEY      PIC  X(06).                      
40624A         03  VADAML-MON-KEY      PIC  X(10).                      
40624C         03  VADAML-FILL         PIC  X(06).                      
41029A     02  VADKY0H8 REDEFINES  VADKY.                               
     A         03  VAD0H8-TXD          PIC  X(07).                      
     A         03  VAD0H8-TXT          PIC  X(06).                      
     A         03  VAD0H8-SEQ          PIC  X(02).                      
41029A         03  VAD0H8-FILLER       PIC  X(03).                      
90809A*大額通貨明細檔(0DM0) (VARKY=LIMIT-WASHING)(VADSEG KEY=VADKY)   
           02  VADDAT1.                                                 
               03  VADMK1              PIC X(1)        VALUE SPACE.     
               03  VADMK2              PIC X(1)        VALUE SPACE.     
90511D*        03  VADNM               PIC X(60)       VALUE SPACE.     
90511C         03  VADNM               PIC X(42)       VALUE SPACE.     
               03  VADID               PIC X(10)       VALUE SPACE.     
90224C         03  VADBT               PIC X(7)        VALUE SPACE.     
               03  VADTE               PIC X(20)       VALUE SPACE.     
               03  VADCT               PIC X(1)        VALUE SPACE.     
90224C         03  VADTD               PIC X(7)        VALUE SPACE.     
               03  VADXT               PIC X(6)        VALUE SPACE.     
               03  VADOXT              PIC X(6)        VALUE SPACE.     
               03  VADOAC              PIC X(13)       VALUE SPACE.     
               03  VADAMT              PIC S9(11)V99   COMP-3 VALUE +0. 
               03  VADAMA              PIC S9(11)V99   COMP-3 VALUE +0. 
90511D*        03  VADBNM              PIC X(60)       VALUE SPACE.     
90511C         03  VADBNM              PIC X(42)       VALUE SPACE.     
               03  VADBK               PIC X(3)        VALUE SPACE.     
               03  VADBKH              PIC X(4)        VALUE SPACE.     
               03  VADBKA              PIC X(16)       VALUE SPACE.     
90224C         03  VADOOD              PIC X(7)        VALUE SPACE.     
               03  VADOCI              PIC X(10)       VALUE SPACE.     
90809M         03  VADKID              PIC X(2)        VALUE SPACE.     
90511D*        03  VADMEO              PIC X(30)       VALUE SPACE.     
90511C         03  VADMEO              PIC X(62)       VALUE SPACE.     
21222A         03  VADNBC              PIC X(01)       VALUE SPACE.     
21222C         03  FILLER              PIC X(05)       VALUE SPACE.     
      *全國性繳費                                                     
           02  VADDAT2  REDEFINES  VADDAT1.                             
               03  VADUNN              PIC X(40).                       
               03  VADUNC              PIC X(20).                       
               03  VADNAM              PIC X(20).                       
               03  VADBKD              PIC X(07).                       
               03  VADMKM              PIC X(01).                       
               03  VADDAT              PIC X(06).                       
               03  VADCGA              PIC 999V9.                       
               03  VADCGM              PIC 999V9.                       
               03  VADCGF              PIC 999V9.                       
               03  VADCGT              PIC 999V9.                       
               03  VADCGG              PIC 999V9.                       
               03  VADCG1              PIC 999V9.                       
               03  VADCG2              PIC 999V9.                       
               03  VADCG3              PIC 999V9.                       
               03  VADCG4              PIC 999V9.                       
               03  VADCG5              PIC 999V9.                       
               03  VADFID              PIC X(07).                       
               03  VADCNA              PIC X(20).                       
               03  VADTFLG             PIC X(01).                       
               03  VADOTYP             PIC X(01).                       
               03  VADPUT              PIC X(01).                       
               03  VADFBT              PIC X(01).                       
               03  FILLER              PIC X(115).                      
           02  VADDAT3  REDEFINES  VADDAT1.                             
      *上次交易日                                                     
               03  VADLTD              PIC X(6).                        
      *ID+ACCOUNT當日累計金額                                       
               03  VADAMTD             PIC 9(6).                        
      *ID+ACCOUNT當月累計金額                                       
               03  VADAMTM             PIC 9(6).                        
      * 密碼交易當日累計金額                                          
               03  VADAMTDC            PIC 9(7).                        
               03  FILLER              PIC X(255).                      
      *  VADDAT4期貨入金系統                                          
           02  VADDAT4  REDEFINES  VADDAT1.                             
               03  VADOUT.                                              
                   04  VADBNK          PIC X(03).                       
                   04  VADACT          PIC X(16).                       
                   04  FILLER          PIC X(01).                       
               03  VADCUS              PIC X(40).                       
               03  VADPBJ              PIC X(220).                      
      *警示及問題戶                                                   
           02  VADDAT5  REDEFINES  VADDAT1.                             
               03 VAID                 PIC X(10).                       
               03 VA-BEFORE-VAEUM      PIC X(8).                        
               03 VAEEC                PIC X(2).                        
               03 VA-BEFORE-VAEEC      PIC X(2).                        
               03 VAESC                PIC X(1).                        
90308C         03 VAEDT                PIC X(7).                        
               03 VAESQ                PIC X(12).                       
               03 VAESI                PIC X(2).                        
90308C         03 VAECA                PIC X(7).                        
               03 VAECN                PIC X(8).                        
               03 VAESN                PIC X(12).                       
               03 VAESS                PIC X(2).                        
               03 VAEEM                PIC S9(11)V99 COMP-3.            
90308C         03 VA-OPEN-DATE         PIC X(7).                        
90308C         03 VA-CLOSE-DATE        PIC X(7).                        
               03 VA-REGISTER-TIME     PIC X(6).                        
               03 VA-RELEASE-TIME      PIC X(6).                        
               03 VAEBA                PIC S9(11)V99 COMP-3.            
               03 VAETE                PIC X(10).                       
10411A         03 VAECLR               PIC X(04).                       
30322A         03 VAEVRACC             PIC X(16).                       
  "  C         03 FILLER               PIC X(137).                      
      *  VADDAT6入帳交易02 DATA FOR省水入帳- 2252                   
           02  VADDAT6  REDEFINES  VADDAT1.                             
               03  VAD6TP              PIC X(02).                       
80512A         03  VAD6DT7R            PIC 9(07).                       
80512A         03  VAD6DT7 REDEFINES VAD6DT7R.                          
80512A             04  VAD6DT7Y        PIC X(01).                       
80512C             04  VAD6DT          PIC X(06).                       
80512D*        03  VAD6DT              PIC X(06).                       
               03  VAD6BK.                                              
                   04  VAD6BN          PIC X(03).                       
                   04  VAD6BH          PIC X(04).                       
               03  VAD6TC              PIC 9(07).                       
               03  VAD6TA              PIC 9(13)V99.                    
               03  VAD6FC              PIC 9(07).                       
               03  VAD6FA              PIC 9(13)V99.                    
               03  VAD6YC              PIC 9(07).                       
               03  VAD6YA              PIC 9(13)V99.                    
               03  VAD6NC              PIC 9(07).                       
               03  VAD6NA              PIC 9(13)V99.                    
               03  VAD6TT              PIC 9(05).                       
80512D*        03  FILLER              PIC X(172).                      
80512C         03  FILLER              PIC X(171).                      
      *  VADDAT7入帳交易01 DATA FOR省水入帳- 2252                   
           02  VADDAT7  REDEFINES  VADDAT1.                             
               03  VAD7TP              PIC X(02).                       
80512A         03  VAD7DT7R            PIC 9(07).                       
80512A         03  VAD7DT7 REDEFINES VAD7DT7R.                          
80512A             04  VAD7DT7Y        PIC X(01).                       
80512C             04  VAD7DT          PIC X(06).                       
80512D*        03  VAD7DT              PIC X(06).                       
               03  VAD7SQ              PIC X(04).                       
               03  VAD7BK.                                              
                   04  VAD7BN          PIC X(03).                       
                   04  VAD7BH          PIC X(04).                       
               03  VAD7AC.                                              
                   04  VAD7AF          PIC X(03).                       
                   04  VAD7AH          PIC X(04).                       
                   04  VAD7AT          PIC X(03).                       
                   04  VAD7AN          PIC X(06).                       
               03  VAD7CN              PIC 9(07).                       
               03  VAD7CA              PIC 9(13)V99.                    
               03  VAD7YN              PIC 9(07).                       
               03  VAD7YA              PIC 9(13)V99.                    
               03  VAD7CS              PIC X(05).                       
               03  VAD7CFN             PIC X(01).                       
80512D*        03  FILLER              PIC X(195).                      
80512C         03  FILLER              PIC X(194).                      
      *  VADDAT8彰化地方法院虛擬帳號                                  
           02  VADDAT8  REDEFINES  VADDAT1.                             
      *  帳務日期                                                     
               03  VAD8ACDT            PIC X(07).                       
      *  交易時間                                                     
               03  VAD8TRTM            PIC X(06).                       
      *  虛擬帳號                                                     
               03  VAD8DACT            PIC X(16).                       
      *  繳費金額                                                     
               03  VAD8TAMT            PIC S9(10).                      
      *  繳費方式                                                     
               03  VAD8TYPE            PIC X(01).                       
      *  繳款人姓名                                                   
               03  VAD8NAME            PIC X(30).                       
      *  備註資料                                                     
               03  VAD8CMMT.                                            
      *  轉出銀行                                                     
                   05 VAD8BANK         PIC X(03).                       
                   05 VAD8FIL1         PIC X(01).                       
      *  轉出帳號                                                     
                   05 VAD8TOUT         PIC X(16).                       
                   05 VAD8FIL2         PIC X(20).                       
               03  FILLER              PIC X(170).                      
      *  VADDAT9全國性繳費設定檔                                      
           02  VADDAT9  REDEFINES  VADDAT1.                             
      *  委託單位代號                                                 
               03 VAD901        PIC X(08).                              
      *  繳費類別                                                     
               03 VAD902        PIC X(05).                              
      *  費用代號                                                     
               03 VAD903        PIC X(04).                              
      *  使用虛擬帳號                                                 
               03 VAD904           PIC X(01).                           
      *  入帳帳號                                                     
               03 VAD905           PIC X(14).                           
      *  指標位置                                                     
               03 VAD906           PIC X(04).                           
      *  須檢核本行信用卡卡號                                         
               03 VAD907           PIC X(01).                           
      *  帳號或科目                                                   
               03 VAD908           PIC X(01).                           
      *  主辦行                                                       
               03 VAD909           PIC X(04).                           
      *  組別                                                         
               03 VAD910           PIC X(01).                           
      *  塊別                                                         
               03 VAD911           PIC X(02).                           
      *  帳號（實體帳號                                               
               03 VAD912           PIC X(14).                           
      *  費用代號                                                     
               03 VAD913           PIC X(04).                           
      *  費用名稱                                                     
               03 VAD914           PIC X(20).                           
      *  臨櫃代收代號                                                 
               03 VAD915           PIC X(04).                           
      *  委託單位代號                                                 
               03 VAD916           PIC X(08).                           
      *  事業單位中文名稱                                             
               03 VAD917           PIC X(16).                           
      *  繳費類別                                                     
               03 VAD918           PIC X(05).                           
      *  科子目                                                       
               03 VAD919           PIC X(03).                           
      *  客戶負擔手續費或事業單位負擔手續費                           
               03 VAD920           PIC 9(03)V9.                         
      *  設備代理行手續費                                             
               03 VAD921           PIC 9(03)V9.                         
      *  發卡行手續費                                                 
               03 VAD922           PIC 9(03)V9.                         
      *  支付財金手續費                                               
               03 VAD923           PIC 9(03)V9.                         
      *  帳務代理行手續費收入                                         
               03 VAD924           PIC 9(03)V9.                         
      *  扣款手續費收取方式                                           
71216A         03 VAD925           PIC X(1).                            
71216A*  資料有無首尾筆                                               
71216A         03 VAD926           PIC X(1).                            
71216A*  帳號（實體帳號)之銀行代號                                  
71216A         03 VAD927           PIC X(03).                           
71216A*  自行核印手續費率                                             
71216A         03 VAD928           PIC 9(03)V9.                         
71216A*  手續費收取帳號                                               
71216A         03 VAD929           PIC X(14).                           
71216A*  委託單位CI                                                   
71216A         03 VAD930           PIC X(10).                           
71216A*  檢核繳費期限(Y:檢核 N:不檢核)                            
71216A         03 VAD931           PIC X(01).                           
80516A*  費用代號限額                                                 
80516A         03 VAD932           PIC 9(09).                           
80516C*  分行警示金額                                                 
80516A         03 VAD933           PIC 9(09).                           
90208A*  單批扣款警示限額                                             
90208A         03 VAD934           PIC 9(09).                           
90208A*  單月累計扣款警示限額                                         
90208A         03 VAD935           PIC 9(09).                           
20222A*  建檔日期                                                   
     A         03 VAD936           PIC 9(07).                           
     A*  最後異動日                                                 
     A         03 VAD937           PIC 9(08).                           
20222C         03 FILLER           PIC X(56).                           
80101A*  VADDATA 國民年金轉帳代繳約定書　　 *****                     
           02  VADDATA   REDEFINES  VADDAT1.                            
               03  VADNAME         PIC X(40).                           
               03  VADBRD          PIC X(07).                           
               03  VADTEL1         PIC X(22).                           
               03  VADTEL2         PIC X(10).                           
               03  FILLER          PIC X(201).                          
61030A*金融卡消費扣款特店名稱(財金)                                 
           02  VADDAT10  REDEFINES  VADDAT1.                            
 3             03  VAD-MD-BANK         PIC 9(03).                       
19             03  VAD-MD-CODE         PIC 9(16).                       
65             03  VAD-MD-NAME         PIC X(46).                       
77             03  VAD-MD-SHORT-NAME   PIC X(12).                       
81             03  VAD-MD-MCC          PIC X(04).                       
280            03  FILLER              PIC X(199).                      
80516A*會計外匯帳務上傳明細                                           
80516A     02  VADDAT13 REDEFINES  VADDAT1.                             
80516A*交易類別<1:存款2:放款3:外匯>                             
80516A         03  VADTY               PIC X(1).                        
80516A*掛帳成功註記< 1:失敗2:成功>                                
80516A         03  VADMOT              PIC X(1).                        
80516A*現金轉帳註記<1:現金2:轉帳>                                 
80516A         03  VADCTY              PIC X(1).                        
80516A*借貸註記<C:貸方D:借方>                                     
80516A         03  VADCD               PIC X(1).                        
80516A*交易筆數                                                       
80516A         03  VADTCT              PIC 9(4).                        
80516A*交易金額                                                       
80516A         03  VADACAMT            PIC S9(13)V99   COMP-3.          
80516A*記帳員代號                                                     
80516A         03  VADCTR              PIC X(2).                        
80516A*傳票號數                                                       
80516A         03  VADBIR              PIC 9(6).                        
80516A*備註(含上傳失敗原因等敘述)                                   
80516A         03  VADACMO             PIC X(78).                       
80516A         03  FILLER              PIC X(178).                      
80930A*  WFT 280                                                        
           02  VADDAT15 REDEFINES  VADDAT1.                             
               03  VAD15-ACTN          PIC X(13).                       
               03  VAD15-ACTO          PIC X(13).                       
               03  VAD15-DBCR          PIC X(01).                       
               03  VAD15-TX-DATE       PIC X(07).                       
               03  VAD15-TX-TIME       PIC X(06).                       
               03  VAD15-TX-AMT        PIC S9(11)V99.                   
               03  VAD15-CHK-ID        PIC X(01).                       
               03  VAD15-ID            PIC X(10).                       
               03  VAD15-TYPE          PIC X(01).                       
               03  VAD15-CUST          PIC X(36).                       
               03  VAD15-CLBR          PIC X(04).                       
               03  VAD15-TX-RC         PIC X(03).                       
               03  VAD15-TX-RC-L       PIC X(01).                       
               03  VAD15-CH            PIC X(04).                       
               03  VAD15-GROUP         PIC X(01).                       
               03  VAD15-OVD-AMT       PIC S9(11)V99  COMP-3.           
               03  VAD15-OVD-ACCT      PIC X(03).                       
               03  VAD15-OVD-GROUP     PIC X(01).                       
               03  VAD15-NON-OVD-AMT   PIC S9(11)V99  COMP-3.           
               03  VAD15-OPI           PIC S9(13)     COMP-3.           
               03  VAD15-OPO           PIC S9(13)     COMP-3.           
               03  VAD15-OIR           PIC 9(02).                       
               03  VAD15-NPI           PIC S9(13)     COMP-3.           
               03  VAD15-NPO           PIC S9(13)     COMP-3.           
               03  VAD15-NIR           PIC 9(02).                       
               03  VAD15-NEW-BAL       PIC S9(11)V99  COMP-3.           
               03  VAD15-OLD-BAL       PIC S9(11)V99  COMP-3.           
               03  VAD15-AGENT         PIC X(18).                       
               03  VAD15-875-ACCT      PIC X(03).                       
               03  VAD15-875-GROUP     PIC X(01).                       
               03  VAD15-875-OVD-AMT   PIC S9(11)V99  COMP-3.           
               03  VAD15-876-ACCT      PIC X(03).                       
               03  VAD15-876-GROUP     PIC X(01).                       
               03  VAD15-876-OVD-AMT   PIC S9(11)V99  COMP-3.           
10426A         03  VAD15-CBR           PIC X(04).                       
10426C         03  FILLER              PIC X(058).                      
71130A*臨櫃聯行結清銷戶                                               
71130A     02  VADDAT16 REDEFINES  VADDAT1.                             
               03  VAD16-ACT           PIC X(13).                       
               03  VAD16-RLB           PIC S9(11)V99.                   
               03  VAD16-CUR           PIC X(03).                       
               03  VAD16-ITD           PIC X(120).                      
               03  FILLER              PIC X(131).                      
81001A*    EBILLING                                                     
81001A     02  VADDATB   REDEFINES  VADDAT1.                            
  "   ********營業日期(入扣帳日)   ***************************      
  "            03  VADTXDB                   PIC  9(07).                
  "   ********身分證號或統一編號    ***************************       
  "            03  VADIDB                    PIC  X(10).                
  "   * EB: ＥＢＩＬＬ 轉帳類別                                     
  "   ************************************************************      
  "            03  VADCL                 PIC  X(02).                    
  "   ********查詢序號　　　　　　  ***************************       
  "            03  VADSTAN               PIC  X(07).                    
  "   ********當日Ｔ／翌日Ｎ　　  ***************************         
  "            03  VADTRN                PIC  X(01).                    
  "   ********客戶應付手續費(9(3))  ***************************       
  "            03  VADFEE                PIC  9(03).                    
  "   ********轉出行　　　　　　　　***************************       
  "            03  VADFBK                PIC  X(03).                    
  "   ********轉出帳號　　　　　　　***************************       
  "            03  VADFANF.                                             
  "                05  VADFFIL           PIC  X(03).                    
  "                05  VADFAN.                                          
  "                    10  VADFBH        PIC  X(04).                    
  "                    10  VADFAC        PIC  X(03).                    
  "                    10  VADFSQ        PIC  X(06).                    
  "   ********轉入行　　　　　　　　***************************       
  "            03  VADTBK                PIC  X(03).                    
  "   ********轉入帳號　　　　　　　***************************       
  "            03  VADTAN.                                              
  "                05  VADTFIL           PIC  X(03).                    
  "                05  VADTCAN.                                         
  "                    10  VADTBH        PIC  X(04).                    
  "                    10  VADTAC        PIC  X(03).                    
  "                    10  VADTSQ        PIC  X(06).                    
  "   ********交易金額            　*******                         
  "            03  VADAMTR               PIC  S9(11)V99.                
  "   ********轉出時經銷商代號    　*******                         
  "            03  VADFAG                PIC  X(13).                    
  "   ********轉入時經銷商代號    　*******                         
  "            03  VADTAG                PIC  X(13).                    
  "            03  VADCOM                PIC  X(120).                   
  "   ******** 轉帳類別= EB (EBILLING 撥帳)                         
  "            03  VADCOM-EBILLING REDEFINES  VADCOM.                   
  "                05  VADBILL           PIC  X(04).                    
  "   ******** 超商手續費收取方式  ***************************        
  "                05  VADFEST           PIC  X(01).                    
  "   ******** 超商手續費　　　　  ***************************        
  "                05  VADFEES           PIC  9(11).                    
  "   ******** 合庫手續費收取方式  ***************************        
  "                05  VADFEBT           PIC  X(01).                    
  "   ******** 合庫手續費　　　　  ***************************        
  "                05  VADFEEB           PIC  9(11).                    
  "   ******** 委託單位列印之帳單金額　*************                  
  "                05  VADBAMT           PIC  9(11).                    
  "   ******** 合庫清算專戶帳號　　        *********                  
  "                05  VADBACC           PIC  X(13).                    
  "   ******** 合庫清算專戶帳號備註欄      *********                  
  "                05  VADBACM           PIC  9(18).                    
  "   ******** 委託單位入帳方式　　        *********                  
  "                05  VADTACT           PIC  X(01).                    
  "   ******** 委託單位入帳帳號或科目      *********                  
  "                05  VADTACC           PIC  X(13).                    
  "   ******** 委託單位入帳帳號為Ｂ時要輸入組別*****                  
  "                05  VADTACG           PIC  X(01).                    
  "   ******** 委託單位統一編號　　        *********                  
  "                05  VADTRID           PIC  X(10).                    
  "   ******** 委託單位入帳帳號備註欄      *********                  
  "                05  VADTACM           PIC  X(18).                    
  "   ******** 借貸　　　　　　　　　　　                             
  "                05  VADCOD1           PIC  X(01).                    
  "   ******** Ａ／Ｂ　Ａ專戶扣　Ｂ委託單位　                         
  "                05  VADCOD2           PIC  X(01).                    
  "                05  FILLER            PIC  X(05).                    
  "   **END OF  VADCOM *************************************            
  "            03  VADFTP                PIC  X(02).                    
  "            03  VADDMK                PIC  X(01).                    
  "            03  VADAPL                PIC  X(01).                    
81001A         03  VADSNAM               PIC  X(30).                    
103XXA         03  VADCBRO               PIC  X(04).                    
103XXA         03  VADCBRI               PIC  X(04).                    
  "   ******** 交易毫微秒                                             
40815A         03  VADTMS                PIC  X(06).                    
40815C         03  FILLER                PIC  X(05).                    
00601A*ＢＩＮＴＡＢＬＥ檔                                             
           02  VADDAT17  REDEFINES  VADDAT1.                            
1-11           03  VAD17-ISSUE-BANK       PIC X(11).                    
12-71          03  VAD17-ISSUE-BANK-NAME  PIC X(60).                    
72-111         03  VAD17-CARD-NAME        PIC X(40).                    
113            03  VAD17-CARD-LEN-FLAG    PIC 9(02).                    
125            03  VAD17-CARD-FLAG        PIC X(12).                    
127            03  VAD17-CARD-LEN         PIC 9(02).                    
128            03  VAD17-CARD-KIND        PIC X(01).                    
129            03  VAD17-INFO-TYPE        PIC X(01).                    
132            03  VAD17-ACCT-CCD         PIC X(03).                    
145            03  VAD17-TRAN-SUPPORT     PIC X(13).                    
157            03  VAD17-CHANNEL-SUPPORT  PIC X(12).                    
158            03  VAD17-CLEAR-NETWORK    PIC X(01).                    
160            03  VAD17-END-FLAG         PIC X(02).                    
168            03  VAD17-UPDATE-DATE      PIC X(08).                    
280            03  FILLER                 PIC X(112).                   
20201A*  VADDATK1黃金存摺優惠手續費專案資料檔                         
  "        02  VADDATK1  REDEFINES  VADDAT1.                            
  "   *  專案名稱                                                     
  "            03  VADKPN              PIC X(22).                       
  "   *  網銀注意事項代碼                                             
  "            03  VADKAI              PIC X(02).                       
  "   *  專案代碼                                                     
  "            03  VADKPC              PIC X(02).                       
  "   *  活動起日                                                     
  "            03  VADKAB              PIC X(07).                       
  "   *  活動訖日                                                     
  "            03  VADKAE              PIC X(07).                       
  "   *  優惠起日                                                     
  "            03  VADKPB              PIC X(07).                       
  "   *  優惠訖日                                                     
  "            03  VADKPE              PIC X(07).                       
  "   *  優惠手續費                                                   
  "            03  VADKPF              PIC 9(05).                       
  "   *  建檔日期                                                     
  "            03  VADKBD              PIC X(07).                       
  "   *  建檔時間                                                     
  "            03  VADKBT              PIC X(06).                       
  "   *  建檔人連線代號                                               
  "            03  VADKOP              PIC X(09).                       
  "   *  授權人連線代號                                               
  "            03  VADKSP              PIC X(09).                       
  "   *  專案種類及適用客戶代碼                                       
  "            03  VADKPM.                                              
  "   *  專案種類                                                     
  "                05  VADKPT          PIC X(1).                        
  "   *  適用客戶代碼                                                 
  "                05  VADKPP          PIC X(1).                        
  "   *  刪除註記                                                     
  "            03  VADKDC              PIC X(01).                       
  "   *  上一筆優惠案筆次                                             
  "            03  VADKTB              PIC 9(04).                       
  "   *  刪除日期                                                     
  "            03  VADKDD              PIC X(07).                       
  "   *  刪除時間                                                     
  "            03  VADKDT              PIC X(06).                       
  "   *  刪除建檔人連線代號                                           
  "            03  VADKOPD             PIC X(09).                       
  "   *  刪除授權人連線代號                                           
  "            03  VADKSPD             PIC X(09).                       
  "            03  FILLER              PIC X(152).                      
21016A*應收付利息及手續費等明細資料                                   
21016A     02  VADDAT18  REDEFINES  VADDAT1.                            
      *交易金額                                                       
               03  VAD18-AMT              PIC S9(13)V99.                
      * C : 結清;  M :中途銷戶                                      
               03  VAD18-CLOSE-MID        PIC X(01).                    
      *放款利息三碼子目                                               
               03  VAD18-LA3NO            PIC X(03).                    
      *沖正註記, Y : 沖正                                           
               03  VAD18-RVS              PIC X(01).                    
      *沖正交易序號/ 原交易序號                                     
               03  VAD18-RVS-SEQO         PIC X(06).                    
      *主管授權代號                                                   
               03  VAD18-DWASPR           PIC X(02).                    
      *主管授權序號                                                   
               03  VAD18-SPRNO            PIC X(03).                    
      *交易筆數                                                       
               03  VAD18-TCNT             PIC 9(05).                    
      *帳號/個金貸款別/扣款帳號                                   
21119C*        03  VAD18-CIEAN            PIC X(13).                    
21119C         03  VAD18-CIEAN            PIC X(14).                    
      *L/C  NO.                                                       
               03  VAD18-LCNO             PIC X(18).                    
      *收費起迄日                                                     
               03  VAD18-BDATE            PIC X(15).                    
      *代放款手續費-年月                                            
               03  VAD18-YYMM             PIC X(05).                    
      *臨櫃手續費摘要內容                                             
               03  VAD18-MEMO             PIC X(80).                    
      *戶名                                                           
               03  VAD18-CIRNM            PIC X(80).                    
      *明細帳批號                                                     
               03  VAD18-738CNT           PIC 9(3).                     
      *交易種類                                                       
               03  VAD18-TRAN-TYPE        PIC X(01).                    
               03  FILLER                 PIC X(28).                    
40112A*補摺機狀態及統計資料上傳主機                                   
  "  A     02  VADDAT19  REDEFINES  VADDAT1.                            
  "  A         03  VAD19-DATE-PGM          PIC X(08).                   
  "  A         03  VAD19-DATE-MEMO         PIC X(08).                   
  "  A         03  VAD19-CNT-SUCCESS       PIC 9(04).                   
  "  A         03  VAD19-CNT-FAIL1         PIC 9(03).                   
  "  A         03  VAD19-CNT-FAIL2         PIC 9(03).                   
  "  A         03  VAD19-CNT-FAIL3         PIC 9(03).                   
  "  A         03  VAD19-CNT-FAIL4         PIC 9(03).                   
  "  A         03  VAD19-CNT-FAIL5         PIC 9(03).                   
  "  A         03  VAD19-CNT-FAIL6         PIC 9(03).                   
  "  A         03  VAD19-CNT-FAIL7         PIC 9(03).                   
  "  A         03  VAD19-CNT-FAIL8         PIC 9(03).                   
  "  A         03  VAD19-CNT-FAIL9         PIC 9(03).                   
  "  A         03  VAD19-CNT-FAILA         PIC 9(03).                   
  "  A         03  VAD19-OTHER-MEMO        PIC X(75).                   
40112A         03  VAD19-FILLER            PIC X(155).                  
30723A* 903科目日結單                                                 
21016A     02  VADDAT20  REDEFINES  VADDAT1.                            
      *現金借方筆數                                                   
               03  VAD20-CASH-DX          PIC S9(7).                    
      *現金借方金額                                                   
               03  VAD20-CASH-D           PIC S9(13)V99.                
      *現金貸方筆數                                                   
               03  VAD20-CASH-CX          PIC S9(7).                    
      *現金貸方金額                                                   
               03  VAD20-CASH-C           PIC S9(13)V99.                
      *轉帳借方筆數                                                   
               03  VAD20-TRAN-DX          PIC S9(7).                    
      *轉帳借方金額                                                   
               03  VAD20-TRAN-D           PIC S9(13)V99.                
      *轉帳貸方筆數                                                   
               03  VAD20-TRAN-CX          PIC S9(7).                    
      *轉帳貸方金額                                                   
               03  VAD20-TRAN-C           PIC S9(13)V99.                
      *昨日餘額筆數                                                   
               03  VAD20-LBAL-X           PIC S9(7).                    
      *昨日餘額                                                       
               03  VAD20-LBAL             PIC S9(13)V99.                
      *本日餘額筆數                                                   
               03  VAD20-TBAL-X           PIC S9(7).                    
      *本日餘額                                                       
               03  VAD20-TBAL             PIC S9(13)V99.                
               03  FILLER                 PIC X(148).                   
31212A*代理業務-信用卡額度不足時改扣存款之設定檔                    
  "  A     02  VADDAT21  REDEFINES  VADDAT1.                            
  "  A**代繳用戶編號                                                  
  "  A         03  VAD21-NO              PIC X(20).                     
  "  A** ACH交易代號(583.585)                                         
  "  A         03  VAD21-ACHTIX          PIC X(03).                     
  "  A** ACH發動者統編                                                
  "  A         03  VAD21-ACHCID          PIC X(10).                     
  "  A**約定扣繳之存款帳號(FOR EBAKING)                               
  "  A         03  VAD21-ACCTNO          PIC X(13).                     
  "  A**鍵檔日期                                                      
  "  A         03  VAD21-ADD-DATE        PIC X(07).                     
  "  A**解除日期                                                      
  "  A         03  VAD21-DEL-DATE        PIC X(07).                     
  "  A**鍵檔分行                                                      
  "  A         03  VAD21-ADD-BRH         PIC X(04).                     
  "  A**解除分行                                                      
  "  A         03  VAD21-DEL-BRH         PIC X(04).                     
  "  A**鍵檔交易代號                                                  
  "  A         03  VAD21-ADD-TXCODE      PIC X(08).                     
  "  A**解除交易代號                                                  
  "  A         03  VAD21-DEL-TXCODE      PIC X(08).                     
31212A         03  VAD21-FILLER          PIC X(196).                    
21021A*進口關稅檔                                                     
     A     02  VADDAT84  REDEFINES  VADDAT1.                            
     A         03  VAD84TXD                PIC X(07).                   
     A         03  VAD84HMS                PIC X(06).                   
     A         03  VAD84BHI                PIC X(04).                   
     A         03  VAD84TLI                PIC X(02).                   
     A         03  VAD84OP                 PIC X(02).                   
     A         03  VAD84SEQ                PIC X(06).                   
     A**          繳費類型C:退款 D:繳費                           
     A         03  VAD84CD                 PIC X(01).                   
     A**          交易類型1:現金 2:轉帳                           
     A         03  VAD84KND                PIC X(01).                   
     A**          姓名                                                
     A         03  VAD84NAME               PIC X(18).                   
     A**          電話                                                
     A         03  VAD84TEL                PIC X(10).                   
     A**          客戶統一編號                                        
     A         03  VAD84CI                 PIC X(10).                   
     A**          退款時存款帳號                                      
     A         03  VAD84ACC                PIC X(13).                   
     A**          總金額                                              
     A         03  VAD84AMT                PIC 9(11).                   
     A**          手續費                                              
     A         03  VAD84FEE                PIC 9(04).                   
     A*                                                                 
     A***************************************************************** 
     A*           關稅繳納方式 1:先稅後放                           
     A*                        3:先放後稅                           
     A*                        5:規費繳納                           
     A***************************************************************** 
     A         03  VAD84TYP                PIC X(01).                   
     A**          稅單號碼一                                          
     A         03  VAD84NO1                PIC X(14).                   
     A**          稅單金額一                                          
     A         03  VAD84AM1                PIC 9(11).                   
     A**          稅單號碼二                                          
     A         03  VAD84NO2                PIC X(14).                   
     A**          稅單金額二                                          
     A         03  VAD84AM2                PIC 9(11).                   
     A**          稅單號碼三                                          
     A         03  VAD84NO3                PIC X(14).                   
     A**          稅單金額三                                          
     A         03  VAD84AM3                PIC 9(11).                   
     A**          稅單號碼四                                          
     A         03  VAD84NO4                PIC X(14).                   
     A**          稅單金額四                                          
     A         03  VAD84AM4                PIC 9(11).                   
     A**          稅單號碼五                                          
     A         03  VAD84NO5                PIC X(14).                   
     A**          稅單金額五                                          
     A         03  VAD84AM5                PIC 9(11).                   
     A**          稅單號碼六                                          
     A         03  VAD84NO6                PIC X(14).                   
     A**          稅單金額六                                          
     A         03  VAD84AM6                PIC 9(11).                   
     A**          稅單號碼七                                          
     A         03  VAD84NO7                PIC X(14).                   
     A**          稅單金額七                                          
     A         03  VAD84AM7                PIC 9(11).                   
21021A         03  FILLER                  PIC X(09).                   
30312A*人民幣定期轉帳約定資料                                         
           02  VADDATCN  REDEFINES  VADDAT1.                            
      *       身份證號／統一編號                                      
               03  VADDATCN-CIK            PIC X(10).                   
      *       外幣帳號－帳務行（出表使用）                            
               03  VADDATCN-XCBR           PIC X(04).                   
      *       台幣帳號                                                
               03  VADDATCN-TAN            PIC X(13).                   
      *       台幣帳號－帳務行（出表使用）                            
               03  VADDATCN-TCBR           PIC X(04).                   
      *       存入人民幣金額                                          
               03  VADDATCN-AMT            PIC 9(13) COMP-3.            
      *       執行週期－每日註記　（Ｙ：設定　ＳＰＡＣＥ：未設定）    
               03  VADDATCN-DAY            PIC X(01).                   
      *       執行週期－每月某日１                                    
               03  VADDATCN-MON1           PIC 9(02).                   
      *       執行週期－每月某日２                                    
               03  VADDATCN-MON2           PIC 9(02).                   
      *       執行週期－每月某日３                                    
               03  VADDATCN-MON3           PIC 9(02).                   
      *       約定狀態　０：正常　１：臨櫃取消　２：批次取消          
      *                 ３：暫停（仍佔額度）                          
               03  VADDATCN-STS            PIC X(01).                   
      *       執行失敗次數                                            
               03  VADDATCN-ERR            PIC 9(01).                   
      *       暫停扣款次數                                            
               03  VADDATCN-STOP           PIC 9(02).                   
      *       最後執行日                                              
               03  VADDATCN-RDATE          PIC X(07).                   
      *       約定截止日                                              
               03  VADDATCN-DDATE          PIC X(07).                   
      *       最後異動日                                              
               03  VADDATCN-LDATE          PIC X(07).                   
      *       最後修改分行                                            
               03  VADDATCN-LBRH           PIC X(04).                   
      *       建檔日                                                  
               03  VADDATCN-CDATE          PIC X(07).                   
      *       建檔分行                                                
               03  VADDATCN-CBRH           PIC X(04).                   
31119A*       匯率優惠減碼                                            
     A         03  VADDATCN-RED            PIC S9V9(4) COMP-3.          
      *       保留                                                    
31119C         03  VADDATCN-FIL            PIC X(192).                  
30312A*每日人民幣限額控管                                             
           02  VADDATCN-CIDATA  REDEFINES  VADDAT1.                     
               03  VADDATCN-CI-DDAMT   PIC 9(07) COMP-3.                
               03  VADDATCN-CI-MDAMT   OCCURS 31 TIMES PIC 9(07) COMP-3.
               03  VADDATCN-CI-FIL     PIC X(152).                      
40917A*法人戶最終控制權自然人                                         
     A     02  VADDAT22  REDEFINES  VADDAT1.                            
     A*刪除註記                                                       
     A         03  VADFAR-DEL          PIC X(01).                       
     A*增修日期                                                       
     A         03  VADFAR-DWATXD       PIC X(07).                       
     A*增修分行                                                       
     A         03  VADFAR-DWABHI       PIC X(04).                       
     A*增修櫃員                                                       
     A         03  VADFAR-DWATLI       PIC X(02).                       
     A*自然人戶名                                                     
     A         03  VADFAR-NAME         PIC X(60).                       
     A*身份類別1 : 具控制權之最終自然人                             
     A         03  VADFAR-KIND1        PIC X(01).                       
     A*身份類別2 : 實際受益人                                       
     A         03  VADFAR-KIND2        PIC X(01).                       
     A*身份類別3 : 高階管理人                                       
     A         03  VADFAR-KIND3        PIC X(01).                       
     A*出生日期                                                       
     A         03  VADFAR-CIRBT7       PIC X(08).                       
     A*國籍(出生地)                                                 
     A         03  VADFAR-CIRPO        PIC X(02).                       
     A*身份證明類別(1:身分證 2:護照 3:其他)                     
     A         03  VADFAR-IDTYPE       PIC X(01).                       
     A*身份證明類別3之說明                                          
     A         03  VADFAR-ID3TXT       PIC X(22).                       
     A*發證有效日期(西元年月日)                                     
     A         03  VADFAR-IDDATE       PIC X(08).                       
     A*職稱                                                           
     A         03  VADFAR-TITLE        PIC X(22).                       
     A*                                                               
40917A         03  VADFAR-FIL          PIC X(140).                      
41222A*數位存款帳戶                                                 
     A     02  VADDAT23  REDEFINES  VADDAT1.                            
     A*開戶日期                                                       
     A         03  VADDIG-OPEN-DATE    PIC X(07).                       
     A*銷戶日期                                                       
     A         03  VADDIG-CLOSE-DATE   PIC X(07).                       
     A*銷戶時間                                                       
     A         03  VADDIG-CLOSE-TIME   PIC X(06).                       
     A*更新日期                                                       
     A         03  VADDIG-UPDATE-DATE  PIC X(07).                       
     A*更新時間                                                       
     A         03  VADDIG-UPDATE-TIME  PIC X(06).                       
41222A         03  VADDIG-FILLER       PIC X(247).                      
90924A* 1030交易存款人、代理人資訊                                    
90924A     02  VADDAT24 REDEFINES  VADDAT1.                             
               03  VAD24-TD            PIC X(08).                       
               03  VAD24-HMS           PIC X(06).                       
               03  VAD24-ACT           PIC X(13).                       
               03  VAD24-AMT           PIC S9(11)V99.                   
               03  VAD24-AGN           PIC X(18).                       
               03  VAD24-SPR           PIC X(02).                       
               03  VAD24-ITM           PIC X(01).                       
               03  VAD24-USR           PIC X(01).                       
               03  VAD24-UID           PIC X(10).                       
               03  VAD24-UNM           PIC X(42).                       
               03  VAD24-UTEL          PIC X(20).                       
               03  VAD24-AID           PIC X(10).                       
               03  VAD24-ANM           PIC X(42).                       
               03  VAD24-ATEL          PIC X(20).                       
               03  FILLER              PIC X(74).                       
50810A     02  VADDAP77  REDEFINES  VADDAT1.                            
50810A         03  VADP77-TP           PIC X(01).                       
50810A         03  VADP77-DT           PIC X(07).                       
50810A         03  VADP77-BR           PIC X(04).                       
50810A         03  VADP77-TL           PIC X(02).                       
50810A         03  VADP77-SQ           PIC X(06).                       
50810A         03  VADP77-HHMMSS       PIC X(06).                       
50810A         03  VADP77-AMT-TYPE     PIC X(01).                       
50810A         03  VADP77-BA.                                           
50810A             05  VADP77-BA1      PIC X(09).                       
50810A             05  VADP77-BA2      PIC X(20).                       
50810A             05  VADP77-BA3      PIC X(15).                       
50810A         03  VADP77-AMT          PIC 9(11).                       
50810A         03  VADP77-FILLER       PIC X(198).                      
      ********************************************************          
60630A*集保有價證券(280)                                            
      ********************************************************          
     A     02  VADDATSM  REDEFINES  VADDAT1.                            
     A*分行最後交易日期                                               
     A         03  VADSMA-LAST-TXN-DATE PIC X(07).                      
     A*寄存日期                                                       
     A         03  VADSMA-EXDT         PIC X(07).                       
     A*提存人往來三加人                                               
     A         03  VADSMA-PP-NAME      PIC X(40).                       
     A*戶名                                                           
     A         03  VADSMA-CI-NAME      PIC X(38).                       
     A*統一編號                                                       
     A         03  VADSMA-CI           PIC X(10).                       
     A*集保帳號                                                       
     A         03  VADSMA-CIAC         PIC X(11).                       
     A*證券代號                                                       
     A         03  VADSMA-STK          PIC X(06).                       
     A*證券名稱                                                       
     A         03  VADSMA-STK-NAME     PIC X(16).                       
     A*證券種類                                                       
     A         03  VADSMA-STK-TYPE     PIC X(01).                       
     A*單位名稱                                                       
     A         03  VADSMA-UNIT-NAME    PIC X(01).                       
     A*數額                                                           
     A         03  VADSMA-AMT          PIC 9(13).                       
     A*面額                                                           
     A         03  VADSMA-FACE-AMT     PIC 9(10).                       
     A*開立次數                                                       
     A         03  VADSMA-OPEN         PIC 9(02).                       
     A*其他應行說明事項                                               
     A         03  VADSMA-OTMM         PIC X(100).                      
     A*集保交易日期                                                   
     A         03  VADSMA-TXDT         PIC X(07).                       
     A*集保交易代號                                                   
     A         03  VADSMA-TXCO         PIC X(03).                       
60630A         03  VADSMA-FILLER       PIC X(08).                       
60912A     02  VADDAP78  REDEFINES  VADDAT1.                            
     A         03  VADP78-TOT-AMT      PIC 9(11).                       
     A         03  VADP78-CHK-AMT      PIC 9(11).                       
     A         03  VADP78-CICST        PIC X(01).                       
     A         03  VADP78-FILLER       PIC X(257).                      
     A     02  VADDAP79  REDEFINES  VADDAT1.                            
     A         03  VADP79-CVRKEY       PIC X(04).                       
     A         03  VADP79-AGENT-BHI    PIC X(04).                       
     A         03  VADP79-CV-LL        PIC 9(03) COMP.                  
     A         03  VADP79-BHI          PIC X(04).                       
     A         03  VADP79-DAY          PIC X(02).                       
     A         03  VADP79-SEQ          PIC X(07).                       
     A         03  VADP79-OPD          PIC X(07).                       
     A         03  VADP79-TXD          PIC X(07).                       
     A         03  VADP79-OPT          PIC X(06).                       
     A         03  VADP79-TYPE         PIC X(01).                       
     A         03  VADP79-DETI         PIC X(01).                       
     A         03  VADP79-CODE.                                         
     A             05  VADP79-CODE1        PIC X(09).                   
     A             05  VADP79-CODE2        PIC X(20).                   
     A             05  VADP79-CODE3        PIC X(15).                   
     A             05  VADP79-CODE4.                                    
     A                 06  VADP79-TYPE1    PIC X(01).                   
     A                 06  VADP79-TYPE2    PIC X(01).                   
     A                 06  VADP79-CODEA    PIC X(05).                   
     A                 06  VADP79-FILLER   PIC X(03).                   
     A         03  VADP79-EAMT         PIC 9(12).                       
     A         03  VADP79-OAMT         PIC 9(07).                       
     A         03  VADP79-CKDT REDEFINES VADP79-OAMT  PIC 9(07).        
     A         03  VADP79-TRBAN        PIC X(03).                       
     A         03  VADP79-SOUR         PIC X(01).                       
     A         03  VADP79-ACCT         PIC X(13).                       
     A         03  VADP79-RVS          PIC X(01).                       
     A         03  VADP79-AMT1         PIC 9(10).                       
     A         03  VADP79-INT1         PIC 9(10).                       
     A         03  VADP79-CHKM         PIC X(01).                       
90512A         03  VADP79-PAY-T  REDEFINES VADP79-CHKM  PIC X(01).      
     A         03  VADP79-NEXT         PIC X(01).                       
     A         03  VADP79-CHK-AMT      PIC 9(11).                       
     A         03  VADP79-AMTCVKEY     PIC X(04).                       
     A         03  VADP79-PUD77-FLAG   PIC X(01).                       
60912A         03  VADP79-FILLER       PIC X(106).                      
70312A     02  VADDAE22  REDEFINES  VADDAT1.                            
      ****************************************************************  
      ****************************************************************  
      ** -X-   1: TXN-CODE   交易代號檔(檔名：TXNCODE.TXT           
      **       2: EDDA       核印費    (檔名：EDDA_TXFEE.TXT        
      **       3: EACH       手續費    (檔名：FEECODE.TXT           
      **       4: DDA        核印費    (檔名：DDA_TXFEE.TXT         
      **       5: ACH        手續費    (檔名：ACHFEE_B.ACH          
      ** ---------------------------                                    
      ** FEEX  1:發動行      2:扣款行      3:入帳行    4:票交所 
      **       5:自行簽約價  6.胯行簽約價  7:收費標準(A或S)     
      ****************************************************************  
      ****************************************************************  
      *        EACH   交易代號檔(檔名：TXNCODE.TXT)                 
      ****************************************************************  
      *           適用業務類別                                        
70312A         03  VADE22-1-KIND       PIC X(04).                       
      ****************************************************************  
      *            EDDA  核印費                                       
      *           電子化子化授權交易代號及手續費檔                    
      *           匯出檔名：EDDA_TXFEE.TXT                            
      *************************************************************     
70312A         03  VADE22-2EDDA-FEE1   PIC 9(08).                       
70312A         03  VADE22-2EDDA-FEE23  PIC 9(08).                       
70312A         03  VADE22-2EDDA-FEE4   PIC 9(08).                       
70312A         03  VADE22-2EDDA-ST     PIC X(01).                       
      *************************************************************     
      *            EACH  手續費                                       
      *           交易手續費檔(檔名：FEECODE.TXT)                   
      *            VADE22-3EACH-TYPE : 手續費多元收費模式             
      *************************************************************     
80312A         03  VADE22-3EACH-GROUP.                                  
80312A             05  VADE22-3EACH-FEE1   PIC S9(03)V99.               
80312A             05  VADE22-3EACH-FEE2   PIC S9(03)V99.               
80312A             05  VADE22-3EACH-FEE3   PIC S9(03)V99.               
80312A             05  VADE22-3EACH-FEE4   PIC S9(03)V99.               
81220A             05  VADE22-3EACH-FEE5   PIC S9(03)V99.               
81220A             05  VADE22-3EACH-FEE6   PIC S9(03)V99.               
00929A         03  VADE22-3EACH-BEGIN-DATE REDEFINES VADE22-3EACH-GROUP.
00929A             05  VADE22-3EACH-INDEX  PIC X(01).                   
00929A             05  VADE22-3EACH-B-DATE PIC X(08).                   
00929A             05  VADE22-3EACH-E-DATE PIC X(08).                   
00929C             05  FILLER              PIC X(13).                   
00929A         03  VADE22-3EACH-LIMIT-AMT  REDEFINES VADE22-3EACH-GROUP.
00929A             05  FILLER              PIC X(01).                   
00929A             05  VADE22-3EACH-B-AMT1 PIC 9(13) COMP-3.            
00929A             05  VADE22-3EACH-B-AMT2 PIC 9(13) COMP-3.            
00929A             05  VADE22-3EACH-B-AMT3 PIC 9(13) COMP-3.            
00929A             05  VADE22-3EACH-B-AMT4 PIC 9(13) COMP-3.            
00929A             05  FILLER              PIC X(01).                   
      *************************************************************     
      *            TYPE:手續費類型A:固定   B:外加                 
      *                           C:百分比 D:級距                 
      *            UNIT:手續費單位1:元                              
      *                             2:%                               
      *************************************************************     
00929A         03  VADE22-3EACH-OTHER.                                  
00929A             05  VADE22-3EACH-TYPE   PIC X(01).                   
00929A             05  VADE22-3EACH-UNIT   PIC X(01).                   
00929C             05  FILLER              PIC X(13).                   
      *************************************************************     
      *            DDA   核印費                                       
      *************************************************************     
00929A         03  VADE22-4DDA-ALL         REDEFINES VADE22-3EACH-OTHER.
00929A             05  VADE22-4DDA-FEE1    PIC 9(03)V99.                
00929A             05  VADE22-4DDA-FEE4    PIC 9(03)V99.                
00929A             05  VADE22-4DDA-FEE23   PIC 9(03)V99.                
      *************************************************************     
      *            ACH   手續費                                       
      *************************************************************     
70312A         03  VADE22-5ACH-FEE23   PIC 9(03)V99.                    
70312A         03  VADE22-5ACH-FEE4    PIC 9(03)V99.                    
30315A         03  FILLER              PIC X(196).                      
70312A     02  VADDAE23  REDEFINES  VADDAT1.                            
      ****************************************************************  
      *        TCB EDDA EACH 設定檔(檔名：企網銀)                 
      *        TCB  DDA  ACH 設定檔(檔名： WFT媒檔檔案 ACFTE      
      ****************************************************************  
70312A         03  VADE23-1-BR         PIC X(04).                       
70312A         03  VADE23-1-ACC-FLAG   PIC X(01).                       
70312A         03  VADE23-1-ACC        PIC X(03).                       
70312A         03  VADE23-1-GROUP      PIC X(01).                       
70312A         03  VADE23-1-ENTRY      PIC X(02).                       
70312A         03  VADE23-1-FEE-FLAG   PIC X(01).                       
70312A         03  VADE23-1-FEE-ACT    PIC 9(16).                       
70312A         03  VADE23-1-ACT1       PIC 9(16).                       
70312A         03  VADE23-1-ACT2       PIC 9(16).                       
70312A         03  VADE23-1-ACT3       PIC 9(16).                       
70312A         03  VADE23-1-ACT4       PIC 9(16).                       
70312A         03  VADE23-1-ACT5       PIC 9(16).                       
      ****************************************************************  
      *  FEEX  1:發動行      2:扣款行      3:入帳行    4:票交所 
      *        5:自行簽約價  6.胯行簽約價  7:收費標準(A或S)     
      *  -X-   2: EDDA  核印費                                        
      *        3: EACH  手續費                                        
      *        4:  DDA  核印費                                        
      *        5:  ACH  手續費                                        
      ****************************************************************  
      *            EDDA  核印費分行向發動者收費                       
      *************************************************************     
70312A         03  VADE23-2EDDA-FEE1   PIC 9(03)V99.                    
70312A         03  VADE23-2EDDA-FEE2   PIC 9(03)V99.                    
70312A         03  VADE23-2EDDA-ST     PIC X(01).                       
      ****************************************************************  
      *            EACH  手續費分行向發動者收費                       
      *************************************************************     
70312A         03  VADE23-3EACH-FEE1   PIC 9(03)V99.                    
70312A         03  VADE23-3EACH-FEE2   PIC 9(03)V99.                    
70312A         03  VADE23-3EACH-ST     PIC X(01).                       
      *************************************************************     
      *            DDA   核印費分行向發動者收費                       
      *************************************************************     
70312A         03  VADE23-4DDA-FEE1    PIC 9(03)V99.                    
70312A         03  VADE23-4DDA-FEE2    PIC 9(03)V99.                    
70312A         03  VADE23-4DDA-ST      PIC X(01).                       
      *************************************************************     
      *            ACH   手續費分行向發動者收費                       
      *************************************************************     
70312A         03  VADE23-5ACH-FEE1    PIC 9(03)V99.                    
70312A         03  VADE23-5ACH-FEE2    PIC 9(03)V99.                    
70312A         03  VADE23-5ACH-ST      PIC X(01).                       
30315A         03  FILLER              PIC X(128).                      
70312A     02  VADDAE24  REDEFINES  VADDAT1.                            
      *************************************************************     
      *           電子化授權發動者檔                                  
      *            EDDA_CREDITORLIST.TXT                                
      *************************************************************     
      *           每筆扣繳限額-低                                   
70312A         03  VADE24-1-LOW-AMT    PIC X(08).                       
      *           每筆扣繳限額-高                                   
70312A         03  VADE24-1-HIGH-AMT   PIC X(08).                       
      *            EDDA 網站來源管道設定( Y=設定 N=無設定)        
70312A         03  VADE24-1-SET-1      PIC X(01).                       
      *           發動者轉址來源管道設定( Y=設定 N=無設定)        
70312A         03  VADE24-1-SET-2      PIC X(01).                       
      *           扣款行來源管道設定定( Y=設定 N=無設定)          
70312A         03  VADE24-1-SET-3      PIC X(01).                       
      *           發動者(行)授權免身分認證設定(Y=設定 N=無設定
70312A         03  VADE24-1-SET-4      PIC X(01).                       
      *           發動網銀雙因機制設定(Y=設定 N=無設定            
80627A         03  VADE24-1-SET-5      PIC X(01).                       
30315A         03  VADE24-FILLER       PIC X(259).                      
91130A*************                                                     
91130A     02  VADDATMPH  REDEFINES  VADDAT1.                           
               03  VADMPH-ITEM    PIC  X(02).                           
               03  VADMPH-TXCODE  PIC  X(08).                           
               03  VADMPH-TXSEQ   PIC  X(12).                           
               03  VADMPH-APPL    PIC  X(05).                           
               03  VADMPH-OLD     PIC  X(40).                           
               03  VADMPH-NEW     PIC  X(40).                           
               03  FILLER         PIC  X(173).                          
00127A     02  VADDATCHM  REDEFINES  VADDAT1.                           
  "  A         03  VADCHM-AMT     PIC  S9(13)V99.                       
  "  A         03  VADCHM-IDNO    PIC  X(10).                           
  "  A         03  VADCHM-CNAME   PIC  X(42).                           
  "  A         03  VADCHM-TEL     PIC  X(15).                           
  "  A         03  VADCHM-IDNO-A  PIC  X(10).                           
  "  A         03  VADCHM-CNAME-A PIC  X(42).                           
  "  A         03  VADCHM-TEL-A   PIC  X(15).                           
  "  A         03  VADCHM-RVS     PIC  X(01).                           
00127A         03  FILLER         PIC  X(130).                          
00527A** FOR 0DM0   (VARKY=LIMIT2WASHING)(VADSEG KEY=VADKY)             
00527A     02  VADDAT0DM  REDEFINES  VADDAT1.                           
               03  VAD0DM-POSTCOD PIC  X(05).                           
               03  VAD0DM-ADDR    PIC  X(72).                           
               03  VAD0DM-0DMTLI  PIC  X(02).                           
               03  VAD0DM-0DMSEQ  PIC  X(06).                           
               03  VAD0DM-0DMSPR  PIC  X(02).                           
               03  VAD0DM-0DMSPSQ PIC  X(03).                           
               03  VAD0DM-MODIFY  PIC  X(01).                           
               03  VAD0DM-XNAME   PIC  X(42).                           
               03  VAD0DM-TX-ACC  PIC  X(13).                           
               03  VAD0DM-ADDRCHG PIC  X(01).                           
               03  FILLER         PIC  X(133).                          
00527A     02  VADDATT     REDEFINES  VADDAT1   PIC X(280).             
00917A** FOR 0DM0-S (VARKY=XXXXCSS      )(VADSEG KEY=VADKY)             
00917A     02  VADDATCSHM  REDEFINES  VADDAT1.                          
               03  VADCSS-TXCNT     PIC  S9(05).                        
               03  VADCSS-TXAMT     PIC  S9(11)V99  COMP-3.             
               03  VADCSS-TP01CNT   PIC  S9(05).                        
               03  VADCSS-TP01AMT   PIC  S9(11)V99 COMP-3.              
               03  VADCSS-TP02CNT   PIC  S9(05).                        
               03  VADCSS-TP02AMT   PIC  S9(11)V99 COMP-3.              
               03  VADCSS-TP03CNT   PIC  S9(05).                        
               03  VADCSS-TP03AMT   PIC  S9(11)V99 COMP-3.              
               03  VADCSS-TP06CNT   PIC  S9(05).                        
               03  VADCSS-TP06AMT   PIC  S9(11)V99 COMP-3.              
               03  VADCSS-TP95CNT   PIC  S9(05).                        
               03  VADCSS-TP95AMT   PIC  S9(11)V99 COMP-3.              
               03  VADCSS-TP96CNT   PIC  S9(05).                        
               03  VADCSS-TP96AMT   PIC  S9(11)V99 COMP-3.              
               03  VADCSS-TP97CNT   PIC  S9(05).                        
               03  VADCSS-TP97AMT   PIC  S9(11)V99 COMP-3.              
               03  VADCSS-TP98CNT   PIC  S9(05).                        
               03  VADCSS-TP98AMT   PIC  S9(11)V99 COMP-3.              
               03  VADCSS-TP99CNT   PIC  S9(05).                        
               03  VADCSS-TP99AMT   PIC  S9(11)V99 COMP-3.              
00816A         03  VADCSS-TPW-CNT   PIC  S9(05).                        
00816A         03  VADCSS-TPW-AMT   PIC  S9(11)V99 COMP-3.              
20823A         03  VADCSS-TPDUCNT   PIC  S9(05).                        
20823A         03  VADCSS-TPDUAMT   PIC  S9(11)V99 COMP-3.              
               03  FILLER           PIC  X(136).                        
00917A** FOR 0DMX (VARKY=XXXXCSH      )(VADSEG KEY=VADKY)               
00917A     02  VADDATCSH   REDEFINES  VADDAT1.                          
               03  VADCSH-0DM0      PIC  X(01).                         
               03  VADCSH-RVS       PIC  X(01).                         
               03  VADCSH-TX-TIME   PIC  X(06).                         
               03  VADCSH-C-D       PIC  X(01).                         
               03  VADCSH-ACCT      PIC  X(13).                         
               03  VADCSH-AMOUNT    PIC  S9(11)V99 COMP-3.              
               03  VADCSH-TELLER    PIC  X(02).                         
               03  VADCSH-TXTYPE    PIC  X(01).                         
               03  VADCSH-APCODE    PIC  X(07).                         
               03  VADCSH-MEMO      PIC  X(20).                         
20426A         03  VADCSH-TYPE      PIC  X(02).                         
20426A         03  FILLER           PIC  X(219).                        
10727A** 4070交易紀錄(VARKY=XXXBM1   )(VADSEG KEY=VADKYBM1)           
10727A     02  VADDATBM1 REDEFINES  VADDAT1.                            
               03  VADBM1-HMS          PIC X(06).                       
               03  VADBM1-SPR          PIC X(02).                       
               03  VADBM1-OLD          PIC X(01).                       
               03  VADBM1-NEW          PIC X(01).                       
               03  FILLER              PIC X(270).                      
20222A** AML03(VARKY=0534AML03)(VADSEG KEY=VADKYAML)                  
     A     02  VADDATAML REDEFINES  VADDAT1.                            
     A*增修日期                                                       
     A         03  VADAML-DWATXD       PIC X(07).                       
     A*增修分行                                                       
     A         03  VADAML-DWABHI       PIC X(04).                       
     A*增修櫃員                                                       
     A         03  VADAML-DWATLI       PIC X(02).                       
     A*強化監督註記代碼                                               
     A         03  VADAML-MONITOR      PIC X(01).                       
     A*強化監督代碼說明                                               
     A         03  VADAML-REMARK       PIC X(82).                       
40624A*管制原因代碼                                                   
40624A         03  VADAML-CONTROL-REASON   PIC X(02).                   
40624C         03  VADAML-FILLER       PIC X(182).                      
41029A** 0H80 (VARKY=XXXX0H80)(VADSEG KEY=VADKY0H8)                   
     A     02  VADDAT0H8 REDEFINES  VADDAT1.                            
     A*交易分行                                                       
     A         03  VAD0H8-DWABHI       PIC X(04).                       
     A*交易櫃員                                                       
     A         03  VAD0H8-DWATLI       PIC X(02).                       
     A*客戶統編                                                       
     A         03  VAD0H8-CID          PIC X(10).                       
     A*交易代號                                                       
     A         03  VAD0H8-TXC          PIC X(04).                       
     A* 0H80註記(75 OR D5)                                            
     A         03  VAD0H8-CIUCC        PIC X(02).                       
41029A         03  VAD0H8-FILLER       PIC X(258).                      
