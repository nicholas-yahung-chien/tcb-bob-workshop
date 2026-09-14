      *                                                                 
       ID DIVISION.                                                     
      *                                                                 
       PROGRAM-ID.       CIS14.                                         
      *AUTHOR.           APLAI.                                         
      ******************************************************************
      ******************************************************************
      *                                                                 
       ENVIRONMENT DIVISION.                                            
      *                                                                 
       CONFIGURATION SECTION.                                           
       SOURCE-COMPUTER.  IBM-370 WITH DEBUGGING MODE.                   
      *                                                                 
       INPUT-OUTPUT SECTION.                                            
      *                                                                 
       FILE-CONTROL.                                                    
           SELECT  IN-FILE      ASSIGN  TO  UT-S-CIS14I1.               
           SELECT  BK-FILE      ASSIGN  TO  UT-S-CIS14I2.               
           SELECT  OUT-FILE     ASSIGN  TO  UT-S-CIS14O1.               
90823A     SELECT  OUT2-FILE    ASSIGN  TO  UT-S-CIS14O2.               
      *                                                                 
       DATA DIVISION.                                                   
      *                                                                 
       FILE SECTION.                                                    
      *                                                                 
       FD  IN-FILE                                                      
           LABEL  RECORD    ARE STANDARD                                
           BLOCK  CONTAINS    0 CHARACTERS                              
           RECORD CONTAINS  300 CHARACTERS.                             
       01  IN-REC               PIC  X(300).                            
      *                                                                 
       FD  BK-FILE                                                      
           LABEL  RECORD    ARE STANDARD                                
           BLOCK  CONTAINS    0 CHARACTERS                              
           RECORD CONTAINS   80 CHARACTERS.                             
       01  BK-REC               PIC  X(80).                             
      *                                                                 
       FD  OUT-FILE                                                     
           LABEL  RECORD    ARE STANDARD                                
           BLOCK  CONTAINS    0 CHARACTERS                              
90930C     RECORD CONTAINS  917 CHARACTERS.                             
  "  C 01  OUT-REC              PIC  X(917).                            
      *                                                                 
90823A FD  OUT2-FILE                                                    
  "  A     LABEL  RECORD    ARE STANDARD                                
  "  A     BLOCK  CONTAINS    0 CHARACTERS                              
90930C     RECORD CONTAINS 1109 CHARACTERS.                             
  "  C 01  OUT2-REC             PIC  X(1109).                           
      *                                                                 
       WORKING-STORAGE SECTION.                                         
      *                                                                 
90224C COPY  DLIFUNCT.                                                  
  "  C COPY  SSACIDB.                                                   
  "  C COPY  IMSDBCOD.                                                  
  "  C COPY  SUBCODES.                                                  
  "  C COPY  TSYNCTSR.                                                  
  "  C COPY  CICIRSEG.                                                  
  "  C COPY  CICIASEG.                                                  
90702A COPY  CICIXSEG.                                                  
  "  C COPY  VAVADSEG.                                                  
30331A COPY  TAXCOMB.                                                   
      *                                                                 
       01  BK-DATA.                                                     
           03  BK-NO                      PIC X(03)  VALUE SPACE.       
           03  BK-BHI                     PIC X(04)  VALUE SPACE.       
           03  FILLER                     PIC X(73)  VALUE SPACE.       
      *                                                                 
       01  OUT-DETAIL.                                                  
           03  CI-DATA.                                                 
1              05  CI-ACN-ALL.                                          
                   07  CI-BANK            PIC X(03)  VALUE SPACE.       
                   07  CI-BHI             PIC X(04)  VALUE SPACE.       
                   07  CI-ACN             PIC X(16)  VALUE SPACE.       
24             05  FILLER                 PIC X(01)  VALUE "|".         
25             05  CI-NAME                PIC X(202) VALUE SPACE.       
90930C         05  CI-NAME-R        REDEFINES        CI-NAME.           
                   10  CI-NAME-R-CC       PIC X(40).                    
                   10  CI-NAME-R-0E       PIC X(01).                    
                   10  CI-NAME-R-0F       PIC X(01).                    
90930A             10  FILLER             PIC X(160).                   
227            05  FILLER                 PIC X(01)  VALUE "|".         
228            05  CI-OPENDAY             PIC X(08)  VALUE SPACE.       
236            05  FILLER                 PIC X(01)  VALUE "|".         
237            05  CI-CIKEY               PIC X(11)  VALUE SPACE.       
248            05  FILLER                 PIC X(01)  VALUE "|".         
249            05  CI-BIRTHDAY            PIC X(08)  VALUE SPACE.       
257            05  FILLER                 PIC X(01)  VALUE "|".         
258            05  CI-TEL                 PIC X(20)  VALUE SPACE.       
278            05  FILLER                 PIC X(01)  VALUE "|".         
279            05  CI-NATION              PIC X(22)  VALUE SPACE.       
301            05  FILLER                 PIC X(01)  VALUE "|".         
302            05  CI-ADDR                PIC X(82)  VALUE SPACE.       
30331A         05  CI-ADDR-R        REDEFINES        CI-ADDR.           
                   10  CI-ADDR-R-CC       PIC X(80).                    
                   10  CI-ADDR-R-0E       PIC X(01).                    
                   10  CI-ADDR-R-0F       PIC X(01).                    
384            05  FILLER                 PIC X(01)  VALUE "|".         
           03  TRAN-DATA.                                               
385            05  TR-NAME                PIC X(202) VALUE SPACE.       
90930C         05  TR-NAME-R        REDEFINES        TR-NAME.           
                   10  TR-NAME-R-CC       PIC X(40).                    
                   10  TR-NAME-R-0E       PIC X(01).                    
                   10  TR-NAME-R-0F       PIC X(01).                    
90930A             10  FILLER             PIC X(160).                   
587            05  FILLER                 PIC X(01)  VALUE "|".         
588            05  TR-CIKEY               PIC X(11)  VALUE SPACE.       
599            05  FILLER                 PIC X(01)  VALUE "|".         
600            05  TR-BIRTHDAY            PIC X(08)  VALUE SPACE.       
608            05  FILLER                 PIC X(01)  VALUE "|".         
609            05  TR-TEL                 PIC X(20)  VALUE SPACE.       
629            05  FILLER                 PIC X(01)  VALUE "|".         
           03  TRAN-DETAIL.                                             
630            05  TRD-DATE               PIC X(08)  VALUE SPACE.       
638            05  TRD-TIME               PIC X(04)  VALUE SPACE.       
642            05  FILLER                 PIC X(01)  VALUE "|".         
643            05  TRD-AMT                PIC X(12)  VALUE SPACE.       
655            05  FILLER                 PIC X(01)  VALUE "|".         
656            05  TRD-UNIT.                                            
                   07  TRD-BANK           PIC X(03)  VALUE SPACE.       
                   07  TRD-BHI            PIC X(04)  VALUE SPACE.       
663            05  FILLER                 PIC X(01)  VALUE "|".         
664            05  TRD-TYPE               PIC X(02)  VALUE SPACE.       
666            05  FILLER                 PIC X(01)  VALUE "|".         
667            05  TRD-ACCU-AMT           PIC X(12)  VALUE SPACE.       
679            05  FILLER                 PIC X(01)  VALUE "|".         
680            05  TRD-NAME               PIC X(202) VALUE SPACE.       
90930C         05  TRD-NAME-R        REDEFINES       TRD-NAME.          
                   10  TRD-NAME-R-CC      PIC X(40).                    
                   10  TRD-NAME-R-0E      PIC X(01).                    
                   10  TRD-NAME-R-0F      PIC X(01).                    
90930A             10  FILLER             PIC X(160).                   
882            05  FILLER                 PIC X(01)  VALUE "|".         
883            05  TRD-ACN-ALL.                                         
                   07  TRD-ACN-BK         PIC X(03)  VALUE SPACE.       
                   07  TRD-ACN-BHI        PIC X(04)  VALUE SPACE.       
                   07  TRD-ACN            PIC X(16)  VALUE SPACE.       
906            05  FILLER                 PIC X(01)  VALUE "|".         
907            05  TRD-NOTE               PIC X(10)  VALUE SPACE.       
917            05  FILLER                 PIC X(01)  VALUE "|".         
      *                                                                 
90823A 01  OUT2-DETAIL.                                                 
916  A     03  OUT2-OUT-DETAIL            PIC X(916) VALUE SPACE.       
917  A     03  OUT2-OUT-NOTE.                                           
     A         05  OUT2-OUT-NOTE-1        PIC X(190) VALUE SPACE.       
     A         05  OUT2-OUT-NOTE-0E       PIC X(01)  VALUE SPACE.       
     A         05  OUT2-OUT-NOTE-0F       PIC X(01)  VALUE SPACE.       
1109 A     03  FILLER                     PIC X(01)  VALUE "|".         
      *                                                                 
       01  SWITCH-AREA.                                                 
           03  PGM-STATUS                 PIC X(03)  VALUE SPACE.       
               88  PGM-FAIL                          VALUE "FAL".       
               88  PGM-END                           VALUE "END".       
               88  PGM-OK                            VALUE SPACE.       
           03  PROCESS-STATUS             PIC X(03)  VALUE SPACE.       
               88  PROCESS-FAIL                      VALUE "FAL".       
               88  PROCESS-END                       VALUE "END".       
               88  PROCESS-OK                        VALUE SPACE.       
           03  BK-SW                      PIC X(01)  VALUE SPACE.       
      *                                                                 
       01  WORK-AREA.                                                   
           03  ACN-ZEROS                  PIC X(23)  VALUE ALL "0".     
           03  BANK-TAB                   OCCURS 5000.                  
               05  BANK-NO                PIC X(03).                    
               05  BANK-BHI               PIC X(04).                    
           03  WS-BANK-BHI                PIC X(04)  VALUE SPACE.       
           03  CBOT-BHI                   PIC X(04)  VALUE SPACE.       
           03  FISC-BHI                   PIC X(04)  VALUE SPACE.       
           03  WS-AMT                     PIC 9(12)  VALUE ZEROS.       
