      ******************************************************************
       01  DBCODES.                                                     
           02  CK-AGENT-ACCOUNT-CODE.                                   
               03  CK-AGENT-ACCOUNT-NONE       PIC X        VALUE "0".  
               03  CK-AGENT-ACCOUNT            PIC X        VALUE "1".  
           02  FLAG-ON-OFF-CODES.                                       
               03  FLAG-ON                     PIC X        VALUE "1".  
               03  FLAG-OFF                    PIC X        VALUE "0".  
           02  FLAG-YES-NO-CODES.                                       
               03  FLAG-YES                    PIC X        VALUE "Y".  
               03  FLAG-NO                     PIC X        VALUE "N".  
           02  FLAG-NORMAL-ERROR-CODES.                                 
               03  FLAG-NORMAL                 PIC X        VALUE " ".  
               03  FLAG-ERROR                  PIC X        VALUE "E".  
           02  FLAG-PAYMENT-RECEIVE.                                    
               03  FLAG-PAYMENT                PIC X        VALUE "P".  
               03  FLAG-PAYMENT-FISG-REVERSE   PIC X        VALUE "F".  
               03  FLAG-RECEIVE                PIC X        VALUE "R".  
           02  FLAG-ABB.                                                
               03  NOT-ABB                     PIC X        VALUE "0".  
               03  ABB-ACC                     PIC X        VALUE "1".  
           02  FLAG-ATM-ACCOUNT.                                        
               03  PRIMARY-ATM                 PIC X        VALUE "P".  
               03  SECONDARY-ATM               PIC X        VALUE "S".  
           02  HEAD-BR-CODE.                                            
               03  HEAD-BR                     PIC X(4)   VALUE "0010". 
               03  TATUNG-BR                   PIC X(4)   VALUE "0430". 
               03  BUSS-BR                     PIC X(4)   VALUE "0560". 
           02  SETTLEMENT-TYPES.                                        
               03  ST-MIN                      PIC X        VALUE "0".  
               03  ST-MAX                      PIC X        VALUE "6".  
               03  ST-ALL                      PIC X        VALUE "0".  
               03  ST-PAID                     PIC X        VALUE "1".  
               03  ST-ATM                      PIC X        VALUE "2".  
               03  ST-CL                       PIC X        VALUE "3".  
               03  ST-EXCH                     PIC X        VALUE "4".  
               03  ST-WITHDRAW                 PIC X        VALUE "5".  
               03  ST-ATM-YESTERDAY            PIC X        VALUE "6".  
               03  ST-ATM-FISG-RVS             PIC X        VALUE "6".  
           02  INTER-BANK-TYPES.                                        
               03  IB-MIN                      PIC X        VALUE "0".  
               03  IB-MAX                      PIC X        VALUE "4".  
               03  IB-ALL                      PIC X        VALUE "0".  
               03  IB-ABB                      PIC X        VALUE "1".  
               03  IB-ATM                      PIC X        VALUE "2".  
               03  IB-CL                       PIC X        VALUE "3".  
               03  IB-EXCH                     PIC X        VALUE "4".  
           02  CLEAR-DATA-ADJUST-TYPES.                                 
               03  IB-MIN-ADJUST               PIC XX       VALUE "01". 
               03  IB-MAX-ADJUST               PIC XX       VALUE "07". 
               03  IB-FEE-DR                   PIC XX       VALUE "01". 
               03  IB-FEE-CR                   PIC XX       VALUE "02". 
               03  IB-RVS-FEE-DR               PIC XX       VALUE "03". 
               03  IB-RVS-FEE-CR               PIC XX       VALUE "04". 
               03  IB-TO-CENTER-BANK           PIC XX       VALUE "05". 
               03  IB-DIFFERENCE-DR            PIC XX       VALUE "06". 
               03  IB-DIFFERENCE-CR            PIC XX       VALUE "07". 
           02  INTER-BRANCH-REPORT-TYPES.                               
               03  REMITTING-REPORT            PIC X        VALUE "1".  
               03  COLLECTING-REPORT           PIC X        VALUE "2".  
           02  ZIP-CODES.                                               
               03  ZIP-MIN                     PIC XXX      VALUE "100".
               03  ZIP-MAX                     PIC XXX      VALUE "999".
               03  TAIPEI-ZIP                  PIC XXX      VALUE "100".
               03  PAN-CHIAO-ZIP               PIC XXX      VALUE "220".
           02  BANK-CODES.                                              
               03  CBOT-CODE                   PIC XXX      VALUE "006".
           02  UNDUE-CHECK-TYPES-CODES.                                 
               03  BRANCH-TRANSFER             PIC X        VALUE "1".  
               03  LOCAL-BANK                  PIC X        VALUE "2".  
               03  OUTPORT                     PIC X        VALUE "3".  
           02  DUE-CHECK-TYPES-CODES.                                   
               03  PRESENTATION                PIC X        VALUE "5".  
           02  ACCOUNT-STATUS-CODES.                                    
               03  AC-MIN                      PIC X        VALUE "0".  
               03  AC-MAX                      PIC X        VALUE "9".  
               03  AC-NORMAL                   PIC X        VALUE "0".  
               03  AC-STATIC                   PIC X        VALUE "1".  
               03  AC-TRAINNING                PIC X        VALUE "2".  
               03  AC-CLOSED                   PIC X        VALUE "3".  
               03  AC-TRANSFER                 PIC X        VALUE "4".  
               03  AC-DENIED                   PIC X        VALUE "5".  
               03  AC-UNUSE                    PIC X        VALUE "6".  
               03  AC-CHANGE-DEPST-TP          PIC X        VALUE "7".  
               03  AC-RECIVABLE-OVERDUE        PIC X        VALUE "8".  
      * APSHC ADD 84/07/17                                              
               03  AC-DENIED-CLOSED            PIC X        VALUE "9".  
      *APCHIN 89.06.12 W:CK425 BEGIN                                    
            03  AC-PRETENDED                PIC X        VALUE "A".     
            03  AC-PRETENDED-CLOSED         PIC X        VALUE "B".     
      *APCHIN 89.06.12 W:CK425 END                                      
           02  RECORD-COUNTER-CODES.                                    
               03  NO-THIS-RECORD              PIC 999      VALUE 0.    
           02  DEPOSIT-CHARACTERISTIC-CODES.                            
               03  CHARACTER-PB-MIN            PIC XX       VALUE "01". 
               03  CHARACTER-PB-MAX            PIC XX       VALUE "07". 
               03  CHARACTER-CMP-MIN           PIC XX       VALUE "08". 
               03  CHARACTER-CMP-MAX           PIC XX       VALUE "09". 
               03  CHARACTER-CK-MIN            PIC XX       VALUE "11". 
               03  CHARACTER-CK-MAX            PIC XX       VALUE "15". 
               03  CHARACTER-FD-MIN            PIC XX       VALUE "20". 
               03  CHARACTER-FD-MAX            PIC XX       VALUE "24". 
               03  CHARACTER-PB1-MIN           PIC XX       VALUE "51". 
               03  CHARACTER-PB1-MAX           PIC XX       VALUE "52". 
      **** APCWL 92/03/01  MOD  BEGIN (Q:CK387  W:CMD137) ****          
               03  CHARACTER-TR-MIN            PIC XX       VALUE "41". 
               03  CHARACTER-TR-MAX            PIC XX       VALUE "48". 
      **** APCWL 92/03/01  MOD  END   (Q:CK387  W:CMD137) ****          
               03  PB-STAFF-HIGH               PIC XX       VALUE "01". 
               03  PB-STAFF-LOW                PIC XX       VALUE "02". 
               03  PB-STAFF-RETIRED            PIC XX       VALUE "03". 
               03  PB-TEACHER-HIGH             PIC XX       VALUE "04". 
               03  PB-TEACHER-LOW              PIC XX       VALUE "05". 
               03  PB-SAVING-DEPOSIT           PIC XX       VALUE "06". 
               03  PB-CURRENT-ACCOUNT          PIC XX       VALUE "07". 
               03  CMP-SAV-DPS                 PIC XX       VALUE "08". 
               03  CMP-CUR-DPS                 PIC XX       VALUE "09". 
               03  CK-CHECK-DEP                PIC XX       VALUE "11". 
               03  CK-CHECK-LIMIT              PIC XX       VALUE "12". 
               03  CK-CHECK-CASHIER            PIC XX       VALUE "13". 
               03  CK-CHECK-TRASURY            PIC XX       VALUE "14". 
               03  CK-CHECK-BANKS              PIC XX       VALUE "15". 
               03  FD-NORMAL                   PIC XX       VALUE "20". 
               03  FD-STAFF-HIGH               PIC XX       VALUE "21". 
               03  FD-STAFF-LOW                PIC XX       VALUE "22". 
               03  FD-STAFF-RETIRE             PIC XX       VALUE "23". 
               03  FD-PURCHASE                 PIC XX       VALUE "24". 
               03  PB-SPECIAL-HIGH             PIC XX       VALUE "51". 
               03  PB-SPECIAL-LOW              PIC XX       VALUE "52". 
           02  I-PROVINCE-CODE.                                         
               03  PROVINCE-MIN                PIC XX       VALUE "01". 
               03  PROVINCE-MAX                PIC XX       VALUE "99". 
           02  TAX-CODES.                                               
               03  TAX-MIN                     PIC 9        VALUE 0.    
               03  TAX-MAX                     PIC 9        VALUE 4.    
               03  FD-TAX-MIN                  PIC 9        VALUE 1.    
               03  FD-TAX-MAX                  PIC 9        VALUE 4.    
               03  DONOT-COMP-INTRST           PIC 9        VALUE 0.    
               03  NATIVES                     PIC 9        VALUE 1.    
               03  FOREIGNER                   PIC 9        VALUE 2.    
               03  ISOLATED                    PIC 9        VALUE 3.    
               03  DONOT-REDUCE-TAX            PIC 9        VALUE 4.    
               03  DONOT-REPORT-TAX            PIC 9        VALUE 5.    
           02  CREDIT-DEBIT-CODES.                                      
               03  CREDIT                      PIC X        VALUE "C".  
               03  DEBIT                       PIC X        VALUE "D".  
           02  INTRST-PAY-RCV-CODES.                                    
               03  PAY-INTRST                  PIC X        VALUE "0".  
               03  RCV-INTRST                  PIC X        VALUE "1".  
               03  CMP-LOAN-INT                PIC X        VALUE "2".  
           02  CUSTOMER-NATURE-CODES.                                   
               03  CUSTOMER-MIN                PIC X        VALUE "0".  
               03  CUSTOMER-MAX                PIC X        VALUE "3".  
               03  NATURAL                     PIC X        VALUE "0".  
               03  LAWFAL                      PIC X        VALUE "1".  
               03  BUSINESS                    PIC X        VALUE "2".  
               03  NON-BUSINESS                PIC X        VALUE "3".  
           02  EXCEPTION-CODES.                                         
               03  EXCEPTION-MIN               PIC XX       VALUE "00". 
               03  EXCEPTION-MAX               PIC XX       VALUE "16". 
               03  EXCEPTION-MIN-PB            PIC XX       VALUE "00". 
               03  EXCEPTION-MAX-PB            PIC XX       VALUE "05". 
               03  SEAL-LOST                   PIC XX       VALUE "00". 
               03  BOOK-CERTIFICATE-LOST       PIC XX       VALUE "01". 
               03  BOTH-LOST                   PIC XX       VALUE "02". 
               03  CUSTOMER-DEATH              PIC XX       VALUE "03". 
               03  BANKRUPT                    PIC XX       VALUE "04". 
               03  DETAINED                    PIC XX       VALUE "05". 
               03  DENIED                      PIC XX       VALUE "06". 
      *        03  CLOSED                      PIC XX       VALUE "07". 
               03  MORTGAGE-CBOT               PIC XX       VALUE "07". 
               03  MORTGAGE-OTHER              PIC XX       VALUE "08". 
               03  AUTO-INT                    PIC XX       VALUE "09". 
               03  AUTO-PRIM                   PIC XX       VALUE "10". 
               03  AUTO-PRIM-INT               PIC XX       VALUE "11". 
               03  IMMIGRATED                  PIC XX       VALUE "12". 
               03  CHANGE-ACC                  PIC XX       VALUE "13". 
               03  LIMIT-FD                    PIC XX       VALUE "14". 
               03  CBOT-RATE-WEIGHT            PIC XX       VALUE "15". 
               03  CBOT-RATE                   PIC XX       VALUE "16". 
      *APCHIN 89.06.12 W:CK425 BEGIN                                    
               03  PRETENDED                   PIC XX       VALUE "44". 
      *APCHIN 89.06.12 W:CK425 END                                      
      *APCHIN 90.05.24 W:CK456 BEGIN                                    
               03  SIGN-ADDITONAL-CONTRACT     PIC XX       VALUE "45". 
      *APCHIN 90.05.24 W:CK456 END                                      
      ********** ATM USE ONLY    --- APTRS --- 74 6 01                  
      **** 02  ATM-EXCEPTION-CODE.                                      
               03  ATM-USE-CODE-MIN            PIC X(2)  VALUE "21".    
               03  ATM-USE-CODE-MAX            PIC X(2)  VALUE "30".    
               03  ATM-INITIATE-REGIST         PIC X(2)  VALUE "21".    
               03  ATM-LOSS-REGIST             PIC X(2)  VALUE "22".    
               03  ATM-RETAIN-REGIST           PIC X(2)  VALUE "23".    
               03  ATM-STOP-USE-REGIST         PIC X(2)  VALUE "24".    
               03  ATM-ADD-ACCOUNT-REGIST      PIC X(2)  VALUE "25".    
               03  ATM-EXCEPTION-CODE-MIN      PIC X(2)  VALUE "21".    
               03  ATM-EXCEPTION-CODE-MAX      PIC X(2)  VALUE "25".    
           02  ATM-CARD-STATUS-CODE.                                    
               03  ATM-CARD-NORMAL             PIC X(1)  VALUE "0".     
               03  ATM-CARD-NOT-INITIATE       PIC X(1)  VALUE "1".     
               03  ATM-CARD-LOSS               PIC X(1)  VALUE "2".     
               03  ATM-CARD-STOP-USE           PIC X(1)  VALUE "3".     
               03  ATM-CARD-LOSS-AND-STOP      PIC X(1)  VALUE "5".     
      ********** ATM USE ONLY    --- APTRS --- 74 6 01                  
           02  REGISTER-RELEASE-CODES.                                  
               03  REGISTER-CODE               PIC X        VALUE "0".  
               03  RELEASE-CODE                PIC X        VALUE "1".  
           02  TRANSFER-CODES.                                          
               03  TRANSFER-MIN                PIC X        VALUE "1".  
               03  TRANSFER-MAX                PIC X        VALUE "3".  
               03  COLLECTION                  PIC X        VALUE "1".  
               03  REMITTANCE                  PIC X        VALUE "2".  
               03  LOAN                        PIC X        VALUE "3".  
           02  INTRST-RATE-TYPE-CODES.                                  
               03  FIX-RATE                    PIC X        VALUE "0".  
               03  FLOAT-RATE                  PIC X        VALUE "1".  
           02  CONFIRMATION-CODES.                                      
               03  CONFIRM-MIN                 PIC X        VALUE "0".  
