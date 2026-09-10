  
      ***************************************************************** 
      *NEW ADD "999960"-"999990"                                        
       01  SYNC-CALLING.                                                
          02  SYNC-TSDBR-KEY                  PIC X(6)  VALUE "999902". 
      *"999902" CK,MICR                                                 
          02  SYNC-TSDBR-KEY1                 PIC X(6)  VALUE "999901". 
      *"999901" PB, AMUZ2, BC, CI, GDU01                                
          02  SYNC-TSDBR-KEY3                 PIC X(6)  VALUE "999903". 
      *"999903" FD, CI, CK, PB                                          
          02  SYNC-TSDBR-KEY4                 PIC X(6)  VALUE "999904". 
      *"999904" MB, BCU01, CIUA2                                        
          02  SYNC-TSDBR-999801               PIC X(6)  VALUE "999801". 
      *"999801" VO                                                      
          02  SYNC-TSDBR-999802               PIC X(6)  VALUE "999802". 
      *"999802" CD                                                      
          02  SYNC-TSDBR-999803               PIC X(6)  VALUE "999803". 
      *"999803" EDI                                                     
          02  SYNC-TSDBR-999804               PIC X(6)  VALUE "999804". 
      *"999804"匯款RT, AMUA0                                          
          02  SYNC-TSDBR-999805               PIC X(6)  VALUE "999805". 
      *"999805"實體公債GB                                             
          02  SYNC-TSDBR-999806               PIC X(6)  VALUE "999806". 
      *"999806"無實體公債GM, GS                                       
          02  SYNC-TSDBR-999807               PIC X(6)  VALUE "999807". 
      *"999807"外匯XS, XF, XM                                         
          02  SYNC-TSDBR-999808               PIC X(6)  VALUE "999808". 
      *"999808"國庫收支GM                                             
          02  SYNC-TSDBR-999809               PIC X(6)  VALUE "999809". 
      *"999809"外匯定存XS, XF, XM     088/02/24                       
          02  SYNC-TSDBR-999810               PIC X(6)  VALUE "999810". 
      *"999810"網路轉帳EB, NT         089/02/10                       
          02  SYNC-TSDBR-999850               PIC X(6)  VALUE "999850". 
      *"999850"會計BA, TA             089/04/13                       
          02  SYNC-TSDBR-999851               PIC X(6)  VALUE "999851". 
      *"999851"信用卡CR                                               
          02  SYNC-TSDBR-999852               PIC X(6)  VALUE "999852". 
      *"999852"客服科HELP程式專用                                   
          02  SYNC-TSDBR-999853               PIC X(6)  VALUE "999853". 
      *"999853"人事薪資090/04/09                                    
          02  SYNC-TSDBR-999899               PIC X(6)  VALUE "999899". 
      *"999899"XL外匯介面XL,          089/12/06                       
          02  SYNC-TSDBR-999901               PIC X(6)  VALUE "999901". 
      *"999901" PB, AMUZ2, BC, CI, GDU01                                
          02  SYNC-TSDBR-999902               PIC X(6)  VALUE "999902". 
      *"999902" CK,MICR                                                 
          02  SYNC-TSDBR-999903               PIC X(6)  VALUE "999903". 
      *"999903" FD, CI, CK, PB                                          
          02  SYNC-TSDBR-999904               PIC X(6)  VALUE "999904". 
      *"999904" MB, BCU01, CIUA2                                        
          02  SYNC-TSDBR-999905               PIC X(6)  VALUE "999905". 
      *"999905" BC, CI, PB                                              
          02  SYNC-TSDBR-999906               PIC X(6)  VALUE "999906". 
      *"999906" FT, MB                                                  
          02  SYNC-TSDBR-999907               PIC X(6)  VALUE "999907". 
      *"999907" FG(匯兌)                                              
          02  SYNC-TSDBR-999908               PIC X(6)  VALUE "999908". 
      *"999908"公用事業PU, GM, CV, FS, PB                             
          02  SYNC-TSDBR-999909               PIC X(6)  VALUE "999909". 
      *"999909" AM                                                      
          02  SYNC-TSDBR-999910               PIC X(6)  VALUE "999910". 
      *"999910" 代收                                                  
          02  SYNC-TSDBR-999911               PIC X(6)  VALUE "999911". 
      *"999911" 外匯放款FN, XN        097/03/18                       
          02  SYNC-TSDBR-999912               PIC X(6)  VALUE "999912". 
      *"999912" EK, CI, CK                                              
          02  SYNC-TSDBR-999913               PIC X(6)  VALUE "999913". 
      *"999913" XS 097/04/15                                            
          02  SYNC-TSDBR-999914               PIC X(6)  VALUE "999914". 
      *"999914" ICB, BI, PY                                             
          02  SYNC-TSDBR-999915               PIC X(6)  VALUE "999915". 
      *"999915" PY                                                      
          02  SYNC-TSDBR-999916               PIC X(6)  VALUE "999916". 
      *"999916" CI                                                      
          02  SYNC-TSDBR-999917               PIC X(6)  VALUE "999917". 
      *"999917" GD                                                      
          02  SYNC-TSDBR-999918               PIC X(6)  VALUE "999918". 
      *"999918" PU(公用事業)                                          
          02  SYNC-TSDBR-999919               PIC X(6)  VALUE "999919". 
      *"999919" FSU04   =========================                       
          02  SYNC-TSDBR-999920               PIC X(6)  VALUE "999920". 
      *"999920" FSBMP01 =========================                       
          02  SYNC-TSDBR-999950               PIC X(6)  VALUE "999950". 
      *"999950" LA, HC                                                  
          02  SYNC-TSDBR-999955               PIC X(6)  VALUE "999955". 
      *"999955" LA                                                      
          02  SYNC-TSDBR-999956               PIC X(6)  VALUE "999956". 
      *"999956" IC CARD, FORTAM83, FORTAM86                             
          02  SYNC-TSDBR-999957               PIC X(6)  VALUE "999957". 
      *"999957" AM                                                      
          02  SYNC-TSDBR-999958               PIC X(6)  VALUE "999958". 
      *"999958" PB計息專用                                            
          02  SYNC-TSDBR-999959               PIC X(6)  VALUE "999959". 
      *"999959" PB計息專用                                            
          02  SYNC-TSDBR-999960               PIC X(6)  VALUE "999960". 
      *"999960" PB計息專用                                            
          02  SYNC-TSDBR-999961               PIC X(6)  VALUE "999961". 
      *"999961" PB計息專用                                            
          02  SYNC-TSDBR-999962               PIC X(6)  VALUE "999962". 
      *"999962" PB計息專用                                            
          02  SYNC-TSDBR-999963               PIC X(6)  VALUE "999963". 
      *"999963" PB計息專用                                            
          02  SYNC-TSDBR-999964               PIC X(6)  VALUE "999964". 
      *"999964" AM  091/03/11                                           
          02  SYNC-TSDBR-999965               PIC X(6)  VALUE "999965". 
      *"999965" BCU52, TDU02                                            
          02  SYNC-TSDBR-999966               PIC X(6)  VALUE "999966". 
      *"999966" ATM                     097/01/22                       
          02  SYNC-TSDBR-999967               PIC X(6)  VALUE "999967". 
      *"999967" ATM                     097/01/22                       
          02  SYNC-TSDBR-999968               PIC X(6)  VALUE "999968". 
      *"999968" PB利率調整用                                          
          02  SYNC-TSDBR-999969               PIC X(6)  VALUE "999969". 
          02  SYNC-TSDBR-999970               PIC X(6)  VALUE "999970". 
      *"999970" 放款  LO              103/04/22                       
          02  SYNC-TSDBR-999971               PIC X(6)  VALUE "999971". 
      *"999971" 放款  CL              103/04/22                       
          02  SYNC-TSDBR-999972               PIC X(6)  VALUE "999972". 
      *"999972" 放款 LW LR CM GA IP   103/04/22                       
          02  SYNC-TSDBR-999973               PIC X(6)  VALUE "999973". 
      *"999973" PB入扣帳專用          103/06/30                       
          02  SYNC-TSDBR-999974               PIC X(6)  VALUE "999974". 
      *"999974" PB入扣帳專用          103/06/30                       
          02  SYNC-TSDBR-999975               PIC X(6)  VALUE "999975". 
      *"999975" MB入扣帳專用          103/06/30                       
          02  SYNC-TSDBR-999976               PIC X(6)  VALUE "999976". 
      *"999976" MB入扣帳專用          103/11/27                       
          02  SYNC-TSDBR-999977               PIC X(6)  VALUE "999977". 
      *"999977" CV入扣帳專用                                          
          02  SYNC-TSDBR-999978               PIC X(6)  VALUE "999978". 
      *"999978" PU入扣帳專用                                          
          02  SYNC-TSDBR-999979               PIC X(6)  VALUE "999979". 
      *"999979" CI                                                      
          02  SYNC-TSDBR-999980               PIC X(6)  VALUE "999980". 
      *"999980" CI                                                      
          02  SYNC-TSDBR-999981               PIC X(6)  VALUE "999981". 