81008C     03  ROC-DAY                    PIC 9(07)  VALUE ZEROS.       
           03  AD-DAY                     PIC 9(08)  VALUE ZEROS.       
           03  WS-AD.                                                   
               05  WS-AD-YY               PIC X(04)  VALUE SPACE.       
               05  WS-AD-MM               PIC X(02)  VALUE SPACE.       
               05  WS-AD-DD               PIC X(02)  VALUE SPACE.       
           03  SIGN-0E                    PIC X(01)  VALUE X"0E".       
           03  SIGN-0F                    PIC X(01)  VALUE X"0F".       
           03  SIGN-QQ                    PIC X(02)  VALUE SPACE.       
               88  SIGN-ERR                          VALUE              
                   X"E2A1" X"E2A3" X"E2A8" X"E2AA" X"E2B3" X"E2B5"      
                   X"E2B6" X"405A" X"445A" X"E2B3" X"E2A3" X"E2B2"      
90224C             X"E2B7" X"E2AC" X"E2AB" X"E165" X"E2AD" X"E159"      
  "  A             X"E150" X"46E5"                                      
  "  A             X"D6FA" X"E282" X"E2C0" X"4949" X"E15D" X"E162".     
           03  WS-NOTE                    PIC X(03)  VALUE SPACE.       
           03  X-I                        PIC 9(04)  VALUE ZEROS.       
           03  I                          PIC 9(04)  VALUE ZEROS.       
           03  WS-NAME.                                                 
               05  WS-NAME-0E             PIC X(01)  VALUE SPACE.       
               05  WS-NAME-CC             PIC X(40)  VALUE SPACE.       
               05  WS-NAME-0F             PIC X(01)  VALUE SPACE.       
           03  WS-ADDR.                                                 
               05  WS-ADDR-0E             PIC X(01)  VALUE SPACE.       
               05  WS-ADDR-CC             PIC X(70)  VALUE SPACE.       
               05  WS-ADDR-0F             PIC X(01)  VALUE SPACE.       
30331A     03  I2                         PIC 9(06)  VALUE ZEROS.       
     A     03  WS-DATA-LEN                PIC 9(05)  VALUE ZEROS.       
     A     03  WS-0E-CNT                  PIC 9(05)  VALUE ZEROS.       
     A     03  WS-0F-CNT                  PIC 9(05)  VALUE ZEROS.       
     A     03  WS-HA-CNT                  PIC 9(05)  VALUE ZEROS.       
     A     03  WS-CHK-CNT                 PIC S9(05) VALUE ZEROS.       
     A     03  WS-ADDR-O                  PIC X(72)  VALUE SPACES.      
     A     03  WS-ALL1                    PIC 9(07)  VALUE 0.           
     A     03  WS-ALL2                    PIC 9(07)  VALUE 0.           
     A     03  WS-WRT1                    PIC 9(07)  VALUE 0.           
     A     03  WS-WRT2                    PIC 9(07)  VALUE 0.           
     A     03  WS-CNT-CIXNM               PIC 9(07)  VALUE 0.           
     A     03  WS-CNT-GE                  PIC 9(07)  VALUE 0.           
     A     03  WS-ENG-CINAME              PIC 9(07)  VALUE 0.           
     A     03  WS-ENG-TRNAME              PIC 9(07)  VALUE 0.           
     A     03  WS-ENG-TRDNAME             PIC 9(07)  VALUE 0.           
     A     03  WS-ENG-ADDR                PIC 9(07)  VALUE 0.           
     A     03  WS-HALF-CNT                PIC 9(07)  VALUE ZEROS.       
     A     03  WS-MK-TRAN                 PIC X(01)  VALUE SPACES.      
     A     03  WS-MK-HALF1                PIC X(01)  VALUE SPACES.      
     A     03  WS-MK-HALF2                PIC X(01)  VALUE SPACES.      
     A     03  WS-MK-NM                   PIC X(01)  VALUE SPACES.      
     A     03  WS-MK-ADR                  PIC X(01)  VALUE SPACES.      
     A     03  WS-NAME-O                  PIC X(42)  VALUE SPACES.      
     A     03  SIGN-STAR                  PIC X(02)  VALUE X"46B8".     
     A     03  SIGN-42                    PIC X(01)  VALUE X"42".       
     A     03  SIGN-00                    PIC X(01)  VALUE X"00".       
     A     03  SIGN-40                    PIC X(01)  VALUE X"40".       
     A     03  SIGN-40-2                  PIC X(02)  VALUE X"4040".     
     A     03  K                          PIC 9(05)  VALUE ZEROS.       
     A     03  L                          PIC 9(05)  VALUE ZEROS.       
     A     03  I3                         PIC 9(05)  VALUE ZEROS.       
     A     03  J                          PIC 9(05)  VALUE ZEROS.       
     A     03  M                          PIC 9(05)  VALUE ZEROS.       
     A     03  WS-INSTR                   PIC X(80)  VALUE SPACE.       
     A     03  WS-OUTSTR                  PIC X(80)  VALUE SPACE.       
     A     03  BYTE1-CHECK-O              PIC X(01)  VALUE SPACES.      
     A         88  BYTE1-VALID-O1                    VALUE "0" THRU "9" 
     A                                                     "a" THRU "z".
     A         88  BYTE1-VALID-O2                    VALUE "0" THRU "9" 
     A                                                     "A" THRU "Z".
     A     03  BYTE1-CHECK                PIC X(01)  VALUE SPACES.      
     A         88  BYTE1-VALID1                      VALUE "0" THRU "9" 
     A                                                     "a" THRU "z".
     A         88  BYTE1-VALID2                      VALUE "0" THRU "9" 
     A                                                     "A" THRU "Z".
31212A 77  P                           PIC 9(2).                        
  "    77  Q                           PIC 9(2).                        
  "    01  ACCEPT-DATA                 PIC X(20).                       
  "    01  ACCEPT-TEL-NUMBER.                                           
  "      05  TEL-NUM  OCCURS 11 TIMES  PIC X(20).                       
  "    01  A1                          PIC 9(02) VALUE ZEROS.           
31212A 01  A2                          PIC 9(02) VALUE ZEROS.           
      *                                                                 
      *                                                                 
       01  LINKBRH.                                                     
           03  IOSYS                      PIC X      VALUE SPACE.       
           03  LOCBRH                     PIC X(4)   VALUE SPACE.       
           03  IBBRH                      PIC X(4)   VALUE SPACE.       
           03  RTCODE                     PIC X(4)   VALUE SPACE.       
      *                                                                 
       02  LINKXID.                                                     
           03  XID-RETCODE                PIC X(01)  VALUE SPACE.       
           03  XID-CIKEY                  PIC X(10)  VALUE SPACE.       
      *                                                                 
       01  TEMP-AREA.                                                   
           03  WS-CIRTE                   PIC X(10)  VALUE SPACE.       
81008C     03  WS-CIRBT                   PIC X(07)  VALUE SPACE.       
           03  WS-CIRNA                   PIC X(01)  VALUE SPACE.       
           03  WS-CIRPO                   PIC X(02)  VALUE SPACE.       
           03  WS-CIRNM                   PIC X(60)  VALUE SPACE.       
           03  WS-CIAAD2                  PIC X(105) VALUE SPACE.       
           03  WS-CIACD2                  PIC X(105) VALUE SPACE.       
90224D*    03  WS-VADOOD                  PIC X(07)  VALUE SPACE.       
  "  D*    03  WS-VADBT                   PIC X(07)  VALUE SPACE.       
  "  D*    03  WS-VADOXD                  PIC X(07)  VALUE SPACE.       
      *                                                                 
01210A 01  WS-CIKEY-FOREIGN.                                            
  "  A     05  CIF1                  PIC X(01).                         
  "  A         88  CIF1-VALID        VALUE "A" THRU "Z".                
  "  A     05  CIF2                  PIC X(01).                         
  "  A         88  CIF2-VALID        VALUE "A" THRU "D" "8" "9".        
  "  A     05  CIF3                  PIC X(08).                         
      *                                                                 
       LINKAGE SECTION.                                                 
      *                                                                 
90224D*COPY  PCBTPDB    SUPPRESS.                                       
  "  D*COPY  PCBTSDB    SUPPRESS.                                       
  "  D*COPY  PCBCIDB    SUPPRESS.                                       
  "  D*COPY  PCBPBDB    SUPPRESS.                                       
  "  D*COPY  PCBVADB    SUPPRESS.                                       
90224C COPY  PCBTPDB.                                                   
  "  C COPY  PCBBCDB.                                                   
  "  C COPY  PCBTCDB.                                                   
  "  C COPY  PCBBSDB.                                                   
  "  C COPY  PCBTSDB.                                                   
  "  C COPY  PCBTDDB.                                                   
  "  C COPY  PCBMSDB.                                                   
  "  C COPY  PCBIRDB.                                                   
  "  C COPY  PCBCIDB.                                                   
  "  C COPY  PCBABDB.                                                   
  "  C COPY  PCBPBDB.                                                   
  "  C COPY  PCBFDDB.                                                   
  "  C COPY  PCBCKDB.                                                   
  "  C COPY  PCBCNDB.                                                   
  "  C COPY  PCBBMDB.                                                   
  "  C COPY  PCBLADB.                                                   
  "  C COPY  PCBIBDB.                                                   
