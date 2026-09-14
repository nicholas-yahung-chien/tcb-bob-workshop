      ******************************************************************
       01  TAXCOMB.                                                     
           02  TAXCOM-SIGN                         PIC X(02).           
               88  TAXCOM-SIGN-ERR                     VALUE            
                   X"E2A1" X"E2A3" X"E2A8" X"E2AA" X"E2B3" X"E2B5"      
                   X"E2B6" X"405A" X"445A" X"E2B3" X"E2A3" X"E2B2"      
                   X"E2B7" X"E2AC" X"E2AB" X"E165" X"E2AD" X"E159"      
                   X"E150" X"46E5"                                      
00111A             X"D64D" X"D6FC"                                      
                   X"D6FA" X"E282" X"E2C0" X"4949" X"E15D" X"E162".     
      *                                                                 
           02  TAXCOM-TAXB3-TAB.                                        
               03  TAXCOM-FLDA031.                                      
                   05  FILLER                         PIC X(21)  VALUE  
                       "5A-A-利息          ".                         
                   05  FILLER                         PIC X(21)  VALUE  
                       "5C-F-債券利息      ".                         
                   05  FILLER                         PIC X(21)  VALUE  
                       "50-B-薪資          ".                         
                   05  FILLER                         PIC X(21)  VALUE  
                       "54-C-股利所得      ".                         
                   05  FILLER                         PIC X(21)  VALUE  
                       "61-H-附條件利息    ".                         
                   05  FILLER                         PIC X(21)  VALUE  
                       "9B-G-費用所得      ".                         
                   05  FILLER                         PIC X(21)  VALUE  
                       "92-D-其他所得      ".                         
                   05  FILLER                         PIC X(21)  VALUE  
                       "93-E-退職所得      ".                         
                   05  FILLER                         PIC X(21)  VALUE  
                       "96-I-結構型交易    ".                         
               03  TAXCOM-FLDA031-R     REDEFINES     TAXCOM-FLDA031.   
                   05  TAXCOM-FLDA031-TAB         OCCURS   09  TIMES    
                                        ASCENDING  TAXCOM-FORM          
                                        INDEXED BY TAXCOM-CNT.          
                       10  TAXCOM-FORM                PIC X(02).        
                       10  FILLER                     PIC X(01).        
                       10  TAXCOM-FLDA031R-FG         PIC X(01).        
                       10  FILLER                     PIC X(01).        
                       10  TAXCOM-FORM-CH             PIC X(16).        
      *                                                                 
           02  TAXCOM-TYPE-AREA.                                        
               03  TAXCOM-TYPE.                                         
      *               票券                                            
                   05  FILLER                         PIC X(22)  VALUE  
                      "61A-C-附條件票券    ".                         
      *               債券                                            
                   05  FILLER                         PIC X(22)  VALUE  
                      "61B-B-附條件債券    ".                         
               03  TAXCOM-TYPE-R        REDEFINES     TAXCOM-TYPE.      
                   05  TAXCOM-TYPE-TAB         OCCURS   02  TIMES       
                                        ASCENDING  TAXCOM-TYPE-FG       
                                        INDEXED BY TAXCOM-TYC.          
                       10  TAXCOM-TYPE-FG             PIC X(03).        
                       10  FILLER                     PIC X(01).        
                       10  TAXCOM-TYPE-ACT-TY         PIC X(01).        
                       10  FILLER                     PIC X(01).        
                       10  TAXCOM-TYPE-FORM-CH        PIC X(16).        
               03  TAXCOM-TYPE-SW                     PIC X(01).        
                   88  TAXCOM-TYPE-FUND                   VALUE "Y".    
               03  TAXCOM-TYPE-CNT                    PIC 9(03).        
               03  TAXCOM-TYPE-FORM                   PIC X(02).        
                   88  TAXCOM-TYPE-FORM-OK                VALUE "61".   
      *                                                                 
      * XXRCD 排除法規年金給付專戶 存款性質別34科目765            
      *       排除法規年金給付專戶 存款性質別35科目765            
30505A     02  TAXCOM-CHK-AREA.                                         
               03  TAXCOM-CHK-XXRCD                   PIC X(02).        
                   88  TAXCOM-CHK-TAX-PASS-XXRCD          VALUE "34"    
                       "35".                                            
30731A* CIRCU 存戶性質別 自然人"0" 境外自然人"B"                  
30827A* CIRNA 身分別                                                  
           02  TAXCOM-BAVF-AREA.                                        
               03  TAXCOM-BAVF-CIRCU                  PIC X(01).        
                   88  TAXCOM-BAVF-CIRCU-OK               VALUE "0"     
                       "B".                                             
               03  TAXCOM-BAVF-CIRNA                  PIC X(01).        
                   88  TAXCOM-BAVF-CIRNA-OK               VALUE "0"     
                       "1" "2" "3" "4".                                 
                   88  TAXCOM-BAVF-CIRNA-CHINESE          VALUE "0".    
                   88  TAXCOM-BAVF-CIRNA-FOREIGNER        VALUE         
                       "1" "2" "3" "4".                                 
30919A* 處理報表雜質                                                  
           02  TAXCOM-PRT-SIGN.                                         
               03  TAXCOM-PRT-CH-SIGN                 PIC X(02).        
                   88  TAXCOM-PRT-SIGN-CH-ERR             VALUE         
                       X"426F" X"6977".                                 
               03  TAXCOM-PRT-EG-SIGN                 PIC X(02).        
                   88  TAXCOM-PRT-SIGN-EG-ERR             VALUE         
                       X"0D25".                                         
               03  TAXCOM-PRT-CHK-SIGN                PIC X(01).        
                   88  TAXCOM-PRT-SIGN-CHK-ERR            VALUE         
                       X"0D" X"25".                                     
      *                                                                 