70124A* "999981" PB                                                     
          02  SYNC-TSDBR-999982               PIC X(6)  VALUE "999982". 
70124A* "999982" PU                                                     
          02  SYNC-TSDBR-999983               PIC X(6)  VALUE "999983". 
70627A* "999983" CI                                                     
          02  SYNC-TSDBR-999984               PIC X(6)  VALUE "999984". 
          02  SYNC-TSDBR-999985               PIC X(6)  VALUE "999985". 
          02  SYNC-TSDBR-999986               PIC X(6)  VALUE "999986". 
          02  SYNC-TSDBR-999987               PIC X(6)  VALUE "999987". 
          02  SYNC-TSDBR-999988               PIC X(6)  VALUE "999988". 
      * "999988" IB                     102/01/10                       
          02  SYNC-TSDBR-999989               PIC X(6)  VALUE "999989". 
          02  SYNC-TSDBR-999990               PIC X(6)  VALUE "999990". 
      * "999990" MPU05, MPU06, TASU01                                   
          02  SYNC-TSDBR-999999               PIC X(6)  VALUE "999999". 
      * "999999" AM                                                     
          02  SYNC-TSDBR-000003               PIC X(6)  VALUE "000003". 
      * "000003" CK BM 退票及入帳用                                   
          02  SYNC-TSDBR-000004               PIC X(6)  VALUE "000004". 
      * "000004" CK BM 退票及入帳用                                   
          02  SYNC-TSDBR-000005               PIC X(6)  VALUE "000005". 
      * "000005" CK BM 退票及入帳用                                   
          02  SYNC-TSDBR-000006               PIC X(6)  VALUE "000006". 
      * "000006" CK BM 退票及入帳用                                   
          02  SYNC-TSDBR-000007               PIC X(6)  VALUE "000007". 
      * "000007" CK BM 退票及入帳用                                   
          02  SYNC-TSDBR-000008               PIC X(6)  VALUE "000008". 
      * "000008" CK BM 退票及入帳用                                   
          02  SYNC-TSDBR-000009               PIC X(6)  VALUE "000009". 
      * "000009" CK BM 退票及入帳用                                   
          02  SYNC-TSDBR-000011               PIC X(6)  VALUE "000011". 
      * "000011" EAI使用-EAU11                                        
          02  SYNC-TSDBR-000012               PIC X(6)  VALUE "000012". 
      * "000012" 外匯XA使用                                         
          02  SYNC-TSDBR-000013               PIC X(6)  VALUE "000013". 
      * "000013" 外匯XC/XG使用                                      
          02  SYNC-TSDBR-000014               PIC X(6)  VALUE "000014". 
      * "000014" 外匯XC/XG使用                                      
          02  SYNC-TSDBR-000015               PIC X(6)  VALUE "000015". 
      * "000015" 外匯XC/XG使用                                      
          02  SYNC-TSDBR-000016               PIC X(6)  VALUE "000016". 
      * "000016" 外匯XE/XI使用                                      
          02  SYNC-TSDBR-000017               PIC X(6)  VALUE "000017". 
      * "000017" 外匯XF使用                                         
          02  SYNC-TSDBR-000018               PIC X(6)  VALUE "000018". 
      * "000018" 外匯XL使用                                         
          02  SYNC-TSDBR-000019               PIC X(6)  VALUE "000019". 
      * "000019" 外匯XR使用                                         
          02  SYNC-TSDBR-000020               PIC X(6)  VALUE "000020". 
      * "000020" 外匯XS使用                                         
          02  SYNC-TSDBR-000021               PIC X(6)  VALUE "000021". 
      * "000021" 外匯XS使用                                         
          02  SYNC-TSDBR-000022               PIC X(6)  VALUE "000022". 
      * "000022" 外匯XS使用                                         
          02  SYNC-TSDBR-000023               PIC X(6)  VALUE "000023". 
      * "000023" 外匯XT使用                                         
          02  SYNC-TSDBR-000024               PIC X(6)  VALUE "000024". 
      * "000024" 信用卡CR使用一                                     
          02  SYNC-TSDBR-000025               PIC X(6)  VALUE "000025". 
      * "000025" 信用卡CR使用二                                     
          02  SYNC-TSDBR-000026               PIC X(6)  VALUE "000026". 
      * "000026" 信用卡CR使用三                                     
          02  SYNC-TSDBR-000027               PIC X(6)  VALUE "000027". 
      * "000027" 信用卡CR使用四                                     
          02  SYNC-TSDBR-000028               PIC X(6)  VALUE "000028". 
      * "000028" 信用卡CR使用五                                     
          02  SYNC-TSDBR-000029               PIC X(6)  VALUE "000029". 
      * "000029" 信用卡CR使用六                                     
          02  SYNC-TSDBR-000030               PIC X(6)  VALUE "000030". 
      * "000030" 信用卡CR使用七                                     
          02  SYNC-TSDBR-000031               PIC X(6)  VALUE "000031". 
      * "000031" 信用卡CR使用八                                     
          02  SYNC-TSDBR-000032               PIC X(6)  VALUE "000032". 
      * "000032" 信用卡CR使用九                                     
          02  SYNC-TSDBR-000033               PIC X(6)  VALUE "000033". 
      * "000033" 信用卡CR使用十                                     