90702D*COPY  PCBACDB.                                                   
  "  C COPY  PCBCHDB.                                                   
  "  C COPY  PCBLCDB.                                                   
  "  C COPY  PCBATDB.                                                   
  "  C COPY  PCBBTDB.                                                   
  "  C COPY  PCBRTDB.                                                   
  "  C COPY  PCBFTDB.                                                   
  "  C COPY  PCBMBDB.                                                   
  "  C COPY  PCBFRDB.                                                   
  "  C COPY  PCBVDDB.                                                   
  "  C COPY  PCBTRDB.                                                   
  "  C COPY  PCBCLDB.                                                   
  "  C COPY  PCBGADB.                                                   
  "  C COPY  PCBIPDB.                                                   
  "  C COPY  PCBVADB.                                                   
       01    DMY        PIC X(64).                                      
      *---*                                                             
       PROCEDURE DIVISION.                                              
       DECLARATIVES.                                                    
       COBOL-II-DEBUG SECTION.                                          
           USE FOR DEBUGGING ON ALL PROCEDURES.                         
       COBOL-II-DEBUG-PARA.                                             
TEST  *    DISPLAY DEBUG-NAME.                                          
       END DECLARATIVES.                                                
90224D*---*PSB=TPSS009                                                  
  "  D*    ENTRY "DLITCBL" USING  TPPCB  TSPCB  CIPCB  PBPCB  VAPCB.    
90224C*---*PSB=TPSS024 OR TPSS074                                       
  "  C     ENTRY "DLITCBL" USING  TPPCB  BCPCB  TCPCB  BSPCB  TSPCB     
  "  C                            TDPCB  MSPCB  IRPCB  CIPCB  ABPCB     
  "  C                            PBPCB  FDPCB  CKPCB  CNPCB  BMPCB     
90702C                            LAPCB  IBPCB  DMY    CHPCB  LCPCB     
  "  C                            ATPCB  BTPCB  RTPCB  FTPCB  DMY       
  "  C                            DMY    DMY    DMY    MBPCB  FRPCB     
  "  C                            VDPCB  TRPCB  CLPCB  GAPCB  IPPCB     
  "  C                            VAPCB.                                
      *---*                                                             
       0000-CIS14-CONTROL-RTN.                                          
      *---*                                                             
           DISPLAY " CIS14 C/L DATE = " FUNCTION WHEN-COMPILED.         
      *                                                                 
           PERFORM  1000-INITIAL-RTN.                                   
                                                                        
           PERFORM  3000-PROCESS-RTN                                    
             UNTIL  PGM-END OR PGM-FAIL.                                
                                                                        
           PERFORM  5000-FINISH-RTN.                                    
                                                                        
           STOP RUN.                                                    
                                                                        
      *---*                                                             
       1000-INITIAL-RTN.                                                
      *---*                                                             
           PERFORM  1100-OPEN-FILES.                                    
                                                                        
           PERFORM  1200-READ-INPUT-FILE.                               
           IF  PGM-END                                                  
               DISPLAY  "####### CIS14 #######"                         
               DISPLAY  " INPUT FILE EMPTY !!"                          
               DISPLAY  "#####################".                        
                                                                        
           IF  PGM-OK                                                   
               PERFORM  1300-BUILD-BANK-TABLE.                          
      *                                                                 
       1100-OPEN-FILES.                                                 
      *                                                                 
           OPEN  INPUT   IN-FILE                                        
90823C           OUTPUT  OUT-FILE  OUT2-FILE.                           
      *                                                                 
       1200-READ-INPUT-FILE.                                            
      *                                                                 
           READ  IN-FILE    INTO  VADSEG                                
                 AT  END                                                
                 MOVE  "END"  TO  PGM-STATUS.                           
      *                                                                 
30331A     IF    NOT      PGM-END                                       
                 ADD      1                   TO        WS-ALL1         
           END-IF.                                                      
      *                                                                 
       1300-BUILD-BANK-TABLE.                                           
      *                                                                 
           OPEN  INPUT  BK-FILE.                                        
           MOVE  SPACE  TO  BK-SW.                                      
                                                                        
           PERFORM   1310-BUILD-BANK-TABLE-DETAIL                       
             VARYING I FROM 1 BY 1                                      
               UNTIL I > 5000.                                          
                                                                        
           CLOSE BK-FILE.                                               
      *                                                                 
       1310-BUILD-BANK-TABLE-DETAIL.                                    
      *                                                                 
           IF  BK-SW = SPACE                                            
               PERFORM  1320-READ-BK-FILE.                              
                                                                        
           IF  BK-SW = SPACE                                            
               MOVE  BK-NO  TO  BANK-NO(I)                              
               MOVE  BK-BHI TO  BANK-BHI(I)                             
           ELSE                                                         
               MOVE  SPACE  TO  BANK-NO(I)                              
               MOVE  SPACE  TO  BANK-BHI(I).                            
      *                                                                 
       1320-READ-BK-FILE.                                               
      *                                                                 
           READ  BK-FILE    INTO  BK-DATA                               
                 AT  END                                                
                 MOVE  "Y"    TO  BK-SW.                                
      *                                                                 
30331A     IF    BK-SW    NOT   =  "Y"                                  
                 ADD      1                   TO        WS-ALL2         
           END-IF.                                                      
      *---*                                                             
       3000-PROCESS-RTN.                                                
      *---*                                                             
           MOVE  SPACE  TO  PROCESS-STATUS.                             
30331A     MOVE  SPACES TO  WS-MK-TRAN.                                 
           MOVE  SPACE  TO  TEMP-AREA                                   
                                                                        
           IF  VADOCI = SPACE                                           
               MOVE  "FAL"  TO  PROCESS-STATUS.                         
                                                                        
           IF  PROCESS-OK                                               
               PERFORM  3100-GU-CIRSEG.                                 
                                                                        
           IF  PROCESS-OK                                               
               PERFORM  3200-GNP-CIASEG.                                
                                                                        
90702A     IF  PROCESS-OK AND (CIRAF = "1") AND (VADOAC IS NUMERIC)     
  "  A         PERFORM  3400-GNP-CIXSEG.                                
                                                                        
           IF  PGM-OK                                                   
               PERFORM  3300-WRITE-OUTPUT-DATA.                         
                                                                        
           IF  PGM-OK                                                   
               PERFORM  1200-READ-INPUT-FILE.                           
      *                                                                 
       3100-GU-CIRSEG.                                                  
      *                                                                 
           MOVE  VADOCI        TO  CICIR-KEY.                           
           CALL  "CBLTDLI"  USING  FUNCTION-GU                          
                                   CIPCB                                
                                   CIRSEG                               
                                   SSA-CICIR.                           
                                                                        
           IF  (CI-STATUS-CODE  =  GOOD-STATUS ) OR                     
               (CI-STATUS-CODE  =  MORE-RESOURCE-NEEDED)                
                MOVE  CIRTE    TO  WS-CIRTE                             
81008C          MOVE  CIRBT7   TO  WS-CIRBT                             
                MOVE  CIRNA    TO  WS-CIRNA                             
                MOVE  CIRPO    TO  WS-CIRPO                             
                MOVE  CIRNM    TO  WS-CIRNM                             
           ELSE                                                         
           IF  (CI-STATUS-CODE  =  SEGMENT-NOT-FOUND)                   
                MOVE    "FAL"  TO  PROCESS-STATUS                       
30331A          ADD      1                    TO    WS-CNT-GE           
           ELSE                                                         
                MOVE    "FAL"  TO  PROCESS-STATUS                       
                MOVE    "FAL"  TO  PGM-STATUS                           
                DISPLAY "####### CIS14 #######"                         
                DISPLAY "  GU CIRSEG ERROR !!"                          
                DISPLAY "  KEY=" CICIR-KEY                              
                DISPLAY "  CI-STATUS-CODE=" CI-STATUS-CODE              
                DISPLAY "#####################".                        
      *                                                                 
       3200-GNP-CIASEG.                                                 
      *                                                                 
           CALL  "CBLTDLI"  USING  FUNCTION-GNP                         
                                   CIPCB                                
                                   CIASEG                               
                                   UNQ-SSA-CICIA.                       
                                                                        
           IF  (CI-STATUS-CODE  =  GOOD-STATUS ) OR                     
               (CI-STATUS-CODE  =  MORE-RESOURCE-NEEDED)                
                MOVE  CIAAD2   TO  WS-CIAAD2                            
                MOVE  CIACD2   TO  WS-CIACD2                            
           ELSE                                                         
           IF  (CI-STATUS-CODE NOT = SEGMENT-NOT-FOUND)                 
                MOVE    "FAL"  TO  PGM-STATUS                           
                DISPLAY "######## CIS14 ########"                       
                DISPLAY "  GNP CIASEG ERROR !!"                         
                DISPLAY "  KEY=" CICIR-KEY                              
                DISPLAY "  CI-STATUS-CODE=" CI-STATUS-CODE              
                DISPLAY "#######################".                      
      *                                                                 
       3300-WRITE-OUTPUT-DATA.                                          
      *                                                                 
           MOVE  SPACE  TO  TRD-NOTE.                                   
                                                                        
           IF  (VADOAC IS NUMERIC)                                      
               MOVE  "006"        TO  CI-BANK                           
               MOVE  VADOAC(1:4)  TO  CBOT-BHI                          
               PERFORM 3700-TRANS-BHI-TO-FISC                           
               MOVE  FISC-BHI     TO  CI-BHI                            
               MOVE  "000"        TO  CI-ACN(1:3)                       
               MOVE  VADOAC       TO  CI-ACN(4:13)                      
           ELSE                                                         
               MOVE  SPACE        TO  CI-ACN-ALL.                       
                                                                        
           IF  (VADOOD IS NUMERIC)                                      
