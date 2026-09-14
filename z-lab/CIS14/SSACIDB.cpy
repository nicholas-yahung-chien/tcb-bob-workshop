 
      ******************************************************************
       01  UNQ-SSA-CICIR.                                               
           02  UNQ-CICIR                     PIC X(8)  VALUE "CIRSEG  ".
           02  FILLER                        PIC X     VALUE SPACE.     
       01  UNQ-SSA-CICSD.                                               
           02  UNQ-CICSD                     PIC X(8)  VALUE "CSDSEG  ".
           02  FILLER                        PIC X     VALUE SPACE.     
       01  UNQ-SSA-CIRAD.                                               
           02  UNQ-CIRAD                     PIC X(8)  VALUE "RADSEG  ".
           02  FILLER                        PIC X     VALUE SPACE.     
       01  UNQ-SSA-CICTB.                                               
           02  UNQ-CICTB                     PIC X(8)  VALUE "CTBSEG  ".
           02  FILLER                        PIC X     VALUE SPACE.     
       01  UNQ-SSA-CICIA.                                               
           02  UNQ-CICIA                     PIC X(8)  VALUE "CIASEG  ".
           02  FILLER                        PIC X     VALUE SPACE.     
       01  UNQ-SSA-CICIU.                                               
           02  UNQ-CICIU                     PIC X(8)  VALUE "CIUSEG  ".
           02  FILLER                        PIC X     VALUE SPACE.     
       01  UNQ-SSA-CICIX.                                               
           02  UNQ-CICIX                     PIC X(8)  VALUE "CIXSEG  ".
           02  FILLER                        PIC X     VALUE SPACE.     
       01  UNQ-SSA-CICIY.                                               
           02  UNQ-CICIY                     PIC X(8)  VALUE "CIYSEG  ".
           02  FILLER                        PIC X     VALUE SPACE.     
       01  UNQ-SSA-CICIA-L.                                             
           02  FILLER                        PIC X(8)  VALUE "CIASEG  ".
           02  FILLER                        PIC X     VALUE "*".       
           02  FILLER                        PIC X     VALUE "L".       
           02  FILLER                        PIC X     VALUE SPACE.     
       01  SSA-CICIR.                                                   
           02  FILLER                        PIC X(8)  VALUE "CIRSEG  ".
           02  FILLER                        PIC X     VALUE "(".       
           02  FILLER                        PIC X(8)  VALUE "CIRID   ".
           02  FILLER                        PIC XX    VALUE " =".      
           02  CICIR-KEY                     PIC X(10) VALUE SPACE.     
           02  FILLER                        PIC X     VALUE ")".       
       01  SSA-CICSD.                                                   
           02  FILLER                        PIC X(8)  VALUE "CSDSEG  ".
           02  FILLER                        PIC X     VALUE "(".       
           02  FILLER                        PIC X(8)  VALUE "CICBG   ".
           02  FILLER                        PIC XX    VALUE " =".      
80815C     02  CICSD-KEY                     PIC X(7)  VALUE SPACE.     
           02  FILLER                        PIC X     VALUE ")".       
       01  SSA-CIRAD.                                                   
           02  FILLER                        PIC X(8)  VALUE "RADSEG  ".
           02  FILLER                        PIC X     VALUE "(".       
           02  FILLER                        PIC X(8)  VALUE "CIEAN   ".
           02  FILLER                        PIC XX    VALUE " =".      
           02  CIRAD-KEY                     PIC X(13) VALUE SPACE.     
           02  FILLER                        PIC X     VALUE ")".       
       01  SSA-CICTB.                                                   
           02  FILLER                        PIC X(8)  VALUE "CTBSEG  ".
           02  FILLER                        PIC X     VALUE "(".       
           02  FILLER                        PIC X(8)  VALUE "CIOAN   ".
           02  FILLER                        PIC XX    VALUE " =".      
           02  CICTB-KEY                     PIC X(13) VALUE SPACE.     
           02  FILLER                        PIC X     VALUE ")".       
       01  SSA-CICIA.                                                   
           02  FILLER                        PIC X(8)  VALUE "CIASEG  ".
           02  FILLER                        PIC X     VALUE "(".       
           02  FILLER                        PIC X(8)  VALUE "CIAKY   ".
           02  FILLER                        PIC XX    VALUE " =".      