01230D*        03  CONFIRM-MAX                 PIC X        VALUE "3".  
01230A         03  CONFIRM-MAX                 PIC X        VALUE "4".  
               03  NO-CONFIRM                  PIC X        VALUE "0".  
               03  DAY-CONFIRM                 PIC X        VALUE "1".  
               03  WEEK-CONFIRM                PIC X        VALUE "2".  
               03  MONTH-CONFIRM               PIC X        VALUE "3".  
           02  PROTEST-CODES.                                           
               03  PROTEST-MIN                 PIC XX       VALUE "00". 
               03  PROTEST-MAX                 PIC XX       VALUE "02". 
               03  INSUFFICIENT-BAL            PIC XX       VALUE "00". 
               03  ERROR-CHOP                  PIC XX       VALUE "01". 
               03  OTHERS                      PIC XX       VALUE "02". 
           02  CI-NATIONALITY-CODES.                                    
               03  CI-NATIONAL-MIN             PIC X        VALUE "0".  
               03  CI-NATIONAL-MAX             PIC X        VALUE "1".  
               03  CI-CHINESE                  PIC X        VALUE "0".  
               03  CI-FOREIGNER                PIC X        VALUE "1".  
           02  CI-SERVICE-TYPE-CODES.                                   
               03  CI-SERVICE-MIN              PIC X        VALUE "0".  
               03  CI-SERVICE-MAX              PIC X        VALUE "7".  
               03  CI-NEXT-DATE-CHK            PIC X        VALUE "0".  
               03  CI-TIME-INTRST-TO-PBCK      PIC X        VALUE "1".  
               03  CI-TIME-CLOSE-TO-PBCK       PIC X        VALUE "2".  
               03  CI-PBCK-TO-TIME             PIC X        VALUE "3".  
               03  CI-PRIMARY-TRANSFER         PIC X        VALUE "4".  
               03  CI-PRIM-OR-INTRST-TRANS     PIC X        VALUE "5".  
               03  CI-UNMATURITY-STOPPAY-CHECK PIC X        VALUE "6".  
               03  CI-TIME-TO-CMP              PIC X        VALUE "7".  
           02  CK-CHECK-ISSUE-CODES.                                    
               03  CK-ISSUE-MIN                PIC X        VALUE " ".  
               03  CK-ISSUE-MAX                PIC X        VALUE "9".  
               03  CK-NOT-ISSUED-CHK           PIC X        VALUE " ".  
               03  CK-BLANK-CHK                PIC X        VALUE "0".  
               03  CK-STOPAY-LOST-CHK          PIC X        VALUE "1".  
               03  CK-STOPAY-BLANK-CHK         PIC X        VALUE "2".  
               03  CK-RELS-CONTRACT            PIC X        VALUE "3".  
               03  CK-PROVIS-DISP-CHK          PIC X        VALUE "4".  
               03  CK-DENACT-PAY               PIC X        VALUE "5".  
               03  CK-VOID-CHK                 PIC X        VALUE "6".  
               03  CK-CERTIF-CHK               PIC X        VALUE "7".  
               03  CK-PAID-CHK                 PIC X        VALUE "X".  
               03  CK-BOUNCE-CHK               PIC X        VALUE "8".  
               03  CK-BOUNCE-PAYMENT-CHK       PIC X        VALUE "9".  
               03  CK-BOUNCE-CANCEL-CHK          PIC X      VALUE "E".  
      *--- 83/09/22 APJFL BEGIN ---*                                    
               03  CK-RELS-CONTR-BEFORE-DEADLINE PIC X      VALUE "A".  
               03  CK-CASHIER-RELS-CONTR-BOUNCE  PIC X      VALUE "B".  
               03  CK-BOUNCE-FOR-CONTRCT-ENDED   PIC X      VALUE "C".  
               03  CK-ISSUE-STOPAY-RELS-BY-COURT PIC X      VALUE "D".  
      *--- 83/09/22 APJFL END   ---*                                    
           02  CK-OVERDRAFT-CODES.                                      
               03  CK-OVERDRAFT-NONE           PIC X        VALUE "0".  
               03  CK-OVERDRAFT-SECURE         PIC X        VALUE "1".  
               03  CK-OVERDRAFT-NONSECURE      PIC X        VALUE "2".  
           02  CK-DISHONOR-CHECK-CODES.                                 
               03  CK-DISHONOR-MIN             PIC XX       VALUE "01". 
               03  CK-DISHONOR-MAX             PIC XX       VALUE "03". 
               03  CK-INSUFFICIENT-FOUND       PIC XX       VALUE "01". 
               03  CK-CHOP-ERROR               PIC XX       VALUE "02". 
               03  CK-OTHER-REASONS            PIC XX       VALUE "03". 
           02  CK-BILL-TYPE-CODE.                                       
               03  CKITP-CHECK                 PIC X        VALUE "0".  
               03  CKITP-PRMSORY-NOTE          PIC X        VALUE "1".  
           02  CK-DEFECT-CODES.                                         
               03  CK-DEFECT-MIN               PIC X        VALUE "1".  
               03  CK-DEFECT-MAX               PIC X        VALUE "7".  
               03  CK-STOPPAY                  PIC X        VALUE "1".  
               03  CK-STOPPAY-BLANK-CHK        PIC X        VALUE "2".  
               03  CK-RELS-CONTRCT-PAY         PIC X        VALUE "3".  
               03  CK-PROVISION-DISP-CHECK     PIC X        VALUE "4".  
               03  CK-BOUNCED                  PIC X        VALUE "5".  
               03  CK-VOID-CHECK               PIC X        VALUE "6".  
               03  CK-BOUNCED-PAYMENT          PIC X        VALUE "7".  
           02  CK-CAL-PRODUCT-CODES.                                    
               03  CALPRODUCT-MIN              PIC X        VALUE "0".  
               03  CALPRODUCT-MAX              PIC X        VALUE "2".  
               03  HIGHEST                     PIC X        VALUE "0".  
               03  LATEST                      PIC X        VALUE "1".  
               03  MIX                         PIC X        VALUE "2".  
           02  CK-DEBIT-TX-CODES.                                       
               03  WITHOUT-DB-TX               PIC X        VALUE "0".  
               03  WITH-DB-TX                  PIC X        VALUE "1".  
           02  CK-CREDIT-CODES.                                         
               03  CK-CREDIT                   PIC X(2)     VALUE "CR". 
           02  CK-UNFILE-CHECK-CODE.                                    
               03  CK-UNFILE-CHECK             PIC X        VALUE "*".  
           02  CK-UNFILE-CHECK-NOTE.                                    
               03  CK-UNFILE-NOTE              PIC X(6) VALUE "UNFILE". 
           02  CK-CASH-TRANS-CODES.                                     
               03  CK-CASH                     PIC X        VALUE "C".  
               03  CK-TRANSFER                 PIC X        VALUE "T".  
           02  CK-TRANS-STATUS-CODES.                                   
               03  CK-NORMAL                   PIC X        VALUE " ".  
               03  CK-PENDING                  PIC X        VALUE "P".  
           02  CK-TRANS-ACCOUNT-CODES.                                  
               03  CK-TRANS-ACT-MIN            PIC X        VALUE "0".  
               03  CK-TRANS-ACT-MAX            PIC X        VALUE "2".  
               03  CK-DEPOSIT                  PIC X        VALUE "0".  
               03  CK-OVERDRAFT                PIC X        VALUE "1".  
               03  CK-DEPT-AND-OVERDT          PIC X        VALUE "2".  
           02  CK-DETAIN-STOPPAY-CODES.                                 
               03  CK-STOPPAY-CODE             PIC X        VALUE "0".  
               03  CK-DETAIN-CODE              PIC X        VALUE "1".  
           02  CK-OVD-IRDB-KEY-CODES.                                   
               03  CK-OVD-SECURE               PIC X(2)     VALUE "07". 
               03  CK-OVD-NONSECURE            PIC X(2)     VALUE "08". 
           02  CK-OVERDRAFT-ACCOUNT.                                    
               03  CK-OVD-NONSECURE-MIN        PIC X(3)     VALUE "401".
               03  CK-OVD-NONSECURE-MAX        PIC X(3)     VALUE "409".
               03  CK-OVD-SECURE-MIN           PIC X(3)     VALUE "419".
               03  CK-OVD-SECURE-MAX           PIC X(3)     VALUE "427".
           02  CK-CHECK-NUMBERS.                                        
               03  CK-CHECK-NUMBERS-25         PIC X(3)     VALUE "025".
               03  CK-CHECK-NUMBERS-50         PIC X(3)     VALUE "050".
               03  CK-CHECK-NUMBERS-100        PIC X(3)     VALUE "100".
           02  CK-GROUP-CODES.                                          
               03  CK-GROUP-NONSPLIT           PIC X        VALUE "0".  
               03  CK-GROUP-SPLIT              PIC X        VALUE "9".  
           02  CN-REMITTANCE-LETTER-CODES.                              
               03  LETTER-DISPATCH             PIC X        VALUE "0".  
               03  LETTER-COLLECTED            PIC X        VALUE "1".  
           02  CN-PB-CK-ACCT-CODES.                                     
               03  CN-NOT-PB-CK                PIC X        VALUE "0".  
               03  CN-PB                       PIC X        VALUE "1".  
               03  CN-CK                       PIC X        VALUE "2".  
           02  CN-TRANSFER-CODES.                                       
               03  CN-MANUAL                   PIC X        VALUE "0".  
               03  CN-AUTO                     PIC X        VALUE "1".  
               03  CN-OUT                      PIC X        VALUE "9".  
           02  CN-STATUS-CODES.                                         
               03  CN-DISPATCH                 PIC X        VALUE "0".  
               03  CN-WITHDRAWAL               PIC X        VALUE "1".  
               03  CN-DISHONOUR                PIC X        VALUE "2".  
               03  CN-AUTO-DEPOSIT             PIC X        VALUE "3".  
               03  CN-MANUAL-DEPOSIT           PIC X        VALUE "4".  
               03  CN-REVERSE                  PIC X        VALUE "5".  
           02  CN-MANUAL-CODES.                                         
               03  CN-NOT-ONLINE-ACC           PIC X        VALUE "0".  
               03  CN-STATIC                   PIC X        VALUE "1".  
               03  CN-TRAINNING                PIC X        VALUE "2".  
               03  CN-CLOSED                   PIC X        VALUE "3".  
               03  CN-TRANSFER                 PIC X        VALUE "4".  
               03  CN-DENIED                   PIC X        VALUE "5".  
               03  CN-UNUSE                    PIC X        VALUE "6".  
               03  CN-INHERIT                  PIC X        VALUE "7".  
               03  CN-ACC-NOT-FOUND            PIC X        VALUE "8".  
               03  CN-OTHER-REASON             PIC X        VALUE "9".  
           02  FD-COMPUTE-INTRST-CODES.                                 
               03  FD-COMPUTE-INTRST-MIN       PIC X        VALUE "0".  
               03  FD-COMPUTE-INTRST-MAX       PIC X        VALUE "4".  
               03  FD-MONTH                    PIC X        VALUE "0".  
               03  FD-MONTH-PAID               PIC X        VALUE "1".  
               03  FD-YEAR-PAID                PIC X        VALUE "2".  
               03  FD-FIX-AMOUNT               PIC X        VALUE "3".  
               03  FD-INSTAL-DPS               PIC X        VALUE "4".  