90224C         MOVE    VADOOD     TO  ROC-DAY                           
  "  D*        MOVE    "0"        TO  WS-VADOOD(1:1)                    
  "  D*        MOVE    VADOOD     TO  WS-VADOOD(2:6)                    
  "  D*        MOVE    WS-VADOOD  TO  ROC-DAY                           
               COMPUTE AD-DAY      =  ROC-DAY + 19110000                
               MOVE    AD-DAY     TO  CI-OPENDAY                        
           ELSE                                                         
               MOVE    SPACE      TO  CI-OPENDAY.                       
           IF  (WS-CIRBT IS NUMERIC)                                    
               MOVE    WS-CIRBT   TO  ROC-DAY                           
               COMPUTE AD-DAY      =  ROC-DAY + 19110000                
               MOVE    AD-DAY     TO  CI-BIRTHDAY                       
           ELSE                                                         
               MOVE    SPACE      TO  CI-BIRTHDAY.                      
           MOVE  VADOCI           TO  CI-CIKEY.                         
           MOVE  WS-CIRTE         TO  CI-TEL.                           
31212A     MOVE  WS-CIRTE         TO  ACCEPT-DATA.                      
           PERFORM  VARYING P FROM 1 BY 1 UNTIL P > 11                  
               MOVE    ACCEPT-DATA   TO   TEL-NUM(P)                    
           END-PERFORM.                                                 
                                                                        
           PERFORM  VARYING P FROM 1 BY 1 UNTIL P > 11                  
             PERFORM  VARYING Q FROM 1 BY 1 UNTIL Q > 20                
               IF   TEL-NUM(P)(Q:1)  IS  NUMERIC                        
               THEN                                                     
                 MOVE    Q           TO  A1                             
                 MOVE   20           TO  Q                              
               END-IF                                                   
             END-PERFORM                                                
             PERFORM  VARYING Q FROM 20 BY -1 UNTIL Q < 1               
               IF   TEL-NUM(P)(Q:1)  IS  NUMERIC                        
               THEN                                                     
                 MOVE    Q           TO  A2                             
                 MOVE    1           TO  Q                              
               END-IF                                                   
             END-PERFORM                                                
             IF  TEL-NUM(P)(A1:(A2 - A1 + 1))  =  ZEROS                 
      *      THEN                                                       
      *        DISPLAY 'Fail : ' TEL-NUM(P)                             
               MOVE  SPACE       TO  CI-TEL                             
      *      ELSE                                                       
      *        DISPLAY 'Pass : ' TEL-NUM(P)                             
             END-IF                                                     
31212A     END-PERFORM.                                                 
                                                                        
30718A*    IF  WS-CIRTE =  "0         "  OR                             
      *        WS-CIRTE =  "00        "  OR                             
      *        WS-CIRTE =  "000       "  OR                             
      *        WS-CIRTE =  "0000      "  OR                             
      *        WS-CIRTE =  "00000     "  OR                             
      *        WS-CIRTE =  "000000    "  OR                             
      *        WS-CIRTE =  "0000000   "  OR                             
      *        WS-CIRTE =  "00000000  "  OR                             
      *        WS-CIRTE =  "000000000 "  OR                             
      *        WS-CIRTE =  "0000000000"                                 
      *        MOVE  SPACE        TO  CI-TEL.                           
                                                                        
           MOVE  SPACE            TO  CI-NATION.                        
           IF  WS-CIRNA = "0"                                           
               MOVE  "本國人　" TO  CI-NATION                         
           ELSE                                                         
           IF  WS-CIRNA = "3" OR "4"                                    
               MOVE  "大陸人民" TO  CI-NATION                         
           ELSE                                                         
           IF  WS-CIRNA = "1" OR "2"                                    
               MOVE  WS-CIRPO     TO  CI-NATION(1:2)                    
               MOVE  SIGN-0E      TO  CI-NATION(21:1)                   
               MOVE  SIGN-0F      TO  CI-NATION(22:1).                  
           IF  CI-NATION = SPACE                                        
               MOVE  SIGN-0E      TO  CI-NATION(21:1)                   
               MOVE  SIGN-0F      TO  CI-NATION(22:1).                  
                                                                        
      *                                                                 
30331A     MOVE  VADNM            TO  WS-NAME-O.                        
     A     PERFORM  3300-1-TRANS-NAME.                                  
      *                                                                 
30916C*    MOVE     SPACES                     TO      WS-MK-NM.        
     A     IF       WS-MK-NM    =   "Y"                                 
     A              MOVE      SPACES           TO      TR-NAME          
     A              MOVE      WS-NAME-O        TO      TR-NAME          
     A     ELSE                                                         
     C              MOVE      SIGN-0E          TO      TR-NAME(1:1)     
     C              MOVE      VADNM(2:40)      TO      TR-NAME(2:40)    
     C              MOVE      SIGN-0F          TO      TR-NAME(42:1)    
     A     END-IF.                                                      
      *                                                                 
           MOVE  VADID            TO  TR-CIKEY.                         
           MOVE  VADTE            TO  TR-TEL.                           
31212A     MOVE  VADTE            TO  ACCEPT-DATA.                      
           PERFORM  VARYING P FROM 1 BY 1 UNTIL P > 11                  
               MOVE    ACCEPT-DATA   TO   TEL-NUM(P)                    
           END-PERFORM.                                                 
                                                                        
           PERFORM  VARYING P FROM 1 BY 1 UNTIL P > 11                  
             PERFORM  VARYING Q FROM 1 BY 1 UNTIL Q > 20                
               IF   TEL-NUM(P)(Q:1)  IS  NUMERIC                        
               THEN                                                     
                 MOVE    Q           TO  A1                             
                 MOVE   20           TO  Q                              
               END-IF                                                   
             END-PERFORM                                                
             PERFORM  VARYING Q FROM 20 BY -1 UNTIL Q < 1               
               IF   TEL-NUM(P)(Q:1)  IS  NUMERIC                        
               THEN                                                     
                 MOVE    Q           TO  A2                             
                 MOVE    1           TO  Q                              
               END-IF                                                   
             END-PERFORM                                                
             IF  TEL-NUM(P)(A1:(A2 - A1 + 1))  =  ZEROS                 
      *      THEN                                                       
      *        DISPLAY 'Fail : ' TEL-NUM(P)                             
               MOVE  SPACE       TO  TR-TEL                             
      *      ELSE                                                       
      *        DISPLAY 'Pass : ' TEL-NUM(P)                             
             END-IF                                                     
31212A     END-PERFORM.                                                 
                                                                        
30718A*    IF  VADTE    =  "0         "  OR                             
      *        VADTE    =  "00        "  OR                             
      *        VADTE    =  "000       "  OR                             
      *        VADTE    =  "0000      "  OR                             
      *        VADTE    =  "00000     "  OR                             
      *        VADTE    =  "000000    "  OR                             
      *        VADTE    =  "0000000   "  OR                             
      *        VADTE    =  "00000000  "  OR                             
      *        VADTE    =  "000000000 "  OR                             
      *        VADTE    =  "0000000000"                                 
      *        MOVE  SPACE        TO  TR-TEL.                           
                                                                        
           IF  (VADBT IS NUMERIC)                                       
90224C         MOVE    VADBT      TO  ROC-DAY                           
  "  D*        MOVE    "0"        TO  WS-VADBT(1:1)                     
  "  D*        MOVE    VADBT      TO  WS-VADBT(2:6)                     
  "  D*        MOVE    WS-VADBT   TO  ROC-DAY                           
               COMPUTE AD-DAY      =  ROC-DAY + 19110000                
               MOVE    AD-DAY     TO  TR-BIRTHDAY                       
           ELSE                                                         
               MOVE  SPACE        TO  TR-BIRTHDAY.                      
                                                                        
           IF  (VADOXD IS NUMERIC)                                      
90224C         MOVE    VADOXD     TO  ROC-DAY                           
  "  D*        MOVE    "0"        TO  WS-VADOXD(1:1)                    
  "  D*        MOVE    VADOXD     TO  WS-VADOXD(2:6)                    
  "  D*        MOVE    WS-VADOXD  TO  ROC-DAY                           
               COMPUTE AD-DAY      =  ROC-DAY + 19110000                
               MOVE    AD-DAY     TO  TRD-DATE                          
           ELSE                                                         
               MOVE    SPACE      TO  TRD-DATE.                         
                                                                        
           IF  (VADOXT IS NUMERIC)                                      
               MOVE    VADOXT     TO  TRD-TIME                          
           ELSE                                                         
               MOVE    SPACE      TO  TRD-TIME.                         
                                                                        
           MOVE  VADAMT           TO  WS-AMT.                           
           MOVE  WS-AMT           TO  TRD-AMT.                          
           MOVE  "006"            TO  TRD-BANK.                         
           MOVE  VADBH            TO  CBOT-BHI.                         
           PERFORM 3700-TRANS-BHI-TO-FISC.                              
           MOVE  FISC-BHI         TO  TRD-BHI.                          