80711C     02  CICIA-KEY                     PIC X(7)  VALUE SPACE.     
           02  FILLER                        PIC X     VALUE ")".       
       01  SSA-CICIU.                                                   
           02  FILLER                        PIC X(8)  VALUE "CIUSEG  ".
           02  FILLER                        PIC X     VALUE "(".       
01121C*    02  FILLER                        PIC X(8)  VALUE "CIUKY   ".
           02  FILLER                        PIC X(8)  VALUE "CIUDD   ".
           02  FILLER                        PIC XX    VALUE " =".      
80711C     02  CICIU-KEY                     PIC X(7)  VALUE SPACE.     
           02  FILLER                        PIC X     VALUE ")".       
01121A 01  SSA-CIUCC.                                                   
  "  A     02  FILLER                        PIC X(8)  VALUE "CIUSEG  ".
  "  A     02  FILLER                        PIC X     VALUE "(".       
  "  A     02  FILLER                        PIC X(8)  VALUE "CIUCC   ".
  "  A     02  FILLER                        PIC XX    VALUE " =".      
  "  A     02  CIUCC-NO                      PIC X(2)  VALUE SPACE.     
01121A     02  FILLER                        PIC X     VALUE ")".       
01121A 01  SSA-CIUBH.                                                   
  "  A     02  FILLER                        PIC X(8)  VALUE "CIUSEG  ".
  "  A     02  FILLER                        PIC X     VALUE "(".       
  "  A     02  FILLER                        PIC X(8)  VALUE "CIUBH   ".
  "  A     02  FILLER                        PIC XX    VALUE " =".      
  "  A     02  CIUBH-NO                      PIC X(4)  VALUE SPACE.     
01121A     02  FILLER                        PIC X     VALUE ")".       
       01  SSA-CICIX.                                                   
           02  FILLER                        PIC X(8)  VALUE "CIXSEG  ".
           02  FILLER                        PIC X     VALUE "(".       
           02  FILLER                        PIC X(8)  VALUE "CIXKY   ".
           02  FILLER                        PIC XX    VALUE " =".      
           02  CICIX-KEY.                                               
               03  CICIX-KEY1                PIC X(3)  VALUE SPACE.     
               03  CICIX-KEY2                PIC X(22) VALUE SPACE.     
           02  FILLER                        PIC X     VALUE ")".       
80926A 01  SSA-CICIX-GT.                                                
     A     02  FILLER                        PIC X(8)  VALUE "CIXSEG  ".
     A     02  FILLER                        PIC X     VALUE "(".       
     A     02  FILLER                        PIC X(8)  VALUE "CIXKY   ".
     A     02  FILLER                        PIC XX    VALUE ">=".      
     A     02  CICIX-KEY-GT.                                            
     A         03  CICIX-KEY1-GT             PIC X(3)  VALUE SPACE.     
     A         03  CICIX-KEY2-GT             PIC X(22) VALUE SPACE.     
80926A     02  FILLER                        PIC X     VALUE ")".       
21019A 01  SSA-CIXK1.                                                   
  "  A     02  FILLER                        PIC X(8)  VALUE "CIXSEG  ".
  "  A     02  FILLER                        PIC X     VALUE "(".       
  "  A     02  FILLER                        PIC X(8)  VALUE "CIXK1   ".
  "  A     02  FILLER                        PIC XX    VALUE " =".      
  "  A     02  CIXK1                         PIC X(3)  VALUE SPACE.     
21019A     02  FILLER                        PIC X     VALUE ")".       
       01  SSA-CICIY.                                                   
           02  FILLER                        PIC X(8)  VALUE "CIYSEG  ".
           02  FILLER                        PIC X     VALUE "(".       
           02  FILLER                        PIC X(8)  VALUE "CIYKY   ".
           02  FILLER                        PIC XX    VALUE " =".      
30623C*    02  CICIY-KEY.                                               
  "  C*        03  CICIY-KEY1                PIC X(3)  VALUE SPACE.     
  "  C*        03  CICIY-KEY2                PIC X(32) VALUE SPACE.     
30623C     02  CICIY-KEY                     PIC X(11) VALUE SPACES.    
           02  FILLER                        PIC X     VALUE ")".       