50329A    02  SYNC-TSDBR-000034               PIC X(6)  VALUE "000034". 
50329A* "000034" 放款ＨＥＬＰ　ＰＧＭ專用                         
50329A    02  SYNC-TSDBR-000035               PIC X(6)  VALUE "000035". 
50329A* "000035" 放款ＬＡ　ＰＧＭ專用                             
61116A    02  SYNC-TSDBR-000036               PIC X(6)  VALUE "000036". 
61116A* "000036"  MB計息專用                                          
61116A    02  SYNC-TSDBR-000037               PIC X(6)  VALUE "000037". 
61116A* "000037"  MB計息專用                                          
61116A    02  SYNC-TSDBR-000038               PIC X(6)  VALUE "000038". 
61116A* "000038"  MB計息專用                                          
61116A    02  SYNC-TSDBR-000039               PIC X(6)  VALUE "000039". 
61116A* "000039"  MB計息專用                                          
71108A    02  SYNC-TSDBR-000040               PIC X(6)  VALUE "000040". 
71108A* "000040"  PU, PUU42             107/11/22                       
90320A    02  SYNC-TSDBR-000041               PIC X(6)  VALUE "000041". 
90320A* "000041"  PB交易濃縮用 PBU44  109/03/20                       
00217A    02  SYNC-TSDBR-000042               PIC X(6)  VALUE "000042". 
00217A* "000042"  FN台幣基金用 FNU02  110/02/17                       
00510A    02  SYNC-TSDBR-000043               PIC X(6)  VALUE "000043". 
00510A* "000043"  PB扣押一段時間事故39用 PBU71  110/05/10           
00709A    02  SYNC-TSDBR-000044               PIC X(6)  VALUE "000044". 
00709A* "000044" 證券定期定額  PBU72  110/07/09                       
00712A    02  SYNC-TSDBR-000045               PIC X(6)  VALUE "000045". 
00712A* "000045"警示帳戶餘額1000以下轉入其他應付款PBU73 110/07/12   
11118A    02  SYNC-TSDBR-000046               PIC X(6)  VALUE "000046". 
11118A* "000046"解除、設定警示戶相關事故PBU35,PBU39 111/11/18         
20217A    02  SYNC-TSDBR-000047               PIC X(6)  VALUE "000047". 
20217A* "000047" PBU53Ｗ檔案電文傳送系統（ＷＦＴ）用                  
40328A    02  SYNC-TSDBR-000048               PIC X(6)  VALUE "000048". 
40328A* "000048" PBU39A大量登錄警示相關事故用                         
40624A    02  SYNC-TSDBR-000049               PIC X(6)  VALUE "000049". 
40624A* "000049" PBU75 颱風天延票後處理凍結金額                       
41127A    02  SYNC-TSDBR-000050               PIC X(6)  VALUE "000050". 
41127A* "000050" PBU77籌備戶開戶滿6個月後設定設定31.50事故        
      *                                                                 
          02  TSDBR-SYNC.                                               
              03  TSKEY                       PIC X(6).                 
              03  FILLER                      PIC X(42).                
              03  TSMNO                       PIC 999   COMP-3 VALUE 0. 
              03  TSTXN-SYNC OCCURS 6 TIMES   PIC S9(5) COMP-3.         
              03  TSASE OCCURS 8 TIMES.                                 
                  04  TSASED-SYNC             PIC S9(11)V99 COMP-3.     
                  04  TSTXED-SYNC             PIC 9(5)      COMP-3.     
                  04  TSASEC-SYNC             PIC S9(11)V99 COMP-3.     
                  04  TSTXEC-SYNC             PIC 9(5)      COMP-3.     
              03  TSWKA-SYNC.                                           
                  04  SYNC-PGM                PIC X(7).                 
                  04  SYNC-POINT              PIC X(16).                
                  04  POINT-TPSSGS00 REDEFINES SYNC-POINT.              
                      05  SYNC-RECORD         PIC 9(07).                
                      05  FILLER              PIC X(09).                
                  04  POINT-TPSSCI00 REDEFINES SYNC-POINT.              
                      05  SYNC-CIKEY          PIC X(10).                
                      05  FILLER              PIC X(6).                 
                  04  POINT-TPSSPB01 REDEFINES POINT-TPSSCI00.          
                      05  SYNC-COUNTER        PIC X(9).                 
                      05  SYNC-COUNT REDEFINES                          
                          SYNC-COUNTER        PIC 9(9).                 
                      05  MICR-RUN-TIMES      PIC X(2).                 
                      05  FILLER              PIC X(5).                 
                  04  POINT-TPSSPB02 REDEFINES POINT-TPSSCI00.          
                      05  SYNC-ACCNO          PIC X(13).                
                      05  FILLER              PIC X(3).                 
                  04  POINT-TPSS00IB REDEFINES POINT-TPSSCI00.          
                      05  SYNC-BRANCH         PIC X(4).                 
                      05  FILLER              PIC X(12).                
                  04  POINT-ICU02 REDEFINES POINT-TPSSCI00.             
                      05  SYNC-MCRKEY         PIC X(12).                
                      05  FILLER              PIC X(04).                
                  04  POINT-ACCT  REDEFINES POINT-TPSSCI00.             
                      05  SYNC-ACCSEG         PIC X(14).                
                      05  FILLER              PIC X(02).                
              03  TSSTA-SYNC                  PIC X(14).                
              03  STATIC-00000 REDEFINES TSSTA-SYNC.                    
                  04  SYNC-ACCNO-OTHER        PIC X(13).                