81122A     MOVE  VADKID           TO  TRD-TYPE.                         
90224D*    MOVE  VADTP            TO  TRD-TYPE.                         
41127D*    MOVE  VADKID           TO  TRD-TYPE.                         
81122D*    IF  VADKID  =  "96"  OR  "97"  OR  "98"                      
  "  D*        MOVE  "99"             TO  TRD-TYPE                      
  "  D*    ELSE                                                         
  "  D*        MOVE  VADKID           TO  TRD-TYPE.                     
                                                                        
           MOVE  VADAMA           TO  WS-AMT.                           
           MOVE  WS-AMT           TO  TRD-ACCU-AMT.                     
      *                                                                 
30331A     MOVE  VADBNM           TO  WS-NAME-O.                        
     A     PERFORM  3300-1-TRANS-NAME.                                  
      *                                                                 
30916C*    MOVE     SPACES                     TO      WS-MK-NM.        
     A     IF       WS-MK-NM    =   "Y"                                 
     A              MOVE      SPACES           TO      TRD-NAME         
     A              MOVE      WS-NAME-O        TO      TRD-NAME         
     A     ELSE                                                         
     C              MOVE      SIGN-0E          TO      TRD-NAME(1:1)    
     C              MOVE      VADBNM(2:40)     TO      TRD-NAME(2:40)   
     C              MOVE      SIGN-0F          TO      TRD-NAME(42:1)   
     A     END-IF.                                                      
      *                                                                 
           MOVE  VADBK            TO  TRD-ACN-BK.                       
           MOVE  VADBKH           TO  TRD-ACN-BHI.                      
           MOVE  VADBKA           TO  TRD-ACN.                          
                                                                        
           MOVE    WS-CIRNM   TO  WS-NAME.                              
30331A     MOVE    WS-CIRNM   TO  WS-NAME-O.                            
           PERFORM 3310-PROCESS-NAME.                                   
           MOVE    WS-NAME    TO  CI-NAME.                              
                                                                        
           MOVE    WS-CIACD2  TO  WS-ADDR.                              
           PERFORM 3320-PROCESS-ADDR.                                   
           IF  WS-ADDR-CC NOT = SPACE                                   
               MOVE    WS-ADDR TO  CI-ADDR                              
           ELSE                                                         
               MOVE    WS-CIAAD2  TO  WS-ADDR                           
               PERFORM 3320-PROCESS-ADDR                                
               MOVE    WS-ADDR TO  CI-ADDR.                             
                                                                        
           PERFORM 3301-VALID-OUT-DATA.                                 
      *                                                                 
30331A     MOVE     SPACES                     TO      WS-NAME-O.       
     A     MOVE     CI-NAME                    TO      WS-NAME-O.       
     A     MOVE     "Y"                        TO      WS-MK-TRAN.      
     A     PERFORM  3300-1-TRANS-NAME.                                  
     A     IF       WS-MK-NM    =   "Y"                                 
     A              MOVE      SPACES           TO      CI-NAME          
     A              MOVE      WS-NAME-O        TO      CI-NAME-R-CC     
     A              MOVE      SIGN-0E          TO      CI-NAME-R-0E     
     A              MOVE      SIGN-0F          TO      CI-NAME-R-0F     
     A              ADD       1                TO      WS-ENG-CINAME    
30408C*    ELSE                                                         
     C*    IF       WS-MK-NM    =   "A"                                 
     C*             MOVE      WS-NAME-O        TO      CI-NAME          
     C*             ADD       1                TO      WS-HALF-CNT      
     A     END-IF.                                                      
      *                                                                 
30331A     MOVE     SPACES                     TO      WS-ADDR-O.       
     A     MOVE     CI-ADDR                    TO      WS-ADDR-O.       
     A     PERFORM  3300-1-TRANS-ADDR.                                  
     A     IF       WS-MK-ADR   =   "Y"                                 
     A              MOVE      SPACES           TO      CI-ADDR          
     A              MOVE      WS-ADDR-O        TO      CI-ADDR-R-CC     
     A              MOVE      SIGN-0E          TO      CI-ADDR-R-0E     
     A              MOVE      SIGN-0F          TO      CI-ADDR-R-0F     
     A              ADD       1                TO      WS-ENG-ADDR      
30408C*    ELSE                                                         
     C*    IF       WS-MK-ADR   =   "A"                                 
     C*             MOVE      WS-ADDR-O        TO      CI-ADDR          
     C*             ADD       1                TO      WS-HALF-CNT      
     A     END-IF.                                                      
      *                                                                 
30331A     MOVE     SPACES                     TO      WS-NAME-O.       
     A     MOVE     TR-NAME                    TO      WS-NAME-O.       
     A     PERFORM  3300-1-TRANS-NAME.                                  
     A     IF       WS-MK-NM    =   "Y"                                 
     A              MOVE      SPACES           TO      TR-NAME          
     A              MOVE      WS-NAME-O        TO      TR-NAME-R-CC     
     A              MOVE      SIGN-0E          TO      TR-NAME-R-0E     
     A              MOVE      SIGN-0F          TO      TR-NAME-R-0F     
     A              ADD       1                TO      WS-ENG-TRNAME    
30408C*    ELSE                                                         
     C*    IF       WS-MK-NM    =   "A"                                 
     C*             MOVE      WS-NAME-O        TO      TR-NAME          
     C*             ADD       1                TO      WS-HALF-CNT      
     A     END-IF.                                                      
      *                                                                 
30331A     MOVE     SPACES                     TO      WS-NAME-O.       
     A     MOVE     TRD-NAME                   TO      WS-NAME-O.       
     A     PERFORM  3300-1-TRANS-NAME.                                  
     A     IF       WS-MK-NM    =   "Y"                                 
     A              MOVE      SPACES           TO      TRD-NAME         
     A              MOVE      WS-NAME-O        TO      TRD-NAME-R-CC    
     A              MOVE      SIGN-0E          TO      TRD-NAME-R-0E    
     A              MOVE      SIGN-0F          TO      TRD-NAME-R-0F    
     A              ADD       1                TO      WS-ENG-TRDNAME   
30408C*    ELSE                                                         
     C*    IF       WS-MK-NM    =   "A"                                 
     C*             MOVE      WS-NAME-O        TO      TRD-NAME         
     C*             ADD       1                TO      WS-HALF-CNT      
     A     END-IF.                                                      
      *                                                                 
30331A     MOVE     SPACES                     TO      WS-MK-TRAN.      
      *                                                                 
           WRITE OUT-REC        FROM  OUT-DETAIL.                       
30331A     ADD     1                      TO      WS-WRT1.              
                                                                        
90930C     MOVE    OUT-DETAIL(1:916)  TO  OUT2-OUT-DETAIL.              
                                                                        
90823A     IF  VADMEO(1:1) = SIGN-0E                                    
  "  A         MOVE  VADMEO   TO  OUT2-OUT-NOTE-1                       
  "  A         MOVE  SPACES   TO  OUT2-OUT-NOTE-0E                      
  "  A         MOVE  SPACES   TO  OUT2-OUT-NOTE-0F                      
  "  A     ELSE                                                         
  "  A         MOVE  VADMEO   TO  OUT2-OUT-NOTE-1                       
  "  A         MOVE  SIGN-0E  TO  OUT2-OUT-NOTE-0E                      
  "  A         MOVE  SIGN-0F  TO  OUT2-OUT-NOTE-0F                      
  "  A     END-IF.                                                      
                                                                        
90823A     WRITE OUT2-REC       FROM  OUT2-DETAIL.                      
90823A     MOVE  SPACES         TO    OUT2-OUT-DETAIL                   
90823A                                OUT2-OUT-NOTE.                    
30331A     ADD     1                      TO      WS-WRT2.              
      *                                                                 
30331A 3300-1-TRANS-NAME.                                               
      *                                                                 
           MOVE     SPACES                            TO    WS-MK-NM    
                    WS-MK-HALF1   WS-MK-HALF2         BYTE1-CHECK-O.    
      *                                                                 
           MOVE     LENGTH   OF   WS-NAME-O           TO    WS-DATA-LEN.
           MOVE     0                                 TO    WS-0E-CNT   
                    WS-HA-CNT     WS-CHK-CNT                WS-0F-CNT.  
      *                                                                 
           PERFORM  VARYING I2 FROM 1 BY 1 UNTIL I2 > WS-DATA-LEN       
             MOVE   WS-NAME-O    (I2:1)               TO    BYTE1-CHECK 
             IF    (WS-NAME-O    (I2:1)      =  X"0E")                  
               AND  WS-0E-CNT                =  0                       
                    MOVE    I2                        TO    WS-0E-CNT   
             ELSE                                                       
             IF    (WS-NAME-O    (I2:1)      =  X"0F")                  
               AND  WS-0F-CNT                =  0                       
                    MOVE    I2                        TO    WS-0F-CNT   
             ELSE                                                       
             IF     BYTE1-VALID1  AND  BYTE1-VALID-O1                   
                    MOVE    "Y"                       TO    WS-MK-HALF1 
             ELSE                                                       
             IF     BYTE1-VALID2  AND  BYTE1-VALID-O2                   
                    MOVE    "Y"                       TO    WS-MK-HALF2 
             ELSE                                                       
             IF     BYTE1-VALID1  AND  BYTE1-VALID-O2                   
                AND WS-MK-HALF2    =   "Y"                              
                    MOVE    SPACES                    TO    WS-MK-HALF2 
             ELSE                                                       
             IF     BYTE1-VALID2  AND  BYTE1-VALID-O1                   
                AND WS-MK-HALF1    =   "Y"                              
                    MOVE    SPACES                    TO    WS-MK-HALF1 
             END-IF                                                     
             END-IF                                                     
             END-IF                                                     
             END-IF                                                     
             END-IF                                                     
             END-IF                                                     
             MOVE   BYTE1-CHECK                       TO   BYTE1-CHECK-O
           END-PERFORM.                                                 
      *                                                                 
           IF       WS-MK-HALF1  =  "Y"   AND   WS-MK-HALF2  =  SPACES  
               OR   WS-MK-HALF2  =  "Y"   AND   WS-MK-HALF1  =  SPACES  
                    ADD       1                 TO           WS-HA-CNT  
           END-IF.                                                      
      *                                                                 
           IF       WS-0E-CNT   =    0   AND   WS-0F-CNT   =    0       
                    NEXT      SENTENCE                                  
           ELSE                                                         
                    COMPUTE   WS-CHK-CNT   =   1                        
           END-IF.                                                      
      *                                                                 
           IF       WS-CHK-CNT           =  0                           
              AND   WS-NAME-O        NOT =  SPACES                      
                    MOVE     "Y"               TO      WS-MK-NM         
