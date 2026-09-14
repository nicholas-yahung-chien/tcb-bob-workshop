      ***************************************************************   
       01  CIRSEG.                                                      
      *    02  LL                      PIC 999         COMP VALUE 185.  
80411D*    02  LL                      PIC 999         COMP VALUE 200.  
51218D*    02  LL                      PIC 999         COMP VALUE 220.  
51218A     02  LL                      PIC 999         COMP VALUE 300.  
           02  CIRID                   PIC X(10)       VALUE SPACE.     
           02  CIRER                   PIC X(1)        VALUE "0".       
           02  CIRBD                   PIC X(10)       VALUE SPACE.     
           02  CIREE                   PIC X(1)        VALUE "0".       
81008C     02  CIRCD7                  PIC X(7)  JUST RIGHT VALUE SPACE.
           02  CIRNO                   PIC X(10)       VALUE SPACE.     
           02  CIRTE3   REDEFINES  CIRNO                                
                                       PIC X(10).                       
           02  CIRNA                   PIC X(1)        VALUE "0".       
           02  CIRPO                   PIC X(2)        VALUE "00".      
81008C     02  CIRBT7                  PIC X(7)  JUST RIGHT VALUE SPACE.
           02  CIRTE                   PIC X(10)       VALUE SPACE.     
           02  CIRCU                   PIC X(1)        VALUE "0".       
           02  CIRUD                   PIC X(12)       VALUE SPACE.     
           02  CIRNN                   PIC X(20)       VALUE SPACE.     
           02  CIRNN-R-ATM REDEFINES CIRNN.                             
      *****  APCWL 92/09/01  START       *****                          
70520C         03  CIRMK               PIC X(01).                       
               03  CIRAG               PIC X(01).                       
               03  CIRTE2              PIC X(10).                       
               03  CIRPC               PIC X(06).                       
               03  CIRAO               PIC X(01).                       
               03  CIRAP               PIC X(01).                       
      *****  APCWL 92/09/01  END         *****                          
           02  CIRCB                   PIC X(4)        VALUE SPACE.     
           02  CIRNM                   PIC X(60)       VALUE SPACE.     
           02  CIROV                   PIC X(01)       VALUE SPACE.     
      *****  APCWL 90/07/04  START       *****                          
      *    02  CIRPC                   PIC X(04)       VALUE SPACE.     
70714C     02  CIRFA                   PIC X(01)       VALUE SPACE.     
70714C     02  CIRCA                   PIC X(01)       VALUE SPACE.     
70714C     02  CIRPCO                  PIC X(02)       VALUE SPACE.     
      *****  APCWL 90/07/04  END         *****                          
           02  CIRPP                   PIC X(1)        VALUE SPACE.     
           02  CIRAM                   PIC X(01)       VALUE SPACE.     
           02  CIRIB                   PIC X(04)       VALUE SPACE.     
           02  CIRLM                 PIC 9(07)  COMP-3   VALUE ZEROS.   
           02  CIROB                   PIC X(04)       VALUE SPACE.     
           02  CIROM                 PIC 9(07)  COMP-3   VALUE ZEROS.   
           02  CIRPM                   PIC X(01)       VALUE SPACE.     
           02  CIRKP                   PIC X(01)       VALUE SPACE.     
80923C     02  CIRST                   PIC X(01)       VALUE "0".       
50509C     02  CIRWK                   PIC X(03)       VALUE SPACE.     
  "  A     02  KYC-DATA    REDEFINES CIRWK.                             
  "  A*KYC評估項目1                                                   
  "  A         03  CIRKYC1             PIC X(1).                        
  "  A*KYC評估項目2                                                   
  "  A         03  CIRKYC2             PIC X(1).                        
  "  A*KYC評估項目3                                                   
50509A         03  CIRKYC3             PIC X(1).                        
      *** APJAN ADD 帳號戶名註記 CIRAF 94.08.01 CMDQ050 CMDW195       
      *** APJAN ADD 警示戶註記   CIRFD 94.08.11 CMDQ050 CMDW195       
           02  CIRAF                   PIC X(01)       VALUE SPACE.     
           02  CIRFD                   PIC X(01)       VALUE SPACE.     
80923A     02  CIRXM                   PIC X(01)       VALUE SPACE.     
91025C*    02  FILLER                  PIC X(30)       VALUE SPACE.     
91025C     02  CIRNT                   PIC 9(03)       COMP-3 VALUE 0.  
91025C*    02  FILLER                  PIC X(28)       VALUE SPACES.    
00602A     02  CIRFN                   PIC X(01)       VALUE SPACES.    
11213C*    02  FILLER                  PIC X(27)       VALUE SPACES.    
      *二代健保註記(Y/N)                                              
11213A     02  CIRHI                   PIC X(01)       VALUE SPACES.    
      *拒絕開戶註記' '未設定 'R'拒絕開戶                          
11213A     02  CIRRO                   PIC X(01)       VALUE SPACES.    
      * PEP註記: 'P' 高知名度政治人物, ' '未設定, 'N' 廢除      
11213A*    02  CIRPEP                  PIC X(01)       VALUE SPACES.    
      * PEP註記分行                                                   
11213A*    02  CIRPEBH                 PIC X(04)       VALUE SPACES.    
30430C*    02  FILLER                  PIC X(05)       VALUE SPACES.    
30904A*對帳單寄發註記                                                 
30904A     02  CIRCS                   PIC X(01)       VALUE SPACES.    
31212A*員工註記                                                       
31212A     02  CIREMP                  PIC X(01)       VALUE SPACES.    
40519A*新版綜合對帳單寄發註記                                         
40519A     02  CIRNCS                  PIC X(01)       VALUE SPACES.    
40519C*    02  FILLER                  PIC X(02)       VALUE SPACES.    
40519A*法金身份股權狀況                                               
40716C     02  CIRHO                   PIC X(02)       VALUE SPACES.    
      *拒絕行銷                                                       