90419C            04  SYNC-GROUP              PIC X(1).                 
40701A        03  SYNC-AMOUNT  REDEFINES TSSTA-SYNC.                    
                  04  SYNC-AMT                PIC S9(15)V9(02) COMP-3.  
                  04  FILLER                  PIC X(5).                 
              03  ACCT2 REDEFINES TSSTA-SYNC.                           
                  04  SYNC-BARSEG             PIC X(5).                 
                  04  FILLER                  PIC X(9).                 
              03  TSWKB-SYNC                  PIC X(7).                 
      *                                                                 
      **********************************************************        
      * 各系統各程式使用TSKEY 102/01/10                               
      **********************************************************        
      *01、TSPCB IBTS1.EATPSS.PRODPGM                                 
      * SYNC-TSDBR-999851                                               
      *   CRHLP39,  CRUIC09,  CRU05,                                    
      *   CRU05A,   CRU05B,   CRU05C,                                   
      *   CRU06,    CRU07,    CRU11,                                    
      *   CRU12,    CRU14,    CRU20,                                    
      *   CRU21,    CRU23,    CRU27,    CRU30,                          
      * SYNC-TSDBR-999803                                               
      *   EAU01,    EBU21,    EDU01,    EDU07,                          
      * SYNC-TSDBR-999810                                               
      *   EBU05     EBU08,    EBU09,    EBU10,                          
      *   EBU12,    EBU13,    EBU16,                                    
      *   EBU17,    NTU02,    NTU03,    NTU08,                          
      *   NTU21,    NTU22,                                              
      * SYNC-TSDBR-999901                                               
      *   ISRTPS1                                                       
      * SYNC-TSDBR-999990                                               
      *   MPU05,    MPU06,    TASU01                                    
      * SYNC-TSDBR-999801                                               
      *   VOU02,    VOU04,    VOU05,                                    
      *   VOU10,    VOU14,    VOU19                                     
      *2、TSPCB IBTS1.MOVE.PRODPGM                                    
      * SYNC-TSDBR-999810                                               
      *   FOREBHU1, FOREBHU2,                                           
      * SYNC-TSDBR-999956                                               
      *   FORTAM83, FORTAM86,                                           
      * SYNC-TSDBR-KEY                                                  
      *   FORTBMO,  FORTBM6,                                            
      * SYNC-TSDBR-999903                                               
      *   FORTCI1,  FORTCI9                                             
      * SYNC-TSDBR-999903                                               
      *   FORTCKC                                                       
      * SYNC-TSDBR-999902                                               
      *   FORTCKF                                                       
      * SYNC-TSDBR-KEY                                                  
      *   FORTCK3                                                       
      * SYNC-TSDBR-999950                                               
      *   FORTCLD,  FORTCL3,  FORTCL4,                                  
      *   FORTCL7,  FORTCL9,                                            
      * "999903"                                                        
      *   FORTFDD                                                       
      * SYNC-TSDBR-999903                                               
      *   FORTFD3,  FORTFD4,                                            
      * SYNC-TSDBR-999950                                               
      *   FORTGA1,  FORTGA2,                                            
      * "999917"                                                        
      *   FORTGD2,  FORTGD5,                                            
      * SYNC-TSDBR-999950                                               
      *   FORTLAI,  FORTLAL,  FORTLAO,  FORTLA0,                        
      *   FORTLA5,  FORTLA8,  FORTLO0,                                  
      *   FORTLO5,  FORTLO8,  FORTLW3,  FORTLW4,                        
      * SYNC-TSDBR-999906                                               
      *   FORTMB3,  FORTMB4,                                            
      * SYNC-TSDBR-999901                                               
      *   FORTPBA,  FORTPBB,  FORTPBC,  FORTPBD,                        
      *   FORTPB1,  FORTPB2,  FORTPB8,                                  
      * SYNC-TSDBR-999964                                               
      *   FORTSA2,  FORTVA3                                             
      * "999801"                                                        
      *   FORTVO1,  FORTVO6                                             
      *3、TSPCB IBTS1.SDTPSS.PRODPGM                                  
      * SYNC-TSDBR-999914                                               
      *   BICB08T,  BIU01,    BIU02,    BIU03,                          
      *   BIU07,    BIU08,    BIU09,    BIU10,                          
      *   BIU11,    BIU52,                                              
      * SYNC-TSDBR-999805                                               
      *   GBU06,                                                        
      * SYNC-TSDBR-999908                                               
      *   GMU01,                                                        
      * SYNC-TSDBR-999808                                               
      *   GMU04,                                                        
      *   GMU17,    GMU18,    GMU21,    GMU271,                         
      * "999806"                                                        
      *   GMU271,   GSU03,    GSU05,    GSU07,                          
      *   GSU16,    GSU17,    GSU18,    GSU19,                          
      *   GSU21,    GSU22,    GSU28,    GSU29,                          
      *   GSU291,   GSU33,    GSU43,    GSU45,                          
      *   GSU47,    GSU48,    GSU49,    GSU50,                          
      *   GSU53,    GSU54,    GSU55,                                    
      *   GSU56,    GSU61,    GSU65,    GSU66,                          
      *   GSU70,                                                        
      * "999914"                                                        
      *   PYU02,                                                        
      *4、TSPCB IBTS1.TCPPGM.PRODPGM                                  
      * "999920"                                                        
      *   FSBMP01                                                       
      *5、TSPCB IBTS1.TPSSPGM.PRODPGM                                 
      * SYNC-TSDBR-999804                                               
      *   AMUA0,                                                        
      * SYNC-TSDBR-999966                                               
      *   AMUA3,                                                        
      * SYNC-TSDBR-999999                                               
      *   AMUA5,                                                        
      * SYNC-TSDBR-999964                                               
      *   AMUZ1,                                                        
      * SYNC-TSDBR-999901                                               
      *   AMUZ2,                                                        
      * SYNC-TSDBR                                                      
      *   AMU03,                                                        
      * SYNC-TSDBR-999999                                               
      *   AMU29,                                                        
      * SYNC-TSDBR-999957                                               
      *   AMU41,    AMU411,   AMU413,                                   
      * SYNC-TSDBR-999909                                               
      *   AMU68,                                                        
      * SYNC-TSDBR-999904                                               
      *   BCU01,                                                        
      * SYNC-TSDBR-999901                                               
      *   BCU03,                                                        
      * SYNC-TSDBR-999905                                               
      *   BCU04,    BCU17,    BCU18,    BCU21,    BCU22,                
      * SYNC-TSDBR-999965                                               
      *   BCU52,                                                        
      * SYNC-TSDBR-999901                                               
      *   BCU53,                                                        
      * SYNC-TSDBR-KEY (999910)                                         
      *   BMU03,    BMU04,    BMU05,    BMU06,                          
      *   BMU54,    BMU61TS,  BMU70,    BMU71,                          
      *   BMU72,    BMU73,    BMU77,    BMU87,                          
      * SYNC-TSDBR-999901                                               
      *   CIS36,    CIS42,    CIUA1,                                    
      *   CIU01,    CIU15,                                              
      * SYNC-TSDBR-999912                                               
      *   CIU16,    CKU62,    CKU65,                                    
      * SYNC-TSDBR-999904                                               
      *   CIUA2,                                                        
      * SYNC-TSDBR-999905                                               
      *   CIU20,    CIU22(?)  CIU27,                                    
      * SYNC-TSDBR-999916                                               
      *   CIU29,    CIU30,    CIU31,                                    
      * SYNC-TSDBR-999902                                               
      *   CKS10,    CKS17,    CKS24,    CKS29,                          
      *   CKS30,    CKS58,    CKU04,    CKU08,                          
      *   CKU10,    CKU12,    CKU19,    CKU22,                          
      *   CKU23,    CKU25,    CKU26,    CKU27,                          
      *   CKU30,    CKU32A,   CKU33,    CKU37,                          
      *   CKU38,    CKU42,    CKU45,    CKU46,                          
      *   CKU47,    CKU48,    CKU49,    CKU50,                          
      *   CKU54,    CKU56,    CKU57,    CKU60,                          
      *   CKU61,    CKU63,    CKU66,    CKU67,                          
      *   CKU70,    CKU73,    CKU75,                                    
      * SYNC-TSDBR-999912                                               
      *   CKU31,                                                        
      * SYNC-TSDBR-999950                                               
      *   CLU01,    CVU01,    CVU04,                                    
      * SYNC-TSDBR-999908                                               
      *   CVU01,    CVU04,                                              
      *   CVU05,    CVU08,                                              
      * SYNC-TSDBR-999904                                               
      *   EAU11,    FDS11,                                              
      * SYNC-TSDBR-999903                                               
      *   FDS19,    FDU01,    FDU02,    FDU09,                          
      * SYNC-TSDBR-999911                                               
      *   FNU01,    FNU02,                                              
      * SYNC-TSDBR-999919                                               
      *   FSU04,                                                        
      * SYNC-TSDBR-999908                                               
      *   FSU07,                                                        
      * SYNC-TSDBR-999901                                               
      *   GDU01,                                                        
      * SYNC-TSDBR-999917                                               
      *   GDU02,                                                        
      * SYNC-TSDBR-999950                                               
      *   HCU05,                                                        
      * SYNC-TSDBR-999988                                               
      *   IBU01,    IBU06,    IBU11,                                    
      *   IBU12,    IBU20,    IBU56,                                    
      * SYNC-TSDBR-KEY                                                  
      *   ISRTDI                                                        
      * SYNC-TSDBR-999955                                               
      *   LAU11,    LAU21,                                              
      * SYNC-TSDBR-999950                                               
      *   LAS09,    LAU02,    LAU10,    LAU16,    LAU18A,               
      *   LAU18A,   LAU19,    LAU25,    LAU30,    LAU34,                
      *   LAU42,    LAU48,    LAU49,    LAU50,    LAU51,                
      *   LAU52,    LAU53,    LAU55,    LAU57,    LAU58,                
      *   LAU59,    LAU62,    LAU67, LAU68,    LAU71,                   
      *   LAU75,    LAU76,    LAU84,    LAU85,                          
      *   LAU85A,   LAU88,                                              
      * SYNC-TSDBR-KEY5                                                 
      *   MBU18                                                         
      * SYNC-TSDBR-999960                                               
      *   PBU41,    PBU44,                                              
      * SYNC-TSDBR-999908                                               
      *   PBU46,   PBU47,                                               
      * SYNC-TSDBR-999961                                               
      *   MBU19,    PBU54,                                              
      * SYNC-TSDBR-999904                                               
      *   MBU01,    MBU04,    MBU05,    MBU06,                          
      *   MBU07,    MBU09,    MBU10,    MBU14,    MBU15,                
      *   MBU20,    MBU25                                               
      * SYNC-TSDBR-999905                                               
      *   PBU02,    PBU03,                                              
      * SYNC-TSDBR-999968                                               
      *   PBU05,    PBU06,    PBU07,                                    
      * SYNC-TSDBR-999901                                               
      *   PBU01,    PBU02,    PBU04,                                    
      *   PBU08(999958, 999903, 999906, 999959, 999960, 999961, 999962) 
      *   PBU08(999963)                                                 
      *   PBU09,    PBU12,    PBU14,    PBU16,                          
      *   PBU25,    PBU26,    PBU27,                                    
      *   PBU28,    PBU29,    PBU31,    PBU32,    PBU33,                
      *   PBU36,    PBU37,    PBU38,    PBU40,                          
      *   PBU44,    PBU49,    PBU50,    PBU52,                          
      *   PBU53,    PBU56,                                              
      * SYNC-TSDBR-999918                                               
      *   PUU01,    PUU02,    PUU32,    PUU48,    PUU49(999908)         
      *   PUU66,    PUU73,    PUU74,    PUU77,    PUU87                 
      * SYNC-TSDBR-999908                                               
      *   PUP120,   PUUTES10, PUU03,                                    
      *   PUU05,    PUU06,    PUU07,                                    
      *   PUU10,    PUU13,    PUU14,    PUU17,    PUU18,    PUU20,      
      *   PUU21,    PUU22,    PUU24,    PUU25,    PUU26,    PUU27,      
      *   PUU28,    PUU30,    PUU31,    PUU32,    PUU33,    PUU34,      
      *   PUU35,    PUU37,    PUU39,    PUU40,    PUU42,    PUU43,      
      *   PUU44,    PUU45,    PUU46,    PUU49,    PUU50,                
      *   PUU51,    PUU52,    PUU53,    PUU58,    PUU60,                
      *   PUU61,    PUU64,                                              
      *   PUU81,    PUU812,   PUU82,    PUU82A,   PUU82B,   PUU83,      
      *   PUU84,                                                        
      * SYNC-TSDBR-999907                                               
      *   RMU10,    RTU01,    RTU05,    RTU12,    RXU01,                
      *   RXU10,    RXU12,                                              
      * SYNC-TSDBR-999804                                               
      *   RTU19,                                                        
      * SYNC-TSDBR-999965                                               
      *   TDU02,                                                        
      * SYNC-TSDBR-999964                                               
      *   VDU01,                                                        
      *6、TSPCB IBTS1.XSTPSS.PRODPGM                                  
      * SYNC-TSDBR-999807                                               
      *   XFUF02,   XFUF03,   XMUI01,   XMUK01,   XMU03,                
      * SYNC-TSDBR-999899                                               
      *   XLU01,                                                        
      * SYNC-TSDBR-999809                                               
      *   XFU01,    XFU02,    XFU03,    XFU04,    XMUK02,   XMU04,      
      *   XFU06,    XFU07,    XFU08,    XMPL02,   XMU01,    XMU02,      
      *   XMU05,    XMU06,    XSUF20,   XSUF20CK, XSUF28,               
      *   XSU35,    XSU39                                               
      * SYNC-TSDBR-999911                                               
      *   XNPH10,   XNPH11,   XNPH12,                                   
      *   XNPH13,   XNU01,                                              
      * SYNC-TSDBR-999807                                               
      *   XSUF01,   XSUF02,   XSUF03,   XSUF32,                         
      * SYNC-TSDBR-999913                                               
      *   XSUF07,   XSUF08,                                             
      *   XSUF33,   XSUF35,                                             
      * SYNC-TSDBR-999807                                               
      *   XSUI01,   XSUK01,   XSUK02,   XSUK03,   XSUK04                
      *   XSUK05,   XSUK06,   XSUM01,   XSUM02,   XSUY01,   XSUY02,     
      * SYNC-TSDBR-000003                                               
      *   BMU03 ,   CIU16 ,                                             
      * SYNC-TSDBR-000004                                               
      *   BMU03 ,   CIU16 ,                                             
      * SYNC-TSDBR-000005                                               
      *   BMU03 ,   CIU16 ,                                             
      * SYNC-TSDBR-000006                                               
      *   BMU03 ,   CIU16 ,                                             
      * SYNC-TSDBR-000007                                               
      *   BMU03 ,   CIU16 ,                                             
      * SYNC-TSDBR-000008                                               
      *   BMU03 ,   CIU16 ,                                             
      * SYNC-TSDBR-000009                                               
      *   BMU03 ,   CIU16 ,                                             
      * SYNC-TSDBR-000010                                               
      *   BMU73 ,         ,                                             
      * SYNC-TSDBR-000011                                               
      *   BMU73 ,         ,                                             
      * SYNC-TSDBR-000012                                               
      *   BMU73 ,         ,                                             
      * SYNC-TSDBR-000046                                               
      *   PBU35 ,   PBU39                                               
      *                                                                 
