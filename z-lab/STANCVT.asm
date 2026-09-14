*********************************************************************** 00010000
**因應財金交易序號擴編至文數字,產生16進位交易序號(APDERF)      ** 00011002
*********************************************************************** 00011102
**JOB048828 1120904 APDERF 因應財金交易序號擴編至文數字新增         * 00011204
*********************************************************************** 00012002
STANPRM  DSECT                                                          00020000
         USING    STANPRM,3                                             00030000
OLDSTAN  DS CL7          OLD STAN-NO                                    00040000
NEWSTAN  DS CL7          NEW STAN-NO                                    00050000
RETCODE  DS CL1          RETURN CODE                                    00060000
*********************************************************************** 00070000
         PRINT  GEN                                                     00080000
STANCVT  CSECT                                                          00090001
         STM    14,11,12(13)                                            00100000
         USING  STANCVT,12                                              00110001
         LR     12,15                                                   00120000
         LA     4,SAVEAREA                                              00130000
         ST     13,SAVEAREA+4                                           00140000
         ST     4,8(13)                                                 00150000
         LA     13,SAVEAREA                                             00160000
         L      3,0(1)                                                  00170000
         SLL    3,1                                                     00180000
         SRL    3,1                                                     00190000
***********************************************************             00200000
BEGIN    EQU    *                REG7:LIT-LENGTH  REG8:NUM-LENGTH       00210000
         CLC    OLDSTAN,MAX                                             00220000
         BNE    BEGIN2                                                  00230000
         MVC    OLDSTAN,MIN                                             00240000
         B      RETURN                                                  00250000
BEGIN2   CLC    OLDSTAN(6),=C'FFFFFF'                                   00260000
         BNE    BEGIN3                                                  00270000
         TR     OLDSTAN+6(1),TABLEA                                     00280000
         B      RETURN                                                  00290000
***********************************************************             00300000
BEGIN3   SR     7,7              REG7:F DIGHIT LENGTH                   00310000
         LA     6,OLDSTAN+6                                             00320000
         LA     8,7              STAN LENGTH                            00330000
DIGLOOP  CLI    0(6),C'F'        GET LIT AND NUMERIC DIGIT LENGTH       00340000
         BE     CHKNEXT                                                 00350000
         C      7,=F'0'                                                 00360000
         BH     OVERDIG                                                 00370000
         TR     OLDSTAN+6(1),TABLEA                                     00380000
         B      RETURN                                                  00390000
CHKNEXT  S      6,=F'1'                                                 00400000
         A      7,=F'1'                                                 00410000
         BCT    8,DIGLOOP                                               00420000
***********************************************************             00430000
OVERDIG  LA     9,OLDSTAN+6                                             00440000
MV0LOOP  MVI    0(9),C'0'                                               00450000
         S      9,=F'1'                                                 00460000
         BCT    7,MV0LOOP                                               00470000
         TR     0(1,6),TABLEA                                           00480000
***********************************************************             00490000
RETURN   MVC    NEWSTAN,OLDSTAN                                         00500000
         MVC    RETCODE,C'Y'                                            00510000
         L      13,SAVEAREA+4                                           00520000
         RETURN (14,12),RC=0                                            00530000
***********************************************************             00540000
SAVEAREA DS    20F                                                      00550000
TABLEA   DC    256X'FF'                                                 00560000
         ORG   TABLEA+C'A'                                              00570000
         DC    C'BCDEF'                                                 00580000
         ORG   TABLEA+C'0'                                              00590000
         DC    C'123456789A'                                            00600000
         ORG                                                            00610000
MAX      DC    CL7'FFFFFFF'                                             00620000
MIN      DC    CL7'0000001'                                             00630000
         LTORG                                                          00640000
         END                                                            00650000