11213A     02  CIRDS                   PIC X(01)       VALUE SPACES.    
      * 101/10月前開戶,101/10月後未開戶之客戶註記'Y'                
      *個資告知101/10月前視為已告知                                 
11213A     02  CIROA                   PIC X(01)       VALUE SPACES.    
11213C*    02  FILLER                  PIC X(18)       VALUE SPACES.    
      *美國公民註記'A'  -->  FATCA狀態                              
20201A*    02  CIRUS                   PIC X(01)       VALUE SPACES.    
30623C     02  CIRUS                   PIC X(02)       VALUE SPACES.    
      * FATCA狀態實質審查單位                                         
30623A     02  CIRUSBH                 PIC X(04)       VALUE SPACES.    
20201C*    02  FILLER                  PIC X(17)       VALUE SPACES.    
      *KYC客戶風險屬性                                                
50324A     02  CIRKYC                  PIC X(01)       VALUE SPACES.    
50509A*KYC評估日期                                                    
  "  A     02  CIRKDAT                 PIC X(7)        VALUE SPACES.    
  "  A*KYC業務來源1: 存款  2:授信  3:信託4: 信用卡 5:其他   
  "  A     02  CIRBUSI                 PIC X(1)        VALUE SPACES.    
  "  A*KYC評估項目4                                                   
  "  A     02  CIRKYC4                 PIC X(1)        VALUE SPACES.    
  "  A*KYC評估項目5                                                   
  "  A     02  CIRKYC5                 PIC X(1)        VALUE SPACES.    
  "  A*KYC評估項目6                                                   
50509A     02  CIRKYC6                 PIC X(1)        VALUE SPACES.    
60906A     02  CIRFVF                  PIC X(1)        VALUE SPACES.    
70720A     02  CIRRES                  PIC X(2)        VALUE SPACES.    
70810A     02  CIRMAS                  PIC X(1)        VALUE SPACES.    
70927A*拒絕交易註記                                                   
70927A     02  CIRRT                   PIC X(1)        VALUE SPACES.    
71025A*客戶無法聯繫                                                   
71025A     02  CIRNCO                  PIC X(1)        VALUE SPACES.    
71025A*身分審查資料拒絕提供                                           
71025A     02  CIRRJP                  PIC X(1)        VALUE SPACES.    
71222A*ＣＲＳ狀態註記                                                 
71222A     02  CIRCRS                  PIC X(2)        VALUE SPACES.    
80326A*ＡＭＬ職業別代碼                                               
80326A     02  CIRPRO                  PIC X(6)        VALUE SPACES.    
80522A*客戶風險評級建檔分行                                           
80522A     02  CIRKBRH                 PIC X(4)        VALUE SPACES.    
80827A*信用卡客戶註記                                               
     A     02  CIRCRRM                 PIC X(1)        VALUE SPACES.    
     A*客戶姓名長戶名註記                                             
     A     02  CIRLNMR                 PIC X(1)        VALUE SPACES.    
     A*負責人姓名長戶名註記                                           
     A     02  CIRLAMR                 PIC X(1)        VALUE SPACES.    
     A*帳號戶名長戶名註記                                             
80827A     02  CIRLCMR                 PIC X(1)        VALUE SPACES.    
80927A*無卡提款註記(0:正常 2:已取消帳號綁定空白:未申請)       
80927A     02  CIRNWDF                 PIC X(1)        VALUE SPACES.    
90131A*基本資料不齊全交易往來註記                                     
  "  A     02  CIRNYRF                 PIC X(1)        VALUE SPACES.    
00305A*新增人頭戶註記(身份證遺失與偽冒開戶) (使用@註記)         
  "  A     02  CIRLOST                 PIC X(01)       VALUE SPACE.     
00527A*新增ＣＲＳ審查單位                                             
00527A     02  CIRCRSBH                PIC X(04)       VALUE SPACE.     
10602A*新增警示戶註記解除                                             
10602A     02  CIRPMRS                 PIC X(01)       VALUE SPACE.     
10922A*新增新版電子綜合對帳註記                                       
10922A     02  CIRECS                  PIC X(01)       VALUE SPACE.     
11123A*新增自然人提領簡訊通知註記                                     
11123A     02  CIRSMS                  PIC X(01)       VALUE SPACE.     
20317A*新增久未往來註記                                               
  "  A     02  CIRLTP                  PIC X(01)       VALUE SPACE.     
20628A*疑似異常帳戶客戶註記                                           
20628A     02  CIRAAC                  PIC X(01)       VALUE SPACE.     
21222A*告誡註記                                                       
21222A     02  CIRWARN                 PIC X(01)       VALUE SPACE.     
30503A*虛擬帳號筆數                                                   
30503A     02  CIRSAC                  PIC 9(02)       VALUE ZEROS.     
30724A*鷹眼註記                                                       
30724A     02  CIRHE                   PIC X(01)       VALUE SPACE.     
31122A*警示戶負責人註記                                               
31122A     02  CIRPME                  PIC X(01)       VALUE SPACE.     
50122A*限制查詢註記                                                 
50122A     02  CIRLQF                  PIC X(01)       VALUE SPACE.     
50122C     02  FILLER                  PIC X(39)       VALUE SPACES.    