30916C*    ELSE                                                         
      *    IF       WS-HA-CNT            >  0                           
      *        AND  WS-MK-TRAN           =  "Y"                         
      *             MOVE     40                TO      L                
      *             MOVE     WS-NAME-O(2:40)   TO      WS-INSTR         
      *             PERFORM  3300-1-TRANS-HALF-ALL                      
      *             MOVE     WS-OUTSTR         TO      WS-NAME-O(2:40)  
      *             MOVE     "A"               TO      WS-MK-NM         
           END-IF.                                                      
      *                                                                 
30331A 3300-1-TRANS-ADDR.                                               
      *                                                                 
           MOVE     SPACES                            TO    WS-MK-ADR   
                    WS-MK-HALF1   WS-MK-HALF2         BYTE1-CHECK-O.    
      *                                                                 
           MOVE     LENGTH   OF   WS-ADDR-O           TO    WS-DATA-LEN.
           MOVE     0                                 TO    WS-0E-CNT   
                    WS-HA-CNT     WS-CHK-CNT                WS-0F-CNT.  
      *                                                                 
           PERFORM  VARYING I2 FROM 1 BY 1 UNTIL I2 > WS-DATA-LEN       
             MOVE   WS-ADDR-O    (I2:1)               TO    BYTE1-CHECK 
             IF    (WS-ADDR-O    (I2:1)      =  X"0E")                  
               AND  WS-0E-CNT                =  0                       
                    MOVE    I2                        TO    WS-0E-CNT   
             ELSE                                                       
             IF    (WS-ADDR-O    (I2:1)      =  X"0F")                  
               AND  WS-0F-CNT                =  0                       
                    MOVE    I2                        TO    WS-0F-CNT   
             ELSE                                                       
             IF     BYTE1-VALID1  AND  BYTE1-VALID-O1                   
                    MOVE    "Y"                       TO    WS-MK-HALF1 
             ELSE                                                       
             IF     BYTE1-VALID2  AND  BYTE1-VALID-O2                   
                    MOVE    "Y"                       TO    WS-MK-HALF2 
             ELSE                                                       
             IF     BYTE1-VALID1  AND  BYTE1-VALID-O2                   
                AND WS-MK-HALF2    =   "Y"                              
                    MOVE    SPACES                    TO    WS-MK-HALF2 
             ELSE                                                       
             IF     BYTE1-VALID2  AND  BYTE1-VALID-O1                   
                AND WS-MK-HALF1    =   "Y"                              
                    MOVE    SPACES                    TO    WS-MK-HALF1 
             END-IF                                                     
             END-IF                                                     
             END-IF                                                     
             END-IF                                                     
             END-IF                                                     
             END-IF                                                     
             MOVE   BYTE1-CHECK                       TO   BYTE1-CHECK-O
           END-PERFORM.                                                 
      *                                                                 
           IF       WS-MK-HALF1  =  "Y"   AND   WS-MK-HALF2  =  SPACES  
               OR   WS-MK-HALF2  =  "Y"   AND   WS-MK-HALF1  =  SPACES  
                    ADD       1                 TO           WS-HA-CNT  
           END-IF.                                                      
      *                                                                 
           IF       WS-0E-CNT   =    0   AND   WS-0F-CNT   =    0       
                    NEXT      SENTENCE                                  
           ELSE                                                         
                    COMPUTE   WS-CHK-CNT   =   1                        
           END-IF.                                                      
      *                                                                 
           IF       WS-CHK-CNT         =   0                            
              AND   WS-ADDR-O     NOT  =   SPACES                       
                    MOVE     "Y"               TO      WS-MK-ADR        
30916C*    ELSE                                                         
      *    IF       WS-HA-CNT          >   0                            
      *        AND  WS-MK-TRAN         =  "Y"                           
      *             MOVE     70                TO      L                
      *             MOVE     WS-ADDR-O(2:70)   TO      WS-INSTR         
      *             PERFORM  3300-1-TRANS-HALF-ALL                      
      *             MOVE     WS-OUTSTR         TO      WS-ADDR-O(2:70)  
      *             MOVE     "A"               TO      WS-MK-ADR        
           END-IF.                                                      
      *                                                                 
30331A 3300-1-TRANS-HALF-ALL.                                           
      *                                                                 
           COMPUTE  J    =    1.                                        
           COMPUTE  K    =    L.                                        
           MOVE     SPACE                      TO      WS-OUTSTR.       
           PERFORM  VARYING I3 FROM 1 BY 1 UNTIL (I3 > K) OR (J NOT < K)
                    IF        WS-INSTR(I3:1) = SIGN-40                  
                              MOVE  SIGN-40    TO      WS-OUTSTR(J:1)   
                    ELSE                                                
                              MOVE  SIGN-42    TO      WS-OUTSTR(J:1)   
                    END-IF                                              
                    ADD       1                TO      J                
                    MOVE      WS-INSTR(I3:1)   TO      WS-OUTSTR(J:1)   
                    ADD       1                TO      J                
           END-PERFORM.                                                 
      *                                                                 
       3301-VALID-OUT-DATA.                                             
      *                                                                 
                                                                        
      ****檢查交易帳戶中之分行代號非金融局公告之代號                  
           PERFORM 3303-VALID-TRD-ACN.                                  
                                                                        
      ****客戶帳戶存在時，戶名、開戶日、CIKEY及住址不可為空白       
      ****法務調查局交易類別為01, 02, 03, 99                          
      ****交易類別為９９其它類時，客戶帳戶才可為空白                  
           IF  CI-ACN-ALL NOT = SPACE                                   
81122C         PERFORM 3305-VALID-CI-DATA.                              
  "  D*  ELSE                                                           
81122A     IF  VADKID  =  "01"  OR  "02"  OR  "03"                      
  "  A         MOVE  VADKID           TO  TRD-TYPE                      
  "  A     ELSE                                                         
  "  A         MOVE  "99"             TO  TRD-TYPE.                     
  "  D*    IF  TRD-TYPE NOT = "99"                                      
  "  D*        MOVE  "99"  TO  TRD-TYPE.                                
                                                                        
      ****交易人CIKEY必須是自然人不可為公司戶                       
      ****　　　   　必須符合身份證號編碼規則                       
01210A     MOVE  TR-CIKEY       TO    WS-CIKEY-FOREIGN.                 
           IF  TR-CIKEY NOT = SPACE                                     
90227A*外國人                                                         
01210C         IF  TR-CIKEY(2:9) IS NOT NUMERIC  OR                     
  "  A             (CIF1-VALID   AND  CIF2-VALID )                      
                   MOVE  "N18"   TO  WS-NOTE                            
                   PERFORM  3800-EDIT-ERR-NOTE                          
               ELSE                                                     
90227A*自然人判斷是否外國人                                           
                   MOVE  TR-CIKEY     TO  XID-CIKEY                     
                   MOVE  SPACE        TO  XID-RETCODE                   
                   CALL  "XIDCHK"  USING  LINKXID                       
                   IF    XID-RETCODE = "E"                              
                         MOVE    "N18"  TO  WS-NOTE                     
                         PERFORM 3800-EDIT-ERR-NOTE.                    
                                                                        
      ****客戶CIKEY必須符合身份證號編碼規則                         
01210A     MOVE  CI-CIKEY       TO    WS-CIKEY-FOREIGN.                 
           IF  CI-CIKEY NOT = SPACE                                     
               IF  CI-CIKEY(1:1) = "*"                                  
                   MOVE  CIRER  TO  CI-CIKEY(1:1).                      
                                                                        
           IF  CI-CIKEY NOT = SPACE                                     
90227A*營利事業統編(8 + 2 SPACE)                                      
  "  A         IF  CI-CIKEY(1:8) IS NUMERIC  AND  CI-CIKEY(9:2) = SPACE 
  "  A             MOVE  CI-CIKEY     TO  XID-CIKEY                     
  "  A             MOVE  SPACE        TO  XID-RETCODE                   
  "  A             CALL  "XIDCHK"  USING  LINKXID                       
  "  A             IF    XID-RETCODE = "E"                              
  "  A                   MOVE    "N19"  TO  WS-NOTE                     
  "  A                   PERFORM 3800-EDIT-ERR-NOTE                     
  "  A             END-IF                                               
  "  A         ELSE                                                     
  "  A*外國人                                                         
01210C         IF  CI-CIKEY(2:9) IS NOT NUMERIC  OR                     
01210A             (CIF1-VALID   AND  CIF2-VALID )                      
  "  A             MOVE  "N19"   TO  WS-NOTE                            
  "  A             PERFORM  3800-EDIT-ERR-NOTE                          
  "  A         ELSE                                                     