61003A         03  FD-MATURE-PAY               PIC X        VALUE "5".  
           02  FD-INQ-TOTAL-AMT.                                        
               03  FD-INQ-OPEN-BRH             PIC X        VALUE "2".  
               03  FD-INQ-CBOT-ALL             PIC X        VALUE "3".  
           02  FD-FDREM-CODES.                                          
               03  FD-FDREM-MIN                PIC X        VALUE "0".  
               03  FD-FDREM-MAX                PIC X        VALUE "2".  
               03  FD-FDREM-CBOT               PIC X        VALUE "1".  
               03  FD-FDREM-OTHER              PIC X        VALUE "2".  
           02  FD-AUTO-SUCCESSION-CODES.                                
               03  FD-AUTO-SUCC-MIN            PIC X        VALUE "0".  
               03  FD-AUTO-SUCC-MAX            PIC X        VALUE "2".  
               03  FD-AUTO-TRANS-NO            PIC X        VALUE "0".  
               03  FD-AUTO-PRIM-TRANS          PIC X        VALUE "1".  
               03  FD-AUTO-PRIM-INTRST-TRANS   PIC X        VALUE "2".  
           02  FD-OPEN-TYPE-CODES.                                      
               03  FD-OPEN-MIN                 PIC X        VALUE "0".  
               03  FD-OPEN-MAX                 PIC X        VALUE "2".  
               03  FD-NORMAL-OPEN              PIC X        VALUE "0".  
               03  FD-FROM-SAVING              PIC X        VALUE "1".  
               03  FD-OVERDUE-OTHER-TIME-DEP  PIC X        VALUE "2".   
           02  FD-DEPOSIT-TYPE-CODES.                                   
               03  FD-DEPOSIT-MIN              PIC X        VALUE "0".  
               03  FD-DEPOSIT-MAX              PIC X        VALUE "1".  
               03  FD-FIX-AMT-DEPOST           PIC X        VALUE "0".  
               03  FD-FIX-AMT-WITHDRAW         PIC X        VALUE "1".  
           02  FD-WDRW-INT-CODES.                                       
               03  FD-WDRW-INT-MIN             PIC X        VALUE "0".  
               03  FD-WDRW-INT-MAX             PIC X        VALUE "3".  
               03  FD-WITHDRAW-INT             PIC X        VALUE "0".  
               03  FD-MIDWAY-INT               PIC X        VALUE "1".  
               03  FD-CLOSE-INT                PIC X        VALUE "2".  
               03  FD-ACCRUED-INT              PIC X        VALUE "3".  
           02  FD-WITHDRAW-DEPOSIT-CODES.                               
               03  FD-WITHDRAW                 PIC X        VALUE "D".  
               03  FD-DEPOSIT                  PIC X        VALUE "C".  
           02  FD-CODE-CLOSE-ACC.                                       
               03  FD-CODE-CLOSE-MAX           PIC X        VALUE "1".  
               03  FD-CODE-CLOSE-MIN           PIC X        VALUE "3".  
               03  FD-MIDWAY-CLOSE             PIC X        VALUE "1".  
               03  FD-MATURE-CLOSE             PIC X        VALUE "2".  
               03  FD-SUCC-CLOSE               PIC X        VALUE "3".  
           02  FD-INSTAL-DEPOSIT.                                       
               03  FD-INSTAL-DEPOSIT-MIN       PIC X(3)     VALUE "767".
               03  FD-INSTAL-DEPOSIT-MAX       PIC X(3)     VALUE "778".
           02  HLD-ACCNO                       PIC X(9)  VALUE ALL "0". 
           02  FDLTT-CODES.                                             
               03  FD-TERM-1                   PIC 9        VALUE 1.    
               03  FD-TERM-2                   PIC 9        VALUE 2.    
               03  OPERATION-DAY               PIC X        VALUE "Y".  
               03  NON-OPERATION-DAY           PIC X        VALUE "N".  
           02  FDRXX-CODE.                                              
               03  FD-SUCC-DP-MARK             PIC X        VALUE "1".  
               03  FD-ACCRUED-ITTSEG           PIC X        VALUE "2".  
               03  FD-NEGO-CODE                PIC X        VALUE "3".  
           02  BSGST-CODES.                                             
               03  BS-NOGROUP                  PIC X        VALUE "0".  
               03  BS-GROUP                    PIC X        VALUE "1".  
           02  BRANCH-STC-CODES.                                        
               03  BRANCH-MIN                  PIC X        VALUE "0".  
               03  BRANCH-MAX                  PIC X        VALUE "4".  
               03  BRANCH-SPARE                PIC X        VALUE "0".  
               03  BRANCH-READY                PIC X        VALUE "1".  
               03  BRANCH-SIGN-ON              PIC X        VALUE "2".  
               03  BRANCH-SIGN-OFF             PIC X        VALUE "3".  
               03  BRANCH-FORCE-LOGOFF         PIC X        VALUE "4".  
           02  BATCH-STC-CODES.                                         
               03  BATCH-MIN                   PIC X        VALUE "0".  
               03  BATCH-MAX                   PIC X        VALUE "4".  
               03  BATCH-SPARE                 PIC X        VALUE "0".  
               03  BATCH-READY                 PIC X        VALUE "1".  
               03  BATCH-SIGN-ON               PIC X        VALUE "2".  
               03  BATCH-SIGN-OFF              PIC X        VALUE "3".  
               03  BATCH-FORCE-LOGOFF          PIC X        VALUE "4".  
           02  BSSPR-CODES.                                             
               03  BS-EXCEP-TRANS-LIMIT        PIC X        VALUE "X".  
               03  BS-EXCEP-TRANS-NO-LIMIT     PIC X        VALUE "N".  
           02  BSVIP-CODES.                                             
               03  BS-VIP-YES                  PIC X        VALUE "Y".  
               03  BS-VIP-NO                   PIC X        VALUE "N".  
           02  LINE-NUMBER-CODES.                                       
               03  LINENO-MAX                  PIC 99       VALUE 24.   
           02  ONLINE-COORDINATOR              PIC XX       VALUE "99". 
           02  PB-PRODUCT-RETURN-CODE.                                  
               03  MINUS-DAYCOUNT              PIC X(2)     VALUE "SS". 
           02  TD-STATUS-CODES.                                         
               03  TD-READY-FOR-OPR            PIC X        VALUE "1".  
               03  TD-OUT-OF-SERVICE           PIC X        VALUE "4".  
           02  BCTC-MESSAGE-CODES.                                      
               03  MSG-ABB                     PIC X        VALUE "1".  
               03  MSG-VIP                     PIC X        VALUE "2".  
               03  MSG-FTB                     PIC X        VALUE "3".  
               03  MSG-IBB                     PIC X        VALUE "4".  
               03  MSG-ACCNO-CHECK             PIC X        VALUE "5".  
           02  POST-BOOK-MARK                  PIC X        VALUE "*".  
           02  FD-LARGE-AMOUNT                 PIC S9(11)V99  COMP-3    
                                               VALUE +1000000.          
           02  LIMIT-ABB-WITHDRAW              PIC S9(11)V99  COMP-3    
                                               VALUE +200000.           
           02  LIMIT-STAFF-TIME                PIC S9(11)V99  COMP-3    
                                               VALUE +480000.           
           02  LIMIT-STAFF-TIME-LOW            PIC S9(11)V99  COMP-3    
                                               VALUE +280000.           
           02  LIMIT-CASH-WITHDRAW             PIC S9(11)V99  COMP-3    
                                               VALUE +200000.           
           02  LIMIT-CASH-DEPOSIT              PIC S9(11)V99  COMP-3    
                                               VALUE +1000000.          
           02  CK-LIMIT-CHECK-AMT              PIC S9(11)V99  COMP-3    
                                               VALUE +5000.             
           02  CK-DISHONOR-PENALTY             PIC S9(11)V99  COMP-3    
                                               VALUE +20.               
           02  CK-LIMIT-CHECK-AMT              PIC S9(11)V99  COMP-3    
                                               VALUE +5000.             
           02  CK-DISHONOR-PENALTY             PIC S9(11)V99  COMP-3    
                                               VALUE +20.               
      ***** 75-07-09 ADD.                                               
           02  LA-LARCH.                                                
               03  ADD-CODE                    PIC X        VALUE "A".  
               03  EXCEPTION-CODE              PIC X        VALUE "B".  
               03  CLOSE-CODE                  PIC X        VALUE "C".  
               03  NEW-INSERT                  PIC X        VALUE "N".  
               03  TRANSFER-TO-OVE             PIC X        VALUE "T".  
               03  MOR-CODE                    PIC X        VALUE "M".  
               03  INSERT-CODE                 PIC X        VALUE "I".  
               03  EXTENT-LOAN                 PIC X        VALUE "D".  
               03  PAID-BY-GUARANTEE           PIC X        VALUE "4".  
               03  REC-BY-FORCE                PIC X        VALUE "5".  
               03  TRANSFER-TO-BAD             PIC X        VALUE "6".  
           02  LA-GUARANTOR.                                            
               03  PAID-GUARANTEE-MIN          PIC X        VALUE "1".  
               03  PAID-GUARANTEE-MAX          PIC X        VALUE "3".  
               03  PAID-BY-GUARANTEE-1         PIC X        VALUE "1".  
               03  REC-BY-FORCE-1              PIC X        VALUE "2".  
               03  TRANSFER-TO-BAD-1           PIC X        VALUE "3".  
      ***** 75-07-09 ADD.                                               
           02  LA-BANKING-SAVING-CODES.                                 
               03  BAN-SAV-MIN                 PIC X        VALUE "1".  
               03  BAN-SAV-MAX                 PIC X        VALUE "2".  
               03  BANKING                     PIC X        VALUE "1".  
               03  SAVING                      PIC X        VALUE "2".  
           02  LA-AUTHOR-CODES.                                         
               03  AUTHOR-MIN                  PIC X        VALUE "0".  
               03  AUTHOR-MAX                  PIC X        VALUE "8".  
               03  TRUSTEE                     PIC X        VALUE "0".  
               03  GENERNAL-MANAGER            PIC X        VALUE "1".  
               03  VICE-GENERNAL-MANAGER       PIC X        VALUE "2".  
               03  AUDIT-MANAGER               PIC X        VALUE "3".  
               03  OPERATING-MANAGER           PIC X        VALUE "4".  
               03  SUB-OPERATING-MANAGER       PIC X        VALUE "5".  
               03  ASSISTANT-MANAGER           PIC X        VALUE "6".  
               03  ACCOUNTANT                  PIC X        VALUE "7".  
               03  AUDIT-VICE-MANAGER          PIC X        VALUE "8".  
           02  LA-USE-CODES.                                            
               03  USE-MIN                     PIC X        VALUE "0".  
               03  USE-MAX                     PIC X        VALUE "1".  
               03  EQUIPMENT                   PIC X        VALUE "0".  
               03  REVOLVING-FUND              PIC X        VALUE "1".  
           02  LA-INT-WEIGHT-CODES.                                     
               03  INC-DEC-MIN                 PIC X        VALUE "0".  
               03  INC-DEC-MAX                 PIC X        VALUE "1".  
               03  INCREASE                    PIC X        VALUE "0".  
               03  DECREASE                    PIC X        VALUE "1".  
           02  LA-COMPUTE-INT-PRIN-CODES.                               
               03  COMPUTE-MIN                 PIC X        VALUE "0".  
               03  COMPUTE-MAX                 PIC X        VALUE "9".  
               03  MON-PAID-INT-MAT-PRIN       PIC X        VALUE "0".  
               03  MAT-PAID-INT-PRIN           PIC X        VALUE "1".  
               03  MON-INT-TRAN-TO-PRIN        PIC X        VALUE "2".  
               03  MON-PAID-AVG-INT-PRIN       PIC X        VALUE "3".  
               03  MON-PAID-INT-AVG-PRIN       PIC X        VALUE "4".  
               03  MON-INT-AFTER-MON-INT-PRIN  PIC X        VALUE "5".  
               03  NON-MON-INT-AFTER-MON-PRIN  PIC X        VALUE "6".  
               03  MONTH-INT-AFTER-AVG-PRIN    PIC X        VALUE "7".  
               03  NON-MON-AVG-INT-PRIN        PIC X        VALUE "8".  
               03  MON-INT-AFTER-MON-PRIN      PIC X        VALUE "9".  
      ***SHU75/12/12***                                                 
               03  AGRICULTURE-METHOD          PIC X        VALUE "A".  
      ***SHU75/12/12***                                                 
           02  LA-OLD-NEW-COMPUT-CODES.                                 
               03  OLD-NEW-MIN                 PIC X        VALUE "0".  
               03  OLD-NEW-MAX                 PIC X        VALUE "3".  
               03  OLD                         PIC X        VALUE "0".  
               03  NEW                         PIC X        VALUE "1".  
               03  OLD-NO-LIMIT                PIC X        VALUE "2".  
               03  NEW-NO-LIMIT                PIC X        VALUE "3".  
           02  LA-SECURE-CODE.                                          
               03  MIN-SECURE                  PIC X        VALUE "0".  
               03  MAX-SECURE                  PIC X        VALUE "9".  
               03  REAL-ESTATE-SECURE          PIC X        VALUE "0".  
               03  REAL-ESTATE-SUB-SECURE      PIC X        VALUE "1".  
               03  PERSON-ESTATE-SECURE        PIC X        VALUE "2".  
               03  PERSON-ESTATE-SUB-SECURE    PIC X        VALUE "3".  
               03  SECURE-OF-CHECK             PIC X        VALUE "4".  
               03  FUND-OF-GUARANTEE           PIC X        VALUE "5".  
               03  GUARANTEE-AGRICARTURE       PIC X        VALUE "6".  
               03  SECURE-BY-CERTIFICATE       PIC X        VALUE "7".  
               03  LOAN-BY-TOGETHER            PIC X        VALUE "8".  
               03  PAID-BY-WELFARE-COMMITTEE   PIC X        VALUE "9".  
           02  LA-TYPE-OF-LOAN.                                         
               03  LA-INITIAL-MIN              PIC X        VALUE "0".  
               03  LA-INITIAL-MAX              PIC X        VALUE "4".  
               03  LA-INITIAL                  PIC X        VALUE "0".  
               03  LA-AFTER-INITIAL            PIC X        VALUE "1".  
               03  LA-MORATORIUM               PIC X        VALUE "2".  
               03  LA-EXTEND-LOAN              PIC X        VALUE "3".  
               03  LA-OFF-LINE-MOVE-IN         PIC X        VALUE "4".  
               03  LA-LOAN-TYPE-5              PIC X        VALUE "5".  
               03  LA-LOAN-TYPE-6              PIC X        VALUE "6".  
               03  LA-LOAN-TYPE-7              PIC X        VALUE "7".  
               03  LA-LOAN-TYPE-8              PIC X        VALUE "8".  
               03  LA-LOAN-TYPE-9              PIC X        VALUE "9".  
               03  LA-LOAN-TYPE-A              PIC X        VALUE "A".  
               03  LA-LOAN-TYPE-B              PIC X        VALUE "B".  
           02  LA-IRDB-KEY-CODES.                                       
               03  IR-DISCOUNT                 PIC XX       VALUE "21". 
               03  IR-SHORT-TERM               PIC XX       VALUE "22". 
               03  IR-MEDIUM-LONG-TERM         PIC XX       VALUE "23". 
               03  IR-HOUSE-CODE               PIC XX       VALUE "24". 
      ***SHU75/12/12***                                                 
               03  IR-AGRICULTURE-A            PIC XX       VALUE "25". 
               03  IR-AGRICULTURE-B            PIC XX       VALUE "26". 
      ***SHU75/12/12***                                                 
           02  LA-PERIOD-LOAN-CODE.                                     
               03  PERIOD-LOAN-MONTH           PIC X        VALUE "M".  
               03  PERIOD-LOAN-DAY             PIC X        VALUE "D".  
               03  PERIOD-LOAN-ALL             PIC X        VALUE "A".  
           02  LA-COMPUTE-CODE.                                         
               03  COMPUTE-INTRST              PIC X        VALUE "I".  
               03  COMPUTE-PERIOD              PIC X        VALUE "P".  
      *** NEW ADD OF RT-CODE SACCY (75/07/15)                           
           02  RT-EXCP-CODE.                                            
               03  RT-EXCP-MAX                 PIC XX       VALUE "05". 
               03  RT-EXCP-MIN                 PIC XX       VALUE "01". 
               03  RT-CHECK-LOST-DELIV         PIC XX       VALUE "01". 
               03  RT-RECPT-LOST-DELIV         PIC XX       VALUE "02". 
               03  RT-RECPT-LOST-ISSUE         PIC XX       VALUE "03". 
               03  RT-FREEZE-LOST-DELIV        PIC XX       VALUE "04". 
               03  RT-FREEZE-LOST-ISSUE        PIC XX       VALUE "05". 
           02  RT-STATUS.                                               
               03  RT-STA-MAX                  PIC X        VALUE "6".  
               03  RT-STA-MIN                  PIC X        VALUE "1".  
               03  RT-ISSUED                   PIC X        VALUE "1".  
               03  RT-OFF-LINE-RT-ISSUE        PIC X        VALUE "2".  
               03  RT-DELIVD                   PIC X        VALUE "3".  
               03  RT-RTN-OUTSTAND             PIC X        VALUE "4".  
               03  RT-RTN                      PIC X        VALUE "5".  
               03  RT-REVERSE                  PIC X        VALUE "6".  
           02  RT-EXCP-MARK.                                            
               03  RT-NON-EXCP                 PIC X        VALUE "0".  
               03  RT-EXCP                     PIC X        VALUE "1".  
           02  RT-ACNT-IN-MARK.                                         
               03  RT-ACNT-MAX                 PIC X        VALUE "2".  
               03  RT-ACNT-MIN                 PIC X        VALUE "0".  
               03  RT-AUTO-IN                  PIC X        VALUE "0".  
               03  RT-NON-AUTO-IN              PIC X        VALUE "1".  
               03  RT-MANUAL-IN                PIC X        VALUE "2".  
           02  RT-TYPE.                                                 
               03  RT-TYPE-ACNT-MAX            PIC XX       VALUE "05". 
               03  RT-TYPE-ACNT-MIN            PIC XX       VALUE "01". 
               03  RT-CHECK                    PIC XX       VALUE "01". 
               03  RT-MAIL                     PIC XX       VALUE "02". 
               03  RT-ACNT-IN-MAIL             PIC XX       VALUE "03". 
               03  RT-PHONE                    PIC XX       VALUE "04". 
               03  RT-ACNT-IN-PHONE            PIC XX       VALUE "05". 
               03  RT-TYPE-BANK-MAX            PIC XX       VALUE "17". 
               03  RT-TYPE-BANK-MIN            PIC XX       VALUE "11". 
               03  RT-BK-IN-PHONE              PIC XX       VALUE "11". 
               03  RT-GT-TREASURE              PIC XX       VALUE "12". 
               03  RT-BANK                     PIC XX       VALUE "13". 
               03  RT-COLLECT-INFORM           PIC XX       VALUE "14". 
               03  RT-PREPAID                  PIC XX       VALUE "15". 
               03  RT-PREDELIV                 PIC XX       VALUE "16". 
               03  RT-RETURN                   PIC XX       VALUE "17". 
           02  RT-CHG-CODE.                                             
               03  RT-CHG-MAX                  PIC X        VALUE "4".  
               03  RT-CHG-MIN                  PIC X        VALUE "1".  
               03  RT-ACNT-NO                  PIC X        VALUE "1".  
               03  RT-REMITTEE                 PIC X        VALUE "2".  
               03  RT-CHECK-NO                 PIC X        VALUE "3".  
               03  RT-REMITTER                 PIC X        VALUE "4".  
           02  RT-MSG-TYPE.                                             
               03  RT-MSG-MAX                  PIC X        VALUE "3".  
               03  RT-MSG-MIN                  PIC X        VALUE "1".  
               03  RT-RTN-APPLIC               PIC X        VALUE "1".  
               03  RT-RTN-INFORM               PIC X        VALUE "2".  
               03  RT-GEN-MSG                  PIC X        VALUE "3".  
           02  RT-RTN-REASON.                                           
               03  RT-RTN-MAX                  PIC X        VALUE "4".  
               03  RT-RTN-MIN                  PIC X        VALUE "1".  
               03  RT-RTN-ISSUED               PIC X        VALUE "1".  
               03  RT-RTN-DELIVD               PIC X        VALUE "2".  
               03  RT-EXCP-REGIST              PIC X        VALUE "3".  
               03  RT-OUTSTAND                 PIC X        VALUE "4".  
           02  RT-FORM-TYPE.                                            
               03  RT-FORM-MAX                 PIC X        VALUE "5".  
               03  RT-FORM-MIN                 PIC X        VALUE "1".  
               03  RT-DELIVD-FM                PIC X        VALUE "1".  
               03  RT-ISSUED-FM                PIC X        VALUE "2".  
               03  RT-DELIV-FM                 PIC X        VALUE "3".  
               03  RT-RECEIVED-FM              PIC X        VALUE "4".  
               03  RT-GENERAL-FM               PIC X        VALUE "5".  
           02  RT-BRH-MARK.                                             
               03  RT-ISSUED-BRH               PIC X        VALUE "1".  
               03  RT-DELIV-BRH                PIC X        VALUE "2".  
           02  RT-TRANSACTION-CODES.                                    
               03  RT-CASH-CODE                PIC X(4)    VALUE "A001".
               03  RT-TRANSFER-CODE            PIC X(4)    VALUE "A002".
      *** NEW ADD OF RT-CODE SACCY (75/07/15)                           
       01  LA-CHAR-INQUIRY-CODE.                                        
           02  CHAR-INQUIRY-MIN                PIC X        VALUE "0".  
           02  CHAR-INQUIRY-MAX                PIC X        VALUE "5".  
           02  PERIOD-INT-PAID                 PIC X        VALUE "0".  
           02  NON-PERIOD-INT-PAID             PIC X        VALUE "1".  
           02  OVERDUE-INT                     PIC X        VALUE "2".  
           02  CHAR-PRINCIPAL                  PIC X        VALUE "3".  
           02  CHAR-TEL-PB-NO                  PIC X        VALUE "4".  
           02  CHAR-TYPE-5                     PIC X        VALUE "5".  
       01  LA-INT-TYPE.                                                 
           02  LA-INT-MIN                      PIC X        VALUE "0".  
      ***SHU75/12/12***                                                 
      *    02  LA-INT-MAX                      PIC X        VALUE "3".  
           02  LA-INT-MAX                      PIC X        VALUE "5".  
      ***SHU75/12/12***                                                 
           02  LA-INT-DISCOUNT                 PIC X        VALUE "0".  
           02  LA-INT-SHORT-TERM               PIC X        VALUE "1".  
           02  LA-INT-MEDIUM-LONG-TERM         PIC X        VALUE "2".  
           02  LA-INT-HOUSE-CODE               PIC X        VALUE "3".  
      ***SHU75/12/12***                                                 
           02  LA-AGRICULTURE-A                PIC X        VALUE "4".  
           02  LA-AGRICULTURE-B                PIC X        VALUE "5".  
      ***SHU75/12/12***                                                 
       01  LA-CHAR-CODE.                                                
           02  LA-CHAR-MIN                     PIC X        VALUE "0".  
           02  LA-CHAR-MAX                     PIC X        VALUE "1".  
           02  NON-MID-MIN-LOAN                PIC X        VALUE "0".  
           02  MID-MIN-LOAN                    PIC X        VALUE "1".  
       01  LA-ADVANCE-CODE.                                             
           02  ADVANCE-IN                      PIC X        VALUE "1".  
           02  ADVANCE-OUT                     PIC X        VALUE "0".  
       01  I-CODE-TRANS.                                                
           02  TR-ACCOUNT                      PIC XXX.                 
           02  TR-FUNCTION                     PIC XX.                  
           02  TR-ATTRIBUTE-A                  PIC XX.                  
           02  TR-ATTRIBUTE-B                  PIC X.                   
       01  PBFSC-CODE.                                                  
           02  CMP-NORMAL                      PIC X        VALUE "0".  
           02  CMP-CLOSED                      PIC X        VALUE "1".  
           02  CMP-MID-CLOSED                  PIC X        VALUE "2".  
           02  CMP-AUTO-DPS-STOP               PIC X        VALUE "3".  
       01  CMP-LOAN-RATE-CODE.                                          
           02  LOAN-RATE-INDEX                 PIC 99 VALUE 61.         
           02  HIGH-LIMIT                      PIC 99 VALUE 62.         
           02  LOW-LIMIT                       PIC 99 VALUE 63.         
      *** NEW ADD OF CMP APYYH (72/12/28)                               
       01  I-OCCUP-TRADE-TAB.                                           
           02  FILLER-1                        PIC X(88)    VALUE       
           "110012001311131213131314131513161320133013401351135213531354
      -    "1355135613571361136213631370".                              
           02  FILLER-2                        PIC X(120)   VALUE       
           "138113821383138413851386139014001500161016201700181018202312
      -    "232023402350235423702381238323902400250026002700280031003200
      -    "".                                                          
           02  FILLER-3                        PIC X(72)    VALUE       
           "400050006100620063007100720073007400750076007700781080009000
      -    "A000B010B020".                                              
       01  I-OCCUP-TRADE-SET REDEFINES I-OCCUP-TRADE-TAB.               
           02  OCCUP-TRADE-SET                 PIC X(4)     OCCURS 70   
                                               INDEXED BY IND1.         
      *** NEW ADD OF PB  APYYH (72/12/31)                               
       01  I-POSTING-CODE-TAB.                                          
           02  FILLER                          PIC X(120)   VALUE       
           "NSDPNHDPCSDPCHDPCKDPXKDPCSDNCHDNCKDNXKDNCSWPCHWPCSWNCHWNFH  
      -    "UKWPUKWNPKWPPKWNTB  PBRSBHDNKHDNTIMEINT PDC CLDNMSDNMTDNKLDN
      -    "".                                                          
       01  I-POSTING-CODE-SET REDEFINES I-POSTING-CODE-TAB.             
           02  POSTING-CODE-SET                PIC X(4)     OCCURS 30   
                                               INDEXED BY IND2.         
      *** NEW ADD OF MICR APYYH (73/12/29)                              
       01  MICR-TAIPEI-BRANCH.                                          
           02  BRANCH-ID                       PIC 9(4).                
           88  TAIPEI-AREA                     VALUE                    
               0020, 0030, 0040, 0050, 0060, 0070, 0080, 0081           
             , 0090, 0100, 0110, 0410, 0411, 0430, 0450, 0460           
             , 0470, 0480, 0490, 0540, 0560, 0561, 0600, 0620           
             , 0670, 0720, 0760, 0770, 0796, 0800, 0811, 0822           
             , 0833, 0844, 0855, 0866, 0877, 0888, 0899, 0903           
             , 0914, 0925, 0936, 0947, 0958, 0969, 1405, 1416           
      *** NEW ADD OF CBOT BRANCH   (77/07/28)                           
             , 0970, 0981, 0992, 1449, 1450, 1586, 1597.                
      *** 90/08/01 ADD 1586 1597                                        
      *** NEW ADD OF IB FLAG SATYH (74/03/27)                           
      *** NEW ADD OF IB FLAG SAMYHU(76/08/04)                           
       01  FLAG-STOP                            PIC X(4) VALUE "STOP".  
      *** NEW ADD FOR ZOUN-CHOUN HOSPITAL (74/03/28)                    
       01  FLAG-GROUP.                                                  
           02  SPECIAL-GROUP                    PIC X    VALUE "9".     
      *** NEW ADD FOR BRANCH OFF-LINE     (74/05/31)                    
       01  FLAG-OFF-LINE.                                               
           02  OFF-LINE                         PIC X    VALUE "9".     
      *** NEW ADD FOR HERD INQUIRY        (75/12/20)                    
       01  FLAG-HEAD-INQUIRY.                                           
           02  HEAD-INQUIRY                     PIC X    VALUE "8".     
      *                                                                 
      *** NEW ADD FOR INTERBANK-CODE. CCY (75/12/15)                    
       01  INTERBANK-CODE-TAB.                                          
           02  FILLER                          PIC X(42)    VALUE       
           "002003004005007008009010011012013017050051".                
       01  INTERBANK-CODE-SET REDEFINES INTERBANK-CODE-TAB.             
           02  INTERBANK-CODE                  PIC X(3)     OCCURS 14   
                                               INDEXED BY IND-B.        
       01  INTERBANK-NUM                       PIC 999 VALUE 14.        
      *** NEW ADD FOR INTERBANK-CODE. CCY (75/12/15)                    
      *_____________________ DBCODES END _____________________________* 
      *                                                                 
       01  TPSS-RETURN-CODES.                                           
           02  JOB-INITIAL                     PIC X(3)     VALUE "   ".
           02  END-OF-JOB                      PIC X(3)     VALUE "EOJ".
           02  JOB-ABEND                       PIC X(3)     VALUE "FAL".
           02  JOB-ERROR                       PIC X(3)     VALUE "ERR".
      *01  BCTC-ACCOUNT-TAB.                                            
      *    02  FILLER-1                        PIC X(120)    VALUE      
      *    "081CN212CN215CN227CY717CY718CN719CN720CN765CY766CN705CY706CY
      *    "707CY708CY401DN402DN403DN404DN405DN406DN407DN408DN409DN419DN
      *    "".                                                          
      *    02  FILLER-2                        PIC X(120)  VALUE        
      *    "420DN421DN422DN423DN424DN425DN426DN427DN701CY702CY205CN845CN
      *    "224CY225CY228CY229CY230CY231CY721CN722CN723CN724CN725CN726CN
      *    "".                                                          
      *    02  FILLER-3                        PIC X(120)  VALUE        
      *    "727CN728CN729CN730CN731CN732CN733CN734CN735CN736CN737CN738CN
      *    "739CN740CN741CN742CN743CN744CN745CN746CN747CN748CN749CN750CN
      *    "".                                                          
      *    02  FILLER-4                        PIC X(120)  VALUE        
      *    "751CN752CN753CN754CN755CN756CN757CN758CN759CN760CN761CN762CN
      *    "763CN764CN767CN768CN769CN770CN771CN772CN773CN774CN775CN776CN
      *    "".                                                          
      *    02  FILLER-5                        PIC X(120)  VALUE        
      *    "777CN778CN779CN780CN781CN782CN783CN784CN785CN786CN787CN788CN
      *    "789CN790CN791CN792CN793CN794CN795CN796CN797CN798CN799CN800CN
      *    "".                                                          
      *    02  FILLER-6                        PIC X(120)   VALUE       
      *    "801CN802CN803CN804CN805CN806CN807CN808CN809CN810CN811CN812CN
      *    "813CN814CN841CN842CN843CN844CN218CN023CN713CY714CY715CY716CY
      *    "".                                                          
      *    02  FILLER-7                        PIC X(120)   VALUE       
      *    "063DY064DY240CY241CY351CN204CN700CN703CN704CN867CN869CN871CN
      *    "872CN873CY499DN410DN411DN412DN413DN414DN415DN416DN417DN418DN
      *    "".                                                          
      *    02  FILLER-8                        PIC X(120)   VALUE       
      *    "428DN429DN430DN431DN432DN433DN434DN435DN436DN437DN438DN439DN
      *    "440DN441DN442DN443DN444DN445DN446DN447DN448DN449DN450DN451DN
      *    "".                                                          
      *    02  FILLER-9                        PIC X(120)   VALUE       
      *    "452DN453DN454DN455DN456DN457DN458DN459DN460DN461DN462DN463DN
      *    "464DN465DN466DN467DN468DN469DN470DN471DN472DN074DN911CN912CN
      *    "".                                                          
      *    02  FILLER-10                       PIC X(120)   VALUE       
      *    "915CN916CN917CN918CN919CN920CN921CN922CN923CN924CN925CN846CN
      *    "847CN848CN849CN850CN851CN852CN853CN854CN855CN856CN857CN858CN
      *    "".                                                          
      *    02  FILLER-11                       PIC X(120)   VALUE       
      *    "859CN860CN861CN862CN863CN864CN865CN866CN232CN352CN203CY005DY
      *    "083CY888DN065DN298CN299CN213CN875DN876DN256CN257CN258CN259CN
      *    "".                                                          
      *****  ADDED BY APLSF 82/05/18 "220CN" START                      
      *    02  FILLER-12                       PIC X(45)    VALUE       
      *    "260CN366DN367DN368DN369DN370DN371DN024DN220CN709CN".        
      *01  BCTC-ACCOUNT-SET REDEFINES BCTC-ACCOUNT-TAB.                 
      *    02  ACCOUNT-SET                            OCCURS 278        
      *                                               INDEXED BY INDJ.  
      *****  ADDED BY APLSF 82/05/28 "220CN"  END                       
      *        03 BCTC-ACCT                    PIC XXX.                 
      *        03 DB-CR                        PIC X.                   
      *        03 MSDB-IND                     PIC X.                   
       01  TPSS-COVER-CODE.                                             
           02  BRANCH-SUPER-CODES.                                      
               03  EXCEP-NO-LIMIT              PIC X        VALUE "X".  
               03  EXCEP-LIMIT-WITH-LVL        PIC X        VALUE "N".  
           02  BRANCH-VIP-CODES.                                        
               03  BRANCH-VIP-YES              PIC X        VALUE "Y".  
               03  BRANCH-NO-VIP               PIC X        VALUE "N".  
           02  BRANCH-MACHINE-CODES.                                    
               03  PLAN-TO-INSTALL             PIC X        VALUE "0".  
               03  ALREADY-INSTALL             PIC X        VALUE "1".  
           02  BSSPR-CODES.                                             
               03  BS-EXCEP-TRANS-LIMIT        PIC X        VALUE "X".  
               03  BS-EXCEP-TRANS-NO-LIMIT     PIC X        VALUE "N".  
           02  BSVIP-CODES.                                             
               03  BS-VIP-YES                  PIC X        VALUE "Y".  
               03  BS-VIP-NO                   PIC X        VALUE "N".  
           02  TELLER-STC-CODES.                                        
               03  TELLER-STC-MIN              PIC X        VALUE "0".  
               03  TELLER-STC-MAX              PIC X        VALUE "4".  
               03  TELLER-UNUSED               PIC X        VALUE "0".  
               03  TELLER-READY                PIC X        VALUE "1".  
               03  TELLER-SIGN-ON              PIC X        VALUE "2".  
               03  TELLER-SIGN-OFF             PIC X        VALUE "3".  
               03  TELLER-FORCE-LOGOFF         PIC X        VALUE "4".  
           02  SUPER-LEVEL-CODES.                                       
               03  TCAZL-MIN                   PIC X        VALUE "0".  
               03  TCAZL-MAX                   PIC X        VALUE "4".  
           02  BRANCH-GROUP-STC-CODES.                                  
               03  BRANCH-NOGROUP              PIC X        VALUE "N".  
               03  BRANCH-GROUP                PIC X        VALUE "Y".  
