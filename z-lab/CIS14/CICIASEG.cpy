      ***************************************************************   
       01  CIASEG.                                                      
80711C     02  LL                      PIC 999         COMP VALUE 260.  
80711C     02  CIAKY                   PIC X(7)        JUST RIGHT       
80711C                                                 VALUE "0000000". 
           02  CIAAD.                                                   
               04  CIAAD1              PIC X(5)        VALUE SPACE.     
               04  CIAAD2              PIC X(105)      VALUE SPACE.     
           02  CIACD.                                                   
               04  CIACD1              PIC X(5)        VALUE SPACE.     
               04  CIACD2              PIC X(105)      VALUE SPACE.     
      *--- APSHC 83/10/18 MODIFY START                                  
           02  CIANM                   PIC X(18)       VALUE SPACE.     
50409A     02  CIAHMS                  PIC X(06)       VALUE SPACE.     
50409C     02  FILLER                  PIC X(07)       VALUE SPACE.     
      *--- APSHC 83/10/18 MODIFY END                                    