90227A*自然人判斷是否外國人                                           
                   MOVE  CI-CIKEY     TO  XID-CIKEY                     
                   MOVE  SPACE        TO  XID-RETCODE                   
                   CALL  "XIDCHK"  USING  LINKXID                       
                   IF    XID-RETCODE = "E"                              
                         MOVE    "N19"  TO  WS-NOTE                     
                         PERFORM 3800-EDIT-ERR-NOTE.                    
                                                                        
90702A****交易為本人交易時VADMK2 = "0"                                
      ****客戶CIKEY與交易人CIKEY相同時其戶名必須相同              
90702A     IF  VADMK2 = "0"                                             
     C         IF  (CI-CIKEY = TR-CIKEY) AND                            
     C             (CI-CIKEY NOT = SPACE)                               
     C             IF  TR-NAME(2:40) NOT = SPACE                        
     C                 MOVE  TR-NAME  TO  CI-NAME                       
     C             ELSE                                                 
     C                 MOVE  CI-NAME  TO  TR-NAME                       
     A             END-IF                                               
     A         END-IF                                                   
     A     END-IF.                                                      
                                                                        
      ****客戶姓名與交易人姓名相同時其CIKEY必須相同                 
           IF  (CI-NAME = TR-NAME)                                      
               IF  (CI-CIKEY NOT = TR-CIKEY)                            
                   MOVE  TR-NAME       TO  WS-NAME                      
30331C*            MOVE  ？          TO  TR-NAME(2:2)                 
     C             IF    TR-NAME(1:1) = SIGN-0E                         
     C                   MOVE  X'426F'       TO  TR-NAME(2:2)           
     C                   MOVE  WS-NAME(2:38) TO  TR-NAME(4:38)          
     C             END-IF                                               
     C             IF    TR-NAME(1:1) NOT = SIGN-0E                     
     C                   MOVE  '? '          TO  TR-NAME(2:2)           
     C                   MOVE  WS-NAME(1:38) TO  TR-NAME(4:38)          
     C             END-IF                                               
     A         END-IF                                                   
     A     END-IF.                                                      
                                                                        
      ****檢查交易人資料是否完整                                      
      ****姓名、統編、出生日期任一欄位有資料，其它各欄位均須有資料    
      ****交易種類為０３（換鈔）時，必須有交易人資料                  
           PERFORM 3307-VALID-TRD-DATA.                                 
                                                                        
           PERFORM 3309-VALID-DATE-FLD.                                 
      *                                                                 
       3303-VALID-TRD-ACN.                                              
      *                                                                 
           MOVE  SPACE  TO  BK-SW.                                      
                                                                        
           IF  (TRD-ACN-BK = SPACE) AND (TRD-ACN-BHI = SPACE)           
               MOVE  "Y"  TO  BK-SW.                                    
                                                                        
           IF  (TRD-ACN-ALL = ACN-ZEROS)                                
               MOVE  "Y"  TO  BK-SW.                                    
                                                                        
           PERFORM   3303-1-VALID-TRD-ACN-DETAIL                        
             VARYING I FROM 1 BY 1                                      
               UNTIL BK-SW NOT = SPACE.                                 
                                                                        
           IF  TRD-ACN-ALL NOT = SPACE                                  
               PERFORM 3303-2-VALID-TRD-ACN-NULL.                       
      *                                                                 
       3303-1-VALID-TRD-ACN-DETAIL.                                     
      *                                                                 
           IF  TRD-ACN-BHI = SPACE                                      
               IF  (TRD-ACN-BK = BANK-NO(I))                            
                   MOVE  "Y"  TO  BK-SW                                 
                   MOVE  BANK-BHI(I)  TO  TRD-ACN-BHI                   
               END-IF                                                   
           ELSE                                                         
               MOVE  BANK-BHI(I)  TO  WS-BANK-BHI                       
               IF  (TRD-ACN-BK  = BANK-NO(I)) AND                       
                   (TRD-ACN-BHI(1:3) = WS-BANK-BHI(1:3))                
                   MOVE  "Y"  TO  BK-SW                                 
                   MOVE  WS-BANK-BHI(4:1) TO TRD-ACN-BHI(4:1)           
               END-IF.                                                  
                                                                        
           IF  (BK-SW = SPACE) AND                                      
               ((BANK-NO(I) = SPACE) OR (I = 5000) OR                   
                (TRD-ACN-BK < BANK-NO(I)))                              
                MOVE  "Y"     TO  BK-SW                                 
                MOVE  "N23"   TO  WS-NOTE                               
                PERFORM 3800-EDIT-ERR-NOTE.                             
      *                                                                 
       3303-2-VALID-TRD-ACN-NULL.                                       
      *                                                                 
           MOVE  ZEROS  TO  X-I.                                        
           PERFORM  VARYING I FROM 1 BY 1 UNTIL I > 23                  
             IF  TRD-ACN-ALL(I:1) IS NOT NUMERIC                        
                 MOVE  "X"   TO  TRD-ACN-ALL(I:1)                       
                 ADD   1     TO  X-I                                    
             END-IF                                                     
           END-PERFORM.                                                 
                                                                        
           IF  X-I < 16                                                 
               PERFORM  VARYING I FROM 23 BY -1                         
                        UNTIL TRD-ACN-ALL(I:1) NOT = "X"                
                 IF  TRD-ACN-ALL(I:1) = "X"                             
                     MOVE  SPACE TO TRD-ACN-ALL(I:1)                    
                 END-IF                                                 
               END-PERFORM.                                             
      *                                                                 
       3305-VALID-CI-DATA.                                              
      *                                                                 
           IF  CI-NAME(2:40) = SPACE                                    
               MOVE  "無戶名"   TO CI-NAME                            
               MOVE  CI-NAME(8:1) TO CI-NAME(42:1)                      
               MOVE  SPACE        TO CI-NAME(8:1).                      
                                                                        
           IF  CI-OPENDAY = SPACE                                       
               MOVE  "20000101"   TO CI-OPENDAY.                        
                                                                        
           IF  CI-CIKEY = SPACE                                         
               IF  (CI-NAME = TR-NAME) AND (TR-CIKEY NOT = SPACE)       
                   MOVE  TR-CIKEY     TO  CI-CIKEY                      
               ELSE                                                     
                   MOVE  "A111111113" TO  CI-CIKEY.                     
                                                                        
           IF  CI-ADDR(2:70) = SPACE                                    
               MOVE  "無住址"   TO CI-ADDR                            
               MOVE  SIGN-0F      TO CI-ADDR(72:1)                      
               MOVE  SPACE        TO CI-ADDR(8:1).                      
      *                                                                 
       3307-VALID-TRD-DATA.                                             
      *                                                                 
           IF  (CI-ACN-ALL = SPACE) AND                                 
               (TR-CIKEY   = SPACE)                                     
               MOVE  "A222222227"  TO  TR-CIKEY.                        
                                                                        
           IF  (TR-NAME(2:40) NOT = SPACE) OR                           
               (TR-CIKEY      NOT = SPACE) OR                           
               (TR-BIRTHDAY   NOT = SPACE) OR                           
               (TRD-TYPE = "03")                                        
               IF  TR-NAME(2:40) = SPACE                                
                   MOVE  "無交易人姓名"  TO  TR-NAME                  
                   MOVE  TR-NAME(16:1)     TO  TR-NAME(42:1)            
                   MOVE  SPACE             TO  TR-NAME(16:1)            
               END-IF                                                   
               IF  TR-CIKEY = SPACE                                     
                   IF  (CI-NAME = TR-NAME) AND (CI-CIKEY NOT = SPACE)   
                       MOVE  CI-CIKEY     TO  TR-CIKEY                  
                   ELSE                                                 
                       MOVE  "A222222227" TO  TR-CIKEY                  
                   END-IF                                               
               END-IF                                                   
               IF  TR-BIRTHDAY = SPACE                                  
                   MOVE  "20000101"        TO  TR-BIRTHDAY              
               END-IF.                                                  
                                                                        
           IF  (TRD-ACN-ALL = ACN-ZEROS)                                
               MOVE  SPACE  TO  TRD-ACN-ALL                             
               MOVE  SPACE  TO  TRD-NAME(2:40)                          
           ELSE                                                         
           IF  (TRD-ACN-ALL = SPACE)                                    
               MOVE  SPACE  TO  TRD-NAME(2:40)                          
           ELSE                                                         
               IF  TRD-NAME(2:40) = SPACE                               
                   MOVE  "無受款人姓名"  TO  TRD-NAME                 
                   MOVE  TRD-NAME(16:1)    TO  TRD-NAME(42:1)           
                   MOVE  SPACE             TO  TRD-NAME(16:1)           
               ELSE                                                     
30331C*        IF  TRD-NAME(2:6) =  本人　  OR  本公司              
     C         IF  TRD-NAME(2:6) = X'4D7B4C494040' OR                   
     C                             X'4D7B4C9D4D53'                      
                   MOVE  TR-NAME  TO  TRD-NAME.                         
      *                                                                 
       3309-VALID-DATE-FLD.                                             
      *                                                                 
           IF  CI-OPENDAY IS NUMERIC                                    
               MOVE  CI-OPENDAY  TO  WS-AD                              
               IF  (WS-AD-YY < "1900" OR WS-AD-YY > "2100") OR          
                   (WS-AD-MM < "01"   OR WS-AD-MM > "12")   OR          
                   (WS-AD-DD < "01"   OR WS-AD-DD > "31")               
                   MOVE  "20000101"   TO CI-OPENDAY.                    
                                                                        
           IF  CI-BIRTHDAY IS NUMERIC                                   
               MOVE  CI-BIRTHDAY TO  WS-AD                              
               IF  (WS-AD-YY < "1900" OR WS-AD-YY > "2100") OR          
                   (WS-AD-MM < "01"   OR WS-AD-MM > "12")   OR          
                   (WS-AD-DD < "01"   OR WS-AD-DD > "31")               
                   MOVE  "20000101"   TO CI-BIRTHDAY.                   
                                                                        
           IF  TR-BIRTHDAY IS NUMERIC                                   
               MOVE  TR-BIRTHDAY TO  WS-AD                              
               IF  (WS-AD-YY < "1900" OR WS-AD-YY > "2100") OR          
                   (WS-AD-MM < "01"   OR WS-AD-MM > "12")   OR          
                   (WS-AD-DD < "01"   OR WS-AD-DD > "31")               
                   MOVE  "20000101"   TO TR-BIRTHDAY.                   
                                                                        
           MOVE  FUNCTION CURRENT-DATE (1:4)  TO WS-AD-YY.              
           MOVE  FUNCTION CURRENT-DATE (5:2)  TO WS-AD-MM.              
           MOVE  FUNCTION CURRENT-DATE (7:2)  TO WS-AD-DD.              
           MOVE    WS-AD    TO  AD-DAY.                                 
           COMPUTE AD-DAY    =  AD-DAY - 00010000.                      
           IF  AD-DAY > TRD-DATE                                        
               MOVE    "N25"  TO  WS-NOTE                               
               PERFORM 3800-EDIT-ERR-NOTE.                              
                                                                        
      *                                                                 
       3310-PROCESS-NAME.                                               
      *                                                                 
           PERFORM VARYING I FROM 41 BY -1 UNTIL (I < 2)                
              IF  WS-NAME(I:1) = SIGN-0F                                
                  MOVE SPACE TO WS-NAME(I:1)                            
                  MOVE ZEROS TO I                                       
              END-IF                                                    
           END-PERFORM.                                                 
                                                                        
           PERFORM  VARYING I FROM  2  BY 2 UNTIL ( I > 42)             
30331C*      MOVE  WS-NAME(I:2) TO SIGN-QQ                              
     C       MOVE  WS-NAME(I:2) TO TAXCOM-SIGN                          
     C*      IF  SIGN-ERR                                               
     C       IF  TAXCOM-SIGN-ERR                                        
     C*          MOVE  SPACE  TO  WS-NAME(I:2)                          
     C           MOVE  SIGN-STAR  TO  WS-NAME(I:2)                      
             END-IF                                                     
           END-PERFORM.                                                 
      *                                                                 
30331A     PERFORM  3300-1-TRANS-NAME.                                  
      *                                                                 
     A     IF       WS-MK-NM             =  "Y"                         
     A              MOVE      SPACES           TO      WS-NAME          
     A              MOVE      WS-NAME-O        TO      WS-NAME          
     A     ELSE                                                         
     C              MOVE      SIGN-0E          TO      WS-NAME-0E       
     C              MOVE      SIGN-0F          TO      WS-NAME-0F       
     A     END-IF.                                                      
      *                                                                 
       3320-PROCESS-ADDR.                                               
      *                                                                 
30331A     MOVE     WS-ADDR                    TO      WS-ADDR-O.       
      *                                                                 
           PERFORM VARYING I FROM 71 BY -1 UNTIL (I < 2)                
              IF  WS-ADDR(I:1) = SIGN-0F                                
                  MOVE SPACE TO WS-ADDR(I:1)                            
                  MOVE ZEROS TO I                                       
              END-IF                                                    
           END-PERFORM.                                                 
                                                                        
           PERFORM  VARYING I FROM  2  BY 2 UNTIL ( I > 72)             
30331C*      MOVE  WS-ADDR(I:2) TO SIGN-QQ                              
     C       MOVE  WS-ADDR(I:2) TO TAXCOM-SIGN                          
     C*      IF  SIGN-ERR                                               
     C       IF  TAXCOM-SIGN-ERR                                        
     C*          MOVE  SPACE  TO  WS-ADDR(I:2)                          
     C           MOVE  SIGN-STAR  TO  WS-ADDR(I:2)                      
             END-IF                                                     
           END-PERFORM.                                                 
      *                                                                 
30331A     PERFORM  3300-1-TRANS-ADDR.                                  
      *                                                                 
     A     IF       WS-MK-ADR            =  "Y"                         
     A              MOVE      SPACES           TO      WS-ADDR          
     A              MOVE      WS-ADDR-O        TO      WS-ADDR          
     A     ELSE                                                         
     C              MOVE      SIGN-0E          TO      WS-ADDR-0E       
     C              MOVE      SIGN-0F          TO      WS-ADDR-0F       
     A     END-IF.                                                      
      *                                                                 
90702A 3400-GNP-CIXSEG.                                                 
      *                                                                 
           MOVE  "021"                  TO  CICIX-KEY1.                 
           MOVE  SPACE                  TO  CICIX-KEY2.                 
           MOVE  VADOAC                 TO  CICIX-KEY2.                 
           CALL  "CBLTDLI"   USING      FUNCTION-GNP                    
                                        CIPCB                           
                                        CIXSEG                          
                                        SSA-CICIX.                      
           IF  (CI-STATUS-CODE  NOT =  GOOD-STATUS) AND                 
               (CI-STATUS-CODE  NOT =  MORE-RESOURCE-NEEDED)            
               IF  CI-STATUS-CODE  =  SEGMENT-NOT-FOUND                 
                   NEXT SENTENCE                                        
               ELSE                                                     
                   MOVE    "FAL"  TO  PROCESS-STATUS                    
                   MOVE    "FAL"  TO  PGM-STATUS                        
                   DISPLAY "######## CIS14 ########"                    
                   DISPLAY "  GNP CIXSEG ERROR !!"                      
                   DISPLAY "  KEY=" CICIX-KEY                           
                   DISPLAY "  CI-STATUS-CODE=" CI-STATUS-CODE           
                   DISPLAY "#######################"                    
               END-IF                                                   
           ELSE                                                         
90420A         IF  CIXNM = SPACE                                        
  "  A             DISPLAY " CIXSEG CIXNM = SPACE "                     
  "  A             DISPLAY " CIRSEG CIRNM =" CICIX-KEY "-" CIRNM        
  "  A         ELSE                                                     
  "  A             DISPLAY " CIXSEG CIXNM =" CICIX-KEY "-" CIXNM        
  "  A             MOVE  CIXNM      TO     WS-CIRNM                     
  "  A             ADD   1          TO     WS-CNT-CIXNM                 
  "  A         END-IF                                                   
           END-IF.                                                      
                                                                        
                                                                        
      *                                                                 
       3700-TRANS-BHI-TO-FISC.                                          
      *                                                                 
           MOVE "O"         TO  IOSYS.                                  
           MOVE CBOT-BHI    TO  LOCBRH.                                 
           MOVE SPACE       TO  RTCODE.                                 
           CALL "BRHIDCNV"  USING LINKBRH.                              
           IF  RTCODE = SPACE                                           
               MOVE IBBRH    TO  FISC-BHI                               
           ELSE                                                         
               MOVE "0567"   TO  FISC-BHI.                              
                                                                        
      ****對外無國外部或關閉之分行，以營業部替代                      
           IF  FISC-BHI = "1058" OR "1597"                              
               MOVE "0567" TO  FISC-BHI.                                
      *                                                                 
       3800-EDIT-ERR-NOTE.                                              
      *                                                                 
           IF  TRD-NOTE(1:3) = SPACE                                    
               MOVE  WS-NOTE  TO  TRD-NOTE(1:3)                         
           ELSE                                                         
           IF  TRD-NOTE(4:3) = SPACE                                    
               MOVE  WS-NOTE  TO  TRD-NOTE(4:3)                         
           ELSE                                                         
           IF  TRD-NOTE(7:3) = SPACE                                    
               MOVE  WS-NOTE  TO  TRD-NOTE(7:3).                        
      *---*                                                             
       5000-FINISH-RTN.                                                 
      *---*                                                             
      *                                                                 
30331A     DISPLAY   "    ALL1    : "    WS-ALL1.                       
     A     DISPLAY   "    ALL2    : "    WS-ALL2.                       
     A     DISPLAY   "    WRT1    : "    WS-WRT1.                       
     A     DISPLAY   "    WRT2    : "    WS-WRT2.                       
     A     DISPLAY   "    CIXNM   : "    WS-CNT-CIXNM.                  
     A     DISPLAY   "ENG CINAME  : "    WS-ENG-CINAME.                 
     A     DISPLAY   "ENG TRNAME  : "    WS-ENG-TRNAME.                 
     A     DISPLAY   "ENG TRDNAME : "    WS-ENG-TRDNAME.                
     A     DISPLAY   "ENG ADDR    : "    WS-ENG-ADDR.                   
     A     DISPLAY   "    TRAN HA : "    WS-HALF-CNT.                   
     A     DISPLAY   "    CI GE   : "    WS-CNT-GE.                     
      *                                                                 
90823C     CLOSE  IN-FILE  OUT-FILE  OUT2-FILE.                         
                                                                        
           CALL  "CBLTDLI"  USING  FUNCTION-SYNC  TPPCB                 
                                                                        
           IF  PGM-END                                                  
               DISPLAY "######## CIS14 #########"                       
               DISPLAY "     NORMAL  END  !! "                          
               DISPLAY "########################"                       
           ELSE                                                         
               MOVE    "99"  TO  RETURN-CODE                            
               DISPLAY "######## CIS14 #########"                       
               DISPLAY "      JOB  ABEND  !! "                          
               DISPLAY "########################".                      
                                                                        
