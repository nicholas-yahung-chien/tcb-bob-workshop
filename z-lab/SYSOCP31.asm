         PRINT  OFF                                                     00000100
         COPY   IBBAR                                                   00000200
         COPY   IBTPPCB                                                 00000300
         COPY   IBIOPCB                                                 00000400
         COPY   IBDBPCB                                                 00000500
         COPY   ASMMSP                FOR IMS V8                        00000600
         PRINT  ON                                                      00000700
         COPY   IBDSECT                                                 00000800
SYSOCP31 CSECT                                                          00000900
         USING  SYSOCP31,PG1BAR,PG2BAR,IOCBAR   971027 CHNG             00001000
         SAVE   (14,12)                                                 00001100
         LR     PG1BAR,ENTBAR                                           00001200
         LA     PG2BAR,2048(PG1BAR)                                     00001300
         LA     PG2BAR,2048(PG2BAR)                                     00001400
         LA     IOCBAR,2048(PG2BAR)     971027 ADD                      00001500
         LA     IOCBAR,2048(IOCBAR)     971027 ADD                      00001600
         ST     SVEBAR,SAVEAREA+4                                       00001700
         LR     WKABAR,SVEBAR                                           00001800
         LA     SVEBAR,SAVEAREA                                         00001900
         ST     SVEBAR,8(WKABAR)                                        00002000
         L      TC1BAR,0(PAMBAR)                                        00002100
         SLL    TC1BAR,1                                                00002200
         SRL    TC1BAR,1                                                00002300
         LA     TC2BAR,2048(TC1BAR)                                     00002400
         LA     TC2BAR,2048(TC2BAR)                                     00002500
*                                                                       00002600
         L      WKABAR,ATWATFR                                          00002700
         MVC    0(8,WKABAR),=CL8'SYSOCP31'                              00002800
         LA     WKABAR,8(WKABAR)                                        00002900
         ST     WKABAR,ATWATFR                                          00003000
*                                                                       00003100
         MVC    DWARTC,RTCNML                                           00003200
         MVC    WSLTRM(8),BLANKS       1140307 ADD                      00003300
         MVC    EAITXSW,RTCNML         1140502 ADD                      00003400
*                                                                       00003500
         IF    (CLC,TWATIA+4(8),EQ,=CL8'IBPBMCRD'),ANDIF,              Z00005300
               (CLC,TWATIA+13(8),EQ,=C'0210OPEN'),ANDIF,               Z00005400
               (CLC,TMACCP,EQ,VALUE2)       OUT-BOUND 1100122/1140307-C 00005500
         ELSE                               1100122 ADD                 00005600
                BAL   BALBAR,OCPMSG         PROCESS OUTPUT MESSAGE      00005700
*                                                                       00005800
                BAL   BALBAR,OCPRTN         PROCESS OUTPUT RTN          00005900
         ENDIF                              1100122 ADD                 00006000
*                                                                       00006100
***  76/08/15  APTRS FOR RMT                                            00006200
         IF     (CLC,DWARBKF,EQ,DATAYES)                                00006300
                BAL    BALBAR,OCPEHP   ERROR HANDLING                   00006400
         ENDIF                                                          00006500
***  76/08/15  APTRS FOR RMT                                            00006600
*                                                                       00006700
         IF     (CLC,DWAETY,EQ,VALUETP)  990525 ADD/1140307 CHNG        00006800
            IF (CLC,TWATIA+13(2),NE,=C'T4'),ANDIF,                     Z00006900
               (CLC,TWATIA+13(2),NE,=C'T9'),ANDIF,                     Z00007000
               (CLC,TWATIA+13(2),NE,=C'TF'),ANDIF,                     Z00007100
               (CLC,DWASLT(5),NE,FISGLTMI),ANDIF,                      Z00007200
               (CLC,DWASLT,NE,ITAP1420),ANDIF,                         Z00007300
               (CLC,TWATIA+13(2),NE,=C'RM')  1010430 FOR OPC-4102 CHG   00007400
                BAL    BALBAR,SENDERR  SEND ERROR MSG TO TERMINAL       00007500
            ENDIF                                                       00007600
         ENDIF                                                          00007700
*                                                                       00007800
         L      SVEBAR,SAVEAREA+4                                       00007900
         RETURN (14,12)                                                 00008000
*                                                                       00008100
OCPMSG   EQU    *                                                       00008200
*    WKABAR : OUTMSG BEGIN ADDRESS                                      00008300
*    WKBBAR : OUTMSG TEXT  ADDRESS                                      00008400
*    WKCBAR : COUNTER                                                   00008500
         ST     BALBAR,OCPMSGA                                          00008600
*                                                                       00008700
         XR     WKCBAR,WKCBAR          CLEAR COUNTER                    00008800
         L      WKABAR,AOUTMSG         FIRST OUTMSG ADDRESS             00008900
*                                                                       00009000
         DO     UNTIL=(CH,WKCBAR,EQ,=H'2')                              00009100
                IF  (CLC,0(1,WKABAR),EQ,DATAYES)                        00009200
                    LA   WKBBAR,9(WKABAR)  GET MSG TEXT ADDRESS         00009300
                    BAL  BALBAR,PUTMSG                                  00009400
                ENDIF                                                   00009500
                LA  WKCBAR,1(WKCBAR)        COUNTER = COUNTER + 1       00009600
                LA  WKABAR,521(WKABAR)      NEXT OUTMSG ADDRESS         00009700
         ENDDO                                                          00009800
*** CLEAR OUTMSG   ( REUSABLE )                                         00009900
         L      WKABAR,AOUTMSG                                          00010000
         LM     WKBBAR,WKDBAR,=A(1042,BLANK,1)                          00010100
         ICM    WKDBAR,8,BLANK                                          00010200
         MVCL   WKABAR,WKCBAR                                           00010300
*                                                                       00010400
         L      BALBAR,OCPMSGA                                          00010500
         BR     BALBAR                                                  00010600
*                                                                       00010700
***  PUT MSG TO OUTPUT BUFFER                                           00010800
PUTMSG   EQU     *                                                      00010900
         ST     BALBAR,PUTMSGA                                          00011000
*                                                                       00011100
         MVC    WSLTRM(8),1(WKABAR)         OUTPUT LTERM NAME           00011200
*                                                                       00011300
*        WANT TO SEND MSG TO FISC(交易訊息要送至財金)                 00011400
*        006R有自己的換KEY交易/ 006A-FEP-ATM有自己的換KEY交易   00011500
*       跨行線路切FISCGW後,ITGK腳位剩下F000000I/O及F000009I/O   00011600
         IF    (CLC,WSLTRM(6),EQ,FISGLTMI) 1100122 CHNG  (=F0000**)     00011700
                BAL    BALBAR,SYNCGEN       GENERATE SYNC               00011800
*1140430        2252交易配合ATM-FEP改由006A收送修改       *       00012000
                IF    (CLC,ATRTAPPL,EQ,IBRMT01),ANDIF,                 Z00012200
               (CLC,ATRPCOD,NE,=C'2252')    1140430 ADD                 00012300
                       IF   (CLC,ATRTFLOW,EQ,IBRO),ORIF,               Z00012400
               (CLC,ATRTFLOW,EQ,IBCO),ORIF,                            Z00012500
               (CLC,ATRTFLOW,EQ,INQO)                                   00012600
                             MVC   WSLTRM,FISGLTM9  =F000009O RT-OUT    00012700
                       ELSE                                             00012800
                             MVC   WSLTRM,FISGLTMO  =F000000O IN-RSP    00012900
                       ENDIF                                            00013000
                ELSE                                                    00013100
                IF    (CLC,ATRTAPPL,EQ,IBSTM)                           00013200
                       IF  (CLC,FISCGWFG,EQ,VALUEI) TO ITGK 1140307     00013300
                            MVC   WSLTRM,FISGLTM8     F000008O          00013400
                       ELSE                                             00013500
*              財金建議清算交易均送006R (除5202交易外)            00013600
                       IF  (CLC,ATRPCOD,EQ,=C'5202') 1140307 ADD        00013700
                            BAL   BALBAR,CLINTSET SET FEP CLIENT-ID     00013800
                       ELSE                      1140307                00013900
**                          MVC   WSLTRM,FISGLTM9 F000009O 1140307 ADD  00014000
                            MVC   WSLTRM,FISGLTMO  =F000000O IN-RSP     00014100
                       ENDIF                     1140307 ADD            00014200
                       ENDIF                     1140307 ADD            00014300
                ELSE   OPC/ATM                                          00014400
                IF    (CLC,ATRTAPPL,EQ,IBLOC),ORIF,                    Z00014600
               (CLC,ATRPCOD(1),EQ,VALUE3)        1140307 ADD 3xxx/0xxx  00014700
*1140307        OPC CHANGE KEY/ 3101通匯簽到/3111-WAKEUP均走ITGK    00014900
                       IF   (CLC,FISCGWFG,EQ,VALUEI),ORIF,             Z00015000
               (CLC,ATRPCOD(1),EQ,VALUE0),ORIF,                        Z00015100
               (CLC,ATRPCOD,EQ,=C'3101'),ORIF,                         Z00015200
               (CLC,ATRPCOD,EQ,=C'3111'),ORIF,                         Z00015300
               (CLC,DWASLT(6),EQ,FISGLTMI)  0XXX或來自ITGK (F00000?I) 00015400
                             MVC   WSLTRM,FISGLTM9  =F000009O           00015500
                       ELSE  06003100/3106/3107 NOTICE/CHECK IN/OUT     00015600
*          匯款簽到交易走ITGK;3100/3106/3107/3109 1130906依業務分流 00015700
*           3100-4102 ('T4AC')金融帳務查詢屬24小時交易走FEP-FISCGW  00015800
*3.1           3106/3107/3109依查詢業務分別走ITGK OR FISCGW           00015900
*3.2           3100/3106/3107/3109 APID=2XXX/7300 --> FISCGW (006A)     00016000
                       IF   (CLC,ATRPCOD(3),EQ,=C'310'),ANDIF,         Z00016300
               (CLC,DWASLT(4),NE,ATMTXLU),ANDIF,                       Z00016400
               (CLC,CTLINID(1),NE,VALUE2),ANDIF,                       Z00016500
               (CLC,CTLINID(1),NE,VALUE4),ANDIF,                       Z00016600
               (CLC,CTLINID(2),NE,=C'73')   2X00/7300/3100走FISCGW    00016700
                             MVC   WSLTRM,FISGLTM9    F000009O 1140307  00016800
                       ELSE  1140307 ADD                                00016900
                             BAL   BALBAR,CLINTSET    SET FEP CLIENT-ID 00017000
                       ENDIF 1140307 ADD                                00017100
                       ENDIF                                            00017200
                ELSE   ATM-TRAN                                         00017300
                       BAL   BALBAR,CLINTSET     SET FEP CLIENT-ID      00017600
                ENDIF  \x8dAPPL=LOC\xd9                1140307 MOVE           00018100
*                                                                       00018200
                ENDIF  \x8dAPPL=STM\xd9                1140307 MOVE           00018300
                ENDIF  \x8dAPPL=IBRMT\xd9              1140307 MOVE           00018400
         ENDIF  \x8d=F0000**\xd9                                              00018500
*                                                                       00018600
         IF    (CLC,WSLTRM(6),EQ,CBCLTRM)   1040326 CHNG BY APJADE      00018800
               MVC    WSLTRM,INGSPA02       1140307 CHNG                00019200
         ENDIF                                                          00019400
*                                                                       00019600
         IF    (CLC,TWATIA+4(8),EQ,IBPBMEAI),ANDIF,                    Z00019900
               (CLC,TWATIA+13(4),EQ,=CL4'MKEY'),ANDIF,                 Z00020000
               (CLC,TWATIA+28(3),EQ,=CL3'VTM')                          00020100
                MVC    WSLTRM(8),VMTPIPE0        VMTPIPE0               00020200
         ENDIF                                                          00020300
         IF    (CLC,TWATIA+4(8),EQ,IBPOS),ANDIF,                       Z00020400
               (CLC,TWATIA+13(5),EQ,=CL5'IC310'),ANDIF,                Z00020500
               (CLC,TWATIA+19(1),EQ,VALUE5)      1140307 CHNG           00020600
                MVC    WSLTRM(8),VMTPIPE0        VMTPIPE0               00020700
         ENDIF                                                          00020800
*1080919 UPPER ADD BY APSNOW FOR VTM-USE                                00020900
*                                                                       00021000
         MVC    OUTAREA(256),0(WKBBAR)           OUTPUT DATA 1          00021100
         MVC    OUTAREA+256(256),256(WKBBAR)     OUTPUT DATA 2          00021200
*                                                                       00021300
         IF    (CLC,DWARENQ(1),NE,DATAYES)  830108 APHCC/1100122 CHNG   00021400
                BAL    BALBAR,ISRTLOG                                   00021500
         ENDIF                                                          00021600
***  TRANSLATE FROM EBCDIC TO ASCII                                     00021700
         IF    (CLC,WSLTRM(6),EQ,FISGLTRM)  1040326 CHNG BY APJADE      00021800
            IF  (CLC,ATRTAPPL,EQ,IBRMT01),ANDIF,                       Z00022100
               (CLC,ATRPCOD,NE,=C'2252')    1140430 ADD                 00022200
                BAL    BALBAR,CODECNV       CODE CONVERSION             00022500
            ENDIF                                                       00022600
         ENDIF                              1010430 ADD BY APJADE       00022700
         IF     (CLC,WSLTRM,EQ,INGSPA02)    1140307                     00023100
                BAL    BALBAR,CODECNV       CODE CONVERSION             00023300
         ENDIF                                                          00023400
         IF     (CLC,WSLTRM(8),EQ,IBBMP)                                00023600
                BAL    BALBAR,ENQBMP        ENQUE IBBMP000              00023700
         ELSE                                                           00023800
                BAL    BALBAR,ISRTMSG                                   00023900
         ENDIF                                                          00024000
*                                                                       00024100
         L      BALBAR,PUTMSGA                                          00024200
         BR     BALBAR                                                  00024300
*                                                                       00024400
*BELOW 1140307 ADD FOR FEP-CLIENT-ID SET(透過FISGGW/IMSGW TO FISG)    00029200
*              決定是否透過FEP的FISGGW/IMSGW SEND MSG TO FISC       00029300
CLINTSET EQU    *  SET FEP CLIENT-ID   SEND TXNMSG TO FISCGW            00029400
         ST     BALBAR,OCPEHPA                   1140307 ADD            00029500
*                                                                       00029600
*1140307規劃IFEPPCXX/IFEPPDXX作為FEP-ATM備用CLIENT-ID (PROD)      00029700
         IF    (CLC,DWASLT(4),EQ,ATMTXLU)        1140307 (FROM ATM)     00029800
                MVC   FEPTRMFG(1),DWASLT+5                              00029900
         ELSE   OPC/STM/VO.../EAI                                       00030000
         IF    (CLC,CLINTSW,NE,DATAYES)          1140501 FOR EAI ADD    00030200
                MVC   FEPTRMFG(1),VALUEA         1140307 (DEFAULT A)    00030300
         ELSE                                            IFEPPAXX       00030400
                MVC   FEPTRMFG(1),VALUEC         1140501 FOR EAI ADD    00030500
         ENDIF                                           IFEPPCXX       00030600
         ENDIF                                   1140501 FOR EAI ADD    00030700
*                                                                       00030800
*BELOW設定要發送財金交易之CLIENT-ID起始值                           00030900
*              IFEPXX31 ~ IFEPXX38    第三期電文走非同步TO IMSGW      00031000
*INBOUND IF    (CLC,DWASLT(4),EQ,FEPIBA3I),ANDIF,  IFEPPA3N/IFEPPC3N  Z 00031100
         IF    (CLC,DWASLT(4),EQ,FEPIBA3I),ANDIF,                      Z00031200
               (CLC,DWASLT+6(1),EQ,VALUE3),ANDIF,                      Z00031300
               (CLC,ATRPCOD,NE,=C'2130')  IN-BND 1140307 ADD IFEPTA3X   00031400
*              財金發送交易GARBLE通知                               00031500
                IF   (CLC,7(4,WKBBAR),EQ,=CL4'0699') 1140307 GARBLE TXN 00031600
                      MVC  WSLTRM,FEPLTM5A       1140307 ADD =IFEPTA5X  00031700
                ELSE                             1140307 ADD            00031800
                      MVC  WSLTRM,DWASLT         1140307 ADD =IFEPTA3X  00031900
                ENDIF                            1140307 ADD            00032000
         ELSE   ATM/06003100 NOTICE REQ/RSP      OUT-BOUND TXN          00032100
         IF    (CLC,DWASLT(4),EQ,FEPLTM5A),ANDIF,                      Z00032200
               (CLC,DWASLT+6(1),EQ,VALUE5)   ATM IFEPPX5X OUTBND-RSP    00032300
                MVC   WSLTRM,DWASLT              1140307 ADD =IFEPTA3X  00032400
         ELSE   ATM/06003100 NOTICE REQ/RSP                             00032500
                MVC   WSLTRM,FEPLTM5A            1140307 ADD =IFEPPA5X  00032600
         ENDIF                                                          00032700
         ENDIF                                   1140307 ADD            00032800
*UPPER設定要發送財金交易之CLIENT-ID起始值                           00032900
*                                                                       00033000
*1140307 BELOW ADD  STM-TX FLOW=IB2W                                    00033100
*        ACQ-TX設定CLIENT-ID SET (IFEPXA51~IFEPXA58)                  00033300
*        ACQ-TX IFEPXX51 ~ IFEPXX58第三期電文走非同步TO IMSGW         00033400
*        WKSTANKY: REGION-FG,作為下送財金CLIENT-ID之起算,後續累加 00033500
         IF    (CLC,WKSTANKY(1),EQ,BLANK),ORIF,                        Z00033600
               (CLC,ATSTANKY(1),EQ,BLANK)        1140307 CHNG           00033700
                IF   (CLC,ATSTANKY(1),NE,BLANK)                         00033800
                      MVC   WKSTANKY,ATSTANKY    1140307 ADD            00033900
                ELSE                                                    00034000
                      MVC   ATSTANKY,VALUE1      1140307 ADD            00034100
                      MVC   WKSTANKY,ATSTANKY    1140307 ADD            00034200
                ENDIF                            1140307 ADD            00034300
         ENDIF                                   1140307 ADD            00034400
*                                                                       00034500
         IF    (CLC,DWASLT(7),NE,FEPIBA3I),ANDIF,                      Z00034600
               (CLC,DWASLT(7),NE,FEPIBC3I)       1140307-OUTBND/RSP     00034700
*LCRCLTID=Y:有開CLIENT-ID=IFEPPCXX/IFEPPDXX備援外圍跨行以此送財金 00034800
                IF   (CLC,DWASLT(4),NE,FEPLTM5A) 1140501 FROM外圍跨行 00034900
                      MVC   EAITXSW,DATAYES      1140502 ADD EAI-TXN    00035100
                      PACK  PK2(2),WKSTANKY      1140307 ADD            00035200
                      AP    PK2,P1               1140307 ADD            00035300
                      UNPK  UNPK2(2),PK2(2)      1140307 ADD            00035400
                      OI    UNPK2+1,X'F0'                               00035500
                      MVC   WKSTANKY,UNPK2+1                            00035600
                      IF   (CLC,WKSTANKY,GT,VALUE8)   1140307 ADD       00035700
                            MVC  WKSTANKY,VALUE1                        00035800
                      ENDIF                      1140307 ADD            00035900
*                                                                       00036100
                      MVC   FEPLTM5A+7(1),WKSTANKY    1140307 ADD       00036200
                      MVC   WSLTRM,FEPLTM5A      =IFEPXA51              00036300
                ENDIF                1140426 ADD 1140501 FROM EAI/STM   00036400
         ENDIF                                   1140307                00036500
*              FROM FISG                                                00036600
*1140429 BELOW FROM ATM(IFEPPA2N/IFEPPC2N)則送財金IFEPPX5N(尾數同)  00036700
         IF    (CLC,DWASLT(4),EQ,FEPLTM5A)  1140429 ADD FROM ATM/FISG   00036800
                MVC   WSLTRM+7(1),DWASLT+7       1140429 ADD =IFEPTA5N  00036900
         ELSE   \x8dFROM EAI/...\xd9                   1140429 ADD            00037000
*1140501 BELOW 外圍跨行交易送財金之CLIENT-ID設定IFEPPD5?            00037100
*       若有開CLIENT-ID=IFEPPCXX/IFEPPDXX備援,外圍跨行以此送財金  00037200
         IF    (CLC,DWASLT(4),NE,FEPLTM5A),ANDIF,                      Z00037300
               (CLC,CLINTSW(1),EQ,DATAYES)  1140501 =Y CLIENT-CD備援  00037400
                MVC   WSLTRM+5(1),VALUED         1140501 ADD            00037500
         ENDIF \x8dDWASLT<>FEPLTM5A/CLINTSW=Y\xd9      1140501 ADD            00037600
         ENDIF \x8dDWASLT= FEPLTM5A\xd9                1140501 ADD            00037700
*1140501 UPPER 外圍跨行交易送財金之CLIENT-ID設定IFEPPD5?            00037800
*                                                                       00037900
         IF    (CLC,FEPTRMFG(1),EQ,VALUEA)       1140307 ADD            00038000
                MVC   WSLTRM+5(1),VALUEB         1140307 ADD            00038100
         ELSE                                    1140307 ADD            00038200
                MVC   WSLTRM+5(1),VALUED         1140307 ADD            00038300
         ENDIF                                   1140307 ADD            00038400
*                                                                       00038500
*BELOW 1140502以FEPAPID(LCRFEPSW)為FEP SERVER停機以換版之SWITCH*  00038600
*LCRFEPSW=1 FEPAP1P-1,3,5,7暫停機/LCRFEPSW=2 FEPAP2P-2,4,6,8暫停機* 00038700
*       檢核尾數是奇數還是偶數,以判斷將要停哪一台FEPAP SRVR換版   00038800
         IF    (CLC,EAITXSW,EQ,DATAYES)     1140502 ADD EAI-TXN         00038900
                IF   (CLC,FEPAPID,EQ,VALUE1),ORIF,                     Z00039000
               (CLC,FEPAPID,EQ,VALUE2)      1140502 ADD                 00039100
                      BAL  BALBAR,SWHCLINT  1140502 SWITCH CLIENT-ID    00039200
                ENDIF                       1140502 ADD                 00039300
         ENDIF                              1140502 ADD                 00039400
*UPPER 1140502以FEPAPID(LCRFEPSW)為FEP SERVER停機以換版之SWITCH*  00039500
*                                                                       00039600
         L      BALBAR,OCPEHPA            1140307 ADD                   00039700
         BR     BALBAR                                                  00039800
*UPPER 1140307 ADD FOR ITGK --> FISCGW, & ATM OLD-SPEC                  00039900
*UPPER 1140307 ADD FOR FEP-CLIENT-ID SET(透過FISGGW/IMSGW TO FISG)    00040000
*                                                                       00040100
SYNCGEN  EQU   *       GENERATE SYNC. CHECK ITEM                        00040200
         ST     BALBAR,SYNCGENA                                         00040300
*                                                                       00040400
         IF     (CLC,ATRTAPPL,EQ,IBLOC)                                 00040500
                MVC    TXT5740(16),LCRFO3KY   OPC 3-DES MAC-KEY (LCR)   00040600
         ELSE                                                           00040800
         IF    (CLC,ATRTAPPL(5),EQ,IBPBM),ORIF,                        Z00041000
               (CLC,ATRTAPPL(8),EQ,IBCDMN),ORIF,                       Z00041100
               (CLC,ATRTAPPL(5),EQ,IBAMT7)  1050901 CHNG 1100122-IBCDM  00041200
                MVC    TXT5740(16),MAC3KYF       PBM MAC-KEY (ATR)      00041300
         ELSE                                                           00041400
         IF     (CLC,ATRTAPPL(7),EQ,=CL7'IBVOICE')  890927 EALSF        00041800
                MVC    TXT5740(16),MAC3KYF       VOICE MAC-KEY          00041900
         ELSE                                                           00042000
         IF     (CLC,ATRTAPPL,EQ,IBSTM)                                 00042100
                MVC    TXT5740(16),LCRFR3KY RMT 3-DES MAC-KEY (LCR)     00042200
         ENDIF         ENDIF-IBSTM                                      00042300
         ENDIF         ENDIF-IBVOICE                                    00042400
         ENDIF         ENDIF-IBPBM                                      00042600
         ENDIF         ENDIF-IBLOC                                      00042700
*                                                                       00042800
         IF    (CLC,OPCAMTYP(8),EQ,=CL8'08100103'),ORIF,               Z00042900
               (CLC,OPCAMTYP(8),EQ,=CL8'08100105')                      00043000
                MVC    OPCASYNC(4),=XL4'00000000'                       00043100
         ELSE                                                           00043200
         IF    (CLC,ATRTAPPL,NE,IBRMT01),ANDIF,                        Z00043400
               (CLC,ATRTAPPL,NE,IBBYPASS)      1140307                  00043500
                COPY   FGSGEN1                                          00043800
                MVC    OPCASYNC(4),TXT5740    ( FGOASYNC = OPCASYNC )   00043900
         ENDIF                                                          00044000
         ENDIF                                                          00044100
*                                                                       00044200
         L      BALBAR,SYNCGENA                                         00044300
         BR     BALBAR                                                  00044400
*                                                                       00044500
CODECNV  EQU   *       CODE CONVERSION                                  00044600
         ST     BALBAR,CODECNVA                                         00044700
*                                                                       00044800
         MVC    CODEDATA(256),OUTAREA                                   00044900
         MVC    CODEDATA+256(256),OUTAREA+256                           00045000
         IF     (CLC,WSLTRM,EQ,INGSPA02)    1140307 CHNG                00045400
                CALL   GBCODEA,CODELINK,VL       EBCDIC --> ASCII       00045600
         ELSE                                                           00045700
                CALL   SYSCODEA,CODELINK,VL      EBCDIC --> ASCII       00046200
         ENDIF                                                          00046400
*******************                                                     00046500
         MVC    OUTAREA(256),CODEDATA                                   00046600
         MVC    OUTAREA+256(256),CODEDATA+256                           00046700
*                                                                       00046800
         L      BALBAR,CODECNVA                                         00046900
         BR     BALBAR                                                  00047000
*                                                                       00047100
OCPRTN   EQU     *          PROCESS OUTRTN                              00047200
         ST     BALBAR,OCPRTNA                                          00047300
         XR     WKCBAR,WKCBAR           CLEAR COUNTER                   00047400
         L      WKABAR,AOUTRTN       FIRST OUTPUT RTN ADDRESS           00047500
*                                                                       00047600
         DO     UNTIL=(CH,WKCBAR,EQ,=H'4')                              00047700
                IF  (CLC,0(1,WKABAR),EQ,DATAYES)  FLAG ON               00047800
                    MVC    DWADLT(8),1(WKABAR)    GET OUTPUT LTRM       00047900
                    MVC    DWAFRN(8),9(WKABAR)    GET FORMAT RTN NAME   00048000
                    ST     WKABAR,TEMPABAR        SAVE WKABAR           00048100
                    ST     WKCBAR,TEMPCBAR        SAVE WKCBAR           00048200
                    BAL    BALBAR,FMTOUT          FORMAT OUTPUT DATA    00048300
                    IF     (CLC,DWARTC,EQ,RTCNML)                       00048400
                           BAL    BALBAR,OCPMSG   OUTPUT MSG            00048500
                    ENDIF                                               00048600
                    L      WKABAR,TEMPABAR        RESTORE WKABAR        00048700
                    L      WKCBAR,TEMPCBAR        RESTORE WKBBAR        00048800
                ENDIF                                                   00048900
                LA  WKCBAR,1(WKCBAR)       COUNTER = COUNTER + 1        00049000
                LA  WKABAR,17(WKABAR)      NEXT OUTRTN ADDRESS          00049100
         ENDDO                                                          00049200
*                                                                       00049300
         L      BALBAR,OCPRTNA                                          00049400
         BR     BALBAR                                                  00049500
*                                                                       00049600
FMTOUT   EQU     *      USE FORMAT ROUTINE TO FORMAT OUTPUT DATA        00049700
         ST     BALBAR,FMTOUTA                                          00049800
*                                                                       00049900
         BAL    BALBAR,DYLOAD           LOADING FORMATTING PGM          00050000
         IF     (CLC,DWARTC,EQ,RTCNML)                                  00050100
                MVC    TCAADDR,AIBCSECT         IBDSECT ADDRESS         00050200
                MVI    TCAADDR,X'80'                                    00050300
                LA     PAMBAR,PARMLIST         ENTBAR : REG 1           00050400
                L      ENTBAR,DYLADDR          PAMBAR : REG 15          00050500
                CALL   (15)             CALL I/O PROGRAM :IOCPXXXX      00050600
         ENDIF                                                          00050700
*                                                                       00050800
         L      BALBAR,FMTOUTA                                          00050900
         BR     BALBAR                                                  00051000
*                                                                       00051100
DYLOAD   EQU    *        DYNAMIC LAOD OUTPUT FORMAT ROUTINE             00051200
         ST     BALBAR,DYLOADA                                          00051300
         MVC    DYLPGM,DWAFRN          DYLPGM : OUTPUT FORMAT RTN       00051400
*                                                                       00051500
         CALL   SYSDLD00,DYLINK,VL            DYNAMIC LOADING I/O       00051600
         IF     (CLC,DYLRTC(1),NE,DATAYES)    CONTROL PROGRAM 1100122 C 00051700
                MVC    ATRRTNC,RC0205                                   00051800
                MVC    DWARTC,RTCDLX                                    00051900
                MVC    SNAPTYPE,=C'DL'                                  00052000
                MVC    SUBID,=C'02'                                     00052100
                LA     TPCBAR,DYLINK          971027 CHNG               00052200
                ST     TPCBAR,SNAPSTR         971027 CHNG               00052300
                CALL   SYSSNAP,SNAPLIST                                 00052400
         ENDIF                                                          00052500
*                                                                       00052600
         L      BALBAR,DYLOADA                                          00052700
         BR     BALBAR                                                  00052800
*                                                                       00052900
ISRTMSG  EQU    *                                                       00053000
         ST     BALBAR,ISRTMSGA                                         00053100
*                                                                       00053200
         L      DBCBAR,AALTPCB    CURRENT ALTPCB ADDR.                  00053300
         L      TPCBAR,0(DBCBAR)                                        00053400
         LA     DBCBAR,4(DBCBAR)  NEXT ALTPCB ADDR.                     00053500
         ST     DBCBAR,AALTPCB    SAVE NEXT ALTPCB ADDR.                00053600
*                                                                       00053700
         IF     (CLC,WSLTRM,EQ,IBSTM)     77/12/05 APTRS                00053800
                 MVC   WSLTRM(8),ETABSLU2         (980617:4715)         00053900
         ELSE    FOR  REMIT-IN SEND TO ETABS LU                         00054000
            IF  (CLC,WSLTRM+5(3),EQ,=C'JJ4')                            00054100
                 MVC   WSLTRM(8),ETABSLU1   RMT-IN TO SERVER1           00054200
                 MVC   WSLTRM+7(1),5(WKABAR)     1010810 ADD BY APJADE  00054300
*110119A                                                                00054400
                 IF  (CLC,WSLTRM(8),EQ,=C'ITAP1400')                    00054500
                      MVC   WSLTRM(8),=C'ITAP1410'                      00054600
                 ENDIF                                                  00054700
*110119A                                                                00054800
            ENDIF       FOR JJ4 FLOW= IBRI,IBCI....                     00054900
         ENDIF   FOR ELSE-END                                           00055000
*                                                                       00055100
         IF    (CLC,WSLTRM(4),NE,FISGLTMO),ANDIF,                      Z00056100
               (CLC,WSLTRM(4),NE,IBCR000O),ANDIF,                      Z00056200
               (CLC,WSLTRM(4),NE,EAII000O),ANDIF,                      Z00056300
               (CLC,WSLTRM(8),NE,IBPBM),ANDIF,                         Z00056400
               (CLC,WSLTRM(7),NE,=C'IFEPPB3'),ANDIF,                   Z00056500
               (CLC,WSLTRM(7),NE,=C'IFEPPD3'),ANDIF,                   Z00056600
               (CLC,WSLTRM(7),NE,=C'IFEPPB5'),ANDIF,                   Z00056700
               (CLC,WSLTRM(7),NE,=C'IFEPPD5'),ANDIF,                   Z00056800
               (CLC,CLDWASLT(4),EQ,ATMTXLU)      1120911 ADD =IFEP      00056900
*3.2            IFEPXX11 ~ IFEPXX18  第三期之二新電文走不同的IBTCP    00057300
*3.1            ATM交易透過IFEPTB3X/5X送至財金                      00057400
                MVC   WSLTRM(8),CLDWASLT    1120911 ADD CLIENT-ID       00057500
*1140307 CHNG   IFEPXX21 ~ IFEPXX5X  第三期之一舊電文非同步回覆端末   00057600
                MVC   FEPTRMFG(1),CLDWASLT+5     1140307 ADD            00057700
                IF   (CLC,FEPTRMFG(1),EQ,VALUEA) 1140307 ADD            00057800
                      MVC   WSLTRM+5(1),VALUEB   1140307 ADD            00057900
                ELSE                             1140307 ADD            00058000
                      MVC   WSLTRM+5(1),VALUED   1140307 ADD            00058100
                ENDIF                            1140307 ADD            00058200
         ENDIF                                   1120911 ADD            00058300
*                                                                       00058400
         IF     (CLC,WSLTRM(8),EQ,CTOCRT)                               00058500
                MVC   WSLTRM(8),PRODCTO           PROD:L8A14            00058700
         ENDIF                                                          00058800
*                                                                       00058900
         CALL   ASMTDLI,(CHNG,(TPCBAR),WSLTRM),VL                       00059000
         IF     (CLC,TPSTAT,NE,IMSCBB)                                  00059100
                OPEN (SNAPPRT,OUTPUT)                                   00059200
                PUT  SNAPPRT,=C'--- SYSOCP00 CHNG LTRM ERROR, TPSTAT='  00059300
                PUT    SNAPPRT,TPSTAT                                   00059400
                PUT    SNAPPRT,TPLTNM                                   00059500
                CLOSE  (SNAPPRT)                                        00059600
                MVC    SNAPTYPE,VALUETP     1140307 CHNG                00059700
                MVC    SUBID,=C'03'                                     00059800
                ST     TPCBAR,SNAPSTR                                   00059900
                CALL   SYSSNAP,SNAPLIST                                 00060000
         ENDIF                                                          00060100
*                                                                       00060200
*1081031 BELOW ADD BY APSNOW  FOR  VTM-SYSTEM下送IOPCB                00060300
         IF    (CLC,WSLTRM,EQ,VMTPIPE0)                                 00060400
                L      TPCBAR,IOPCBX                                    00060500
                CALL   ASMTDLI,(ISRT,(TPCBAR),OUTAREA),VL               00060600
         ELSE                                                           00060700
*1081031 UPPER                                                          00060800
         IF    (CLC,WSLTRM,EQ,PRODCTO),ORIF,(CLC,WSLTRM,EQ,TESTCTO)     00060900
                CALL   ASMTDLI,(ISRT,(TPCBAR),OUTAREA,IBMTO),VL         00061000
         ELSE                                                           00061100
*1080919 BELOW ADD BY APSNOW FOR VTM-SYSTEM                             00061200
         IF (CLC,WSLTRM,EQ,EBTPIPE0),ORIF,                             Z00061400
               (CLC,WSLTRM,EQ,MBTPIPE1),ORIF,                          Z00061500
               (CLC,WSLTRM,EQ,MBTPIPE2)          1140307 CHNG           00061600
                CALL   ASMTDLI,(ISRT,(TPCBAR),OUTAREA,MQIMSVS),VL       00062000
         ELSE          1010430 CHNG                                     00062100
                IF  (CLC,WSLTRM+5(1),EQ,=CL1'P')                        00062200
                     CALL   ASMTDLI,(ISRT,(TPCBAR),OUTAREA,POSMOD),VL   00062300
                ELSE                                                    00062400
                     CALL   ASMTDLI,(ISRT,(TPCBAR),OUTAREA),VL          00062500
                ENDIF                                                   00062600
         ENDIF                                                          00062700
         ENDIF                                                          00062800
         ENDIF        1081031-ADD (VTM)                                 00062900
*                                                                       00063000
         IF     (CLC,TPSTAT,NE,IMSCBB)                                  00063100
                MVC    SNAPTYPE,VALUETP          1140307 CHNG           00063200
                MVC    SUBID,=C'04'                                     00063300
                ST     TPCBAR,SNAPSTR                                   00063400
                CALL   SYSSNAP,SNAPLIST                                 00063500
         ENDIF                                                          00063600
*                                                                       00063700
         L      BALBAR,ISRTMSGA                                         00063800
         BR     BALBAR                                                  00063900
*                                                                       00064000
ISRTLOG  EQU    *                                                       00064100
         ST     BALBAR,ISRTLOGA                                         00064200
*                                                                       00064300
         MVC    TXLIO(1),=C'O'        OUTPUT MSG LOG                    00064400
         MVC    TXLFLOW,ATRTFLOW                                        00064500
         MVC    TXLSTAN(10),ATRTKEY                                     00064600
         MVC    TXLAPPL(8),ATRTAPPL                                     00064700
         MVC    TXLDAT7(7),DWAOPD7    971201 CHNG BY APJADE             00064800
         MVC    TXLTIME(6),DWAHMS                                       00064900
         MVC    TXLLTRM(8),WSLTRM                                       00065000
         MVC    TXLDATA(256),OUTAREA                                    00065100
         MVC    TXLDATA+256(256),OUTAREA+256                            00065200
*                                                                       00065400
         L      DBCBAR,LCPCBX                                           00065500
         CALL   ASMTDLI,(ISRT,(DBCBAR),TXLSEG,UQSSATXL),VL              00065600
         IF     (CLC,DBSTAT,NE,IMSCBB)                                  00065700
                MVC    SNAPTYPE,VALUEDB          1140307 CHNG           00065900
                MVC    SUBID,=C'06'                                     00066000
                ST     DBCBAR,SNAPSTR                                   00066100
                CALL   SYSSNAP,SNAPLIST                                 00066200
         ENDIF                                                          00066300
*                                                                       00066400
         L      BALBAR,ISRTLOGA                                         00066500
         BR     BALBAR                                                  00066600
*                                                                       00066700
ENQBMP   EQU    *                                                       00066800
         L      TPCBAR,BMPPCBX                                          00066900
*                                                                       00067000
         CALL   ASMTDLI,(ISRT,(TPCBAR),OUTAREA),VL                      00067100
         IF     (CLC,TPSTAT,NE,IMSCBB)                                  00067200
*1140307        MVC    SNAPTYPE,=C'TP'                                  00067300
                MVC    SNAPTYPE,VALUETP     1140307 CHNG                00067400
                MVC    SUBID,=C'07'                                     00067500
                ST     DBCBAR,SNAPSTR                                   00067600
                CALL   SYSSNAP,SNAPLIST                                 00067700
         ENDIF                                                          00067800
*                                                                       00067900
         BR     BALBAR                                                  00068000
*                                                                       00068100
OCPEHP   EQU    *                                                       00068200
         ST     BALBAR,OCPEHPA                                          00068300
*                                                                       00068400
*        MAIN ROUTINE HAD SET SAME CONDITION   MARKED BY APJADE         00068500
         L      TPCBAR,IOPCBX                971027 CHNG                00068900
*                                                                       00069000
         CALL  ASMTDLI,(ROLB,(TPCBAR)),VL   971027 CHNG                 00069100
         IF    (CLC,TPSTAT,EQ,IMSCBB)       971027 CHNG                 00069300
                   MVC   DWAEHP,DATAYES         SYSEHP00 FLAG 770808    00069400
                   BAL   BALBAR,REPODB          DB REPOSITION           00069500
         ELSE                                                           00069600
                   MVC   ATRRTNC,RC0801         DB ERROR                00069700
                   OPEN (SNAPPRT,OUTPUT)                                00069800
                   PUT  SNAPPRT,=C'-- SYSOCP00 OCPEHP CALL-ROLB ERROR=' 00069900
                   PUT  SNAPPRT,ATRRTNC                                 00070000
                   CLOSE (SNAPPRT)                                      00070100
                   MVC   DWARTC,RTCDBX                                  00070200
                   MVC   SNAPTYPE,=C'RB'                                00070300
                   MVC   SUBID,=C'08'                                   00070400
                   ST    TPCBAR,SNAPSTR      971027 CHNG                00070600
                   CALL  SYSSNAP,SNAPLIST                               00070700
         ENDIF                                                          00070800
         MVC  DWARBKF,DATANO       CLEAR ROLB-FLAG   76/08/15           00070900
*                                                                       00071100
         L      BALBAR,OCPEHPA                                          00071200
         BR     BALBAR                                                  00071300
*                                                                       00071400
REPODB   EQU   *            DATA-BASE REPOSITION                        00071500
         ST    BALBAR,REPODBA                                           00071600
*                                                                       00071700
         IF    (CLC,DWAIRF,NE,ISRTMARK)                                 00071800
               BAL    BALBAR,REPOAT                                     00071900
         ELSE                                                           00072000
               IF    (CLC,DWASLT(8),NE,FISGLTMI)                        00072100
                     BAL    BALBAR,REGSTAN   770705  STAN               00072200
               ENDIF                                                    00072300
         ENDIF                                                          00072400
         BAL   BALBAR,REPOLC                                            00072500
*                                                                       00072600
         L     BALBAR,REPODBA                                           00072700
         BR    BALBAR                                                   00072800
*                                                                       00072900
REPOLC   EQU    *     LCRSEG REPOSITION                                 00073000
         L      DBCBAR,LCPCBX                                           00073100
         MVC    QLCRKEY,LCRLTERM                                        00073200
*                                                                       00073300
         CALL  ASMTDLI,(GHU,(DBCBAR),TEMPAREA,QSSALCR),VL               00073400
         IF    (CLC,DBSTAT,NE,IMSCBB)                                   00073500
               MVC   ATRRTNC,RC0801                                     00073600
               MVC   DWARTC,RTCDBX                                      00073700
*1140307       MVC   SNAPTYPE,=C'DB'                                    00073800
               OPEN   (SNAPPRT,OUTPUT)                                  00073900
               PUT    SNAPPRT,=C'--- SYSOCP00 REPOLC GHU ERROR='        00074000
               PUT    SNAPPRT,QLCRKEY                                   00074100
               CLOSE  (SNAPPRT)                                         00074200
               MVC   SNAPTYPE,VALUEDB            1140307 CHNG           00074300
               MVC   SUBID,=C'03'                                       00074400
               ST    DBCBAR,SNAPSTR                                     00074500
               CALL  SYSSNAP,SNAPLIST                                   00074600
         ENDIF                                                          00074700
*                                                                       00074800
         BR   BALBAR                                                    00074900
*                                                                       00075000
REPOAT   EQU    *     ATRSEG REPOSITION ( IF NOT REQUEST TX )           00075100
*                                                                       00075200
         IF    (CLC,DWAABF,EQ,=C'B')                                    00075300
               L      DBCBAR,BTPCBX                                     00075400
               MVC    QBTRKEY,ATRTKEY                                   00075500
               CALL  ASMTDLI,(GHU,(DBCBAR),TEMPAREA,QSSABTR),VL         00075600
         ELSE                                                           00075700
               L      DBCBAR,ATPCBX                                     00075800
               MVC    QATRKEY,ATRTKEY                                   00075900
               CALL  ASMTDLI,(GHU,(DBCBAR),TEMPAREA,QSSAATR),VL         00076000
         ENDIF                                                          00076100
         IF    (CLC,DBSTAT,NE,IMSCBB)                                   00076200
               MVC   ATRRTNC,RC0801                                     00076300
               OPEN   (SNAPPRT,OUTPUT)                                  00076400
               PUT    SNAPPRT,=C'--- SYSOCP00 REPOAT GHU ERROR='        00076500
               PUT    SNAPPRT,QBTRKEY                                   00076600
               PUT    SNAPPRT,QATRKEY                                   00076700
               PUT    SNAPPRT,DWAABF                                    00076800
               CLOSE  (SNAPPRT)                                         00076900
               MVC   DWARTC,RTCDBX                                      00077000
               MVC   SNAPTYPE,VALUEDB            1140307 CHNG           00077200
               MVC   SUBID,=C'04'                                       00077300
               ST    DBCBAR,SNAPSTR                                     00077400
               CALL  SYSSNAP,SNAPLIST                                   00077500
         ENDIF                                                          00077600
*                                                                       00077700
         BR     BALBAR                                                  00077800
*                                                                       00077900
REGSTAN  EQU   *     STAN RE-GENERATION  770805 APTRS                   00078000
         ST    BALBAR,REGSTANA                                          00078100
*                                                                       00078200
         IF    (CLC,ATRTBID(3),EQ,CBOTID)                               00078300
               L     WKABAR,AIBCSECT                                    00078400
***  990129  ADD FOR 預約轉帳LTRMOAXX   由端末編STAN                00078500
               IF    (CLC,EAMPTRFG,EQ,DATAYES)   1100122 CHNG           00078600
                     MVC    DWASTAN,PIEOSTAN         端末編STAN       00078700
               ELSE                                                     00078800
                IF   (CLC,ATRTAPPL,EQ,IBAMT8)    1051226 ADD/1100122 C  00078900
                     MVC    DWASTAN,PIEOSTAN         端末編STAN       00079000
                ELSE                                  1000929A FOR EAII 00079100
                     CALL  STANGEN,((WKABAR)),VL                        00079200
                ENDIF                                 1000929A FOR EAII 00079300
               ENDIF                                                    00079400
               MVC   ATRTSTAN,DWASTAN                                   00079500
         ENDIF                                                          00079600
*                                                                       00079700
         L     BALBAR,REGSTANA                                          00079800
         BR    BALBAR                                                   00079900
*                                                                       00080000
*1140502 BELOW FOR ATM FEP程式換版時切換CLIENT-ID                     00080100
*BELOW 1140502 以LCRFEPSW作為FEP SERVER停機以換版之SWITCH*        00080200
SWHCLINT EQU   *      SEND ERROR MSG TO TERMINAL                        00080300
         ST    BALBAR,GETLCRA                                           00080400
*                                                                       00080500
         MVC   CHGCID(1),RTCNML                  INI-SPACE              00080600
         PACK  PK2(2),WSLTRM+7(1)                1140502 ADD            00080700
         DP    PK2,P2                            1140502 ADD            00080800
*                                                                       00080900
         PACK  PK3(2),WSLTRM+7(1)                1140502 ADD            00081000
         IF   (CP,PK2+1(1),NE,P0)      IS ODD NO.                       00081100
               IF   (CLC,FEPAPID,EQ,VALUE1)      =1/3/5/7 --> 2/4/6/8   00081200
                     AP    PK3,P1                1140502 ADD            00081300
                     MVC   CHGCID(1),DATAYES     SET Y                  00081400
               ENDIF                                                    00081500
         ELSE                          IS EVEN NO.偶數                00081600
               IF   (CLC,FEPAPID,EQ,VALUE2)      =2/4/6/8 --> 1/3/5/7   00081700
                     SP    PK3,P1                1140502 ADD            00081800
                     MVC   CHGCID(1),DATAYES     SET Y                  00081900
               ENDIF                                                    00082000
         ENDIF                                                          00082100
*                                                                       00082200
         IF   (CLC,CHGCID,EQ,DATAYES)            NEED CHNG CLINT-ID     00082300
               UNPK  UNPK2(2),PK3(2)             1140502 ADD            00082400
               OI    UNPK2+1,X'F0'                                      00082500
               MVC   WSLTRM+7(1),UNPK2+1         1140502 ADD            00082600
         ENDIF                                                          00082700
*                                                                       00082800
         L     BALBAR,GETLCRA                                           00082900
         BR    BALBAR                                                   00083000
*1140502 BELOW FOR ATM FEP程式換版時切換CLIENT-ID                     00083100
*                                                                       00083200
* 990525 BELOW  ADD BY APJADE FOR TCP PROCESS ERROR SEND MSG TO TML     00083300
SENDERR  EQU    *      SEND ERROR MSG TO TERMINAL                       00083400
*                                                                       00083500
         ST     BALBAR,OCPMSGA                                          00083600
*                                                                       00083700
         MVC    WSLTRM(8),DWASLT            OUTPUT LTERM NAME 1010430M  00083800
         MVC    OUTAREA(256),0(WKBBAR)           OUTPUT DATA 1          00083900
         MVC    OUTAREA+256(256),256(WKBBAR)     OUTPUT DATA 2          00084000
*                                                                       00084100
*1010430 BELOW  ADD BY APJADE FOR TCP PROCESS ERROR SEND MSG TO TML     00084200
         IF    (CLC,TWATIA+4(5),EQ,IBPBM),ORIF,                        Z00084300
               (CLC,TWATIA+4(8),EQ,IBCDMN)       1060505A-1140307 CHG   00084400
              MVC  PBMOLL,=X'0042'                                      00084500
              MVC  PBMOZZ,=X'0000'                                      00084600
              MVC  POWSID,PIWSID                                        00084700
              MVC  PORECFMT,PIRECFMT                                    00084800
              MVC  POMSGCAT,PIMSGCAT                                    00084900
              MVC  POMSGTYP,=C'PC'                                      00085000
              MVC  PODATE,PIDATE                                        00085100
              MVC  POTIME,PITIME                                        00085200
              MVC  POTXSEQ,PITXSEQ                                      00085300
              MVC  POTDRSEQ,PITDRSEQ                                    00085400
              MVC  OUTAREA(256),MSGTEXT2                                00085500
         ELSE                                                           00085600
*1010430 UPPER  ADD BY APJADE FOR TCP PROCESS ERROR SEND MSG TO TML     00085700
              MVC  WGOLL,=X'0043'                                       00085800
              MVC  WGOZZ,=X'0000'                                       00085900
              MVC  WGOTRNC,=C'IBTS'                                     00086000
              MVC  WGOTD,=C'ATCP'                                       00086100
              MVC  WGOERRC,=C'ATCP'                                     00086300
              MVI  WGOCTLB,C'A'                                         00086400
*                                                                       00086500
              IF   (CLC,DWARTC,EQ,RTCDBX)  990525 ADD FOR ERROR APJADE  00086600
                    MVC    WGODATA(23),=CL23'IBTCP READ LC ERROR'       00086700
              ELSE                                                      00086800
                    MVC    WGODATA(23),=CL23'IBTCP DYLOAD ICPD ERROR'   00086900
              ENDIF                                                     00087000
              MVC   OUTAREA(256),MSGTEXT1                               00087100
         ENDIF                                                          00087200
*                                                                       00087300
         BAL    BALBAR,ISRTMSG                                          00087400
*                                                                       00087500
         L      WKABAR,AOUTMSG                                          00087600
         LM     WKBBAR,WKDBAR,=A(1042,BLANK,1)                          00087700
         ICM    WKDBAR,8,BLANK                                          00087800
         MVCL   WKABAR,WKCBAR                                           00087900
*                                                                       00088000
         L      BALBAR,OCPMSGA                                          00088100
         BR     BALBAR                                                  00088200
*                                                                       00088300
* 990525 UPPER  ADD BY APJADE FOR TCP PROCESS ERROR SEND MSG TO TML     00088400
*                                                                       00088500
SAVEAREA DS     18F                                                     00088600
CODECNVA DS     A                                                       00088700
OCPEHPA  DS     A                                                       00088800
REPODBA  DS     A                                                       00088900
REPOLCA  DS     A                                                       00089000
REPOATA  DS     A                                                       00089100
REGSTANA DS     A                                                       00089200
OCPMSGA  DS     A                                                       00089300
OCPRTNA  DS     A                                                       00089400
PUTMSGA  DS     A                                                       00089500
FMTOUTA  DS     A                                                       00089600
ISRTLOGA DS     A                                                       00089700
ISRTMSGA DS     A                                                       00089800
DYLOADA  DS     A                                                       00089900
GETLCRA  DS     A                                                       00090000
SYNCGENA DS     A                                                       00090100
TEMPABAR DS     A                                                       00090200
TEMPCBAR DS     A                                                       00090300
WSLTRM   DS     CL8                                                     00090400
BLANK    DC     XL1'40'                                                 00090500
BLANKS   DC     20CL1' '               1011122 ADD BY APJADE            00090600
OUTAREA  DS     CL512                                                   00090700
IBMTO    DC     CL8'IBMTO   '                                           00090800
POSMOD   DC     CL8'POSMOD  '                                           00090900
TESTCTO  DC     CL8'TRSNAT11'                                           00091000
PRODCTO  DC     CL8'L8A14   '                                           00091100
MQIMSVS  DC     CL8'MQIMSVS '                                           00091200
EBTPIPE0 DC     CL8'EBTPIPE0'                                           00091300
MBTPIPE1 DC     CL8'MBTPIPE1'          1000406 ADD                      00091400
MBTPIPE2 DC     CL8'MBTPIPE2'          1000406 ADD                      00091500
VMTPIPE0 DC     CL8'VMTPIPE0'          1080919 ADD                      00091600
ATMTXLU  DC     CL4'IFEP'      NEW     1120911 ADD                      00091700
FEPLTM5A DC     CL8'IFEPPA51'   IFEPPA51 ~ IFEPPA54   1140307 PROD      00091800
FEPIBA3I DC     CL8'IFEPPA31'   IFEPPA31 ~ IFEPPA38   1140307 PROD      00091900
FEPIBC3I DC     CL8'IFEPPC31'   IFEPPC31 ~ IFEPPC38   1140307 PROD      00092000
VALUE0   DC     CL1'0'                 1140307 ADD                      00092100
VALUE1   DC     CL1'1'                 1140307 ADD                      00092200
VALUE2   DC     CL1'2'                 1140307 ADD                      00092300
VALUE3   DC     CL1'3'                 1140307 ADD                      00092400
VALUE4   DC     CL1'4'                 1140317 ADD                      00092500
VALUE5   DC     CL1'5'                 1140307 ADD                      00092600
VALUE8   DC     CL1'8'                 1140307 ADD                      00092700
VALUE9   DC     CL1'9'                 1140502 ADD                      00092800
VALUEA   DC     CL1'A'                 1140307 ADD                      00092900
VALUEB   DC     CL1'B'                 1140307 ADD                      00093000
VALUEC   DC     CL1'C'                 1140501 ADD                      00093100
VALUED   DC     CL1'D'                 1140307 ADD                      00093200
VALUEI   DC     CL1'I'                 1140307 ADD                      00093300
VALUEDB  DC     CL2'DB'                1140307 ADD                      00093400
VALUETP  DC     CL2'TP'                1140307 ADD                      00093500
TEMPAREA DS     CL1500                                                  00093600
*                                                                       00093700
FISGLTM4 DC     CL8'F000004O'                                           00093800
FISGLTM5 DC     CL8'F000005O'                                           00093900
FISGLTM6 DC     CL8'F000006O'                                           00094000
FISGLTM7 DC     CL8'F000007O'                                           00094100
FISGLTM8 DC     CL8'F000008O'                                           00094200
INGSPA02 DC     CL8'INGSPA02'          1140307 ADD PROD                 00094300
*  CALL FORMAT RTN PARMLIST                                             00094400
         DS    0F                                                       00094500
PARMLIST EQU    *                                                       00094600
TCAADDR  DS     A                                                       00094700
*   DYNAMIC-LOAD LINK AREA                                              00094800
DYLINK   DS    0F                                                       00094900
DYLPGM   DS    0CL8                  PROGRAM NAME = NAME1 + NAME2       00095000
DYLNAM1  DS     CL4                  IOCP,ATMP,M-TYPE,...               00095100
DYLNAM2  DS     CL4                  DEVICE-NAME,CLSAA,P-CODE,...       00095200
DYLADDR  DS     A                    PGM ADDRESS                        00095300
DYLRTC   DS     CL1                  RETRUN CODE OF DYNAMIC CALL        00095400
*                                                                       00095500
SNAPLIST DS   0A                                                        00095600
         DC    A(SNAPTYPE)       SNAP  TYPE                             00095700
SNAPSTR  DC    A(0)              START ADDRESS                          00095800
SNAPEND  DC    A(0)              END   ADDRESS                          00095900
         DC    XL1'80'                                                  00096000
         DC    AL3(PGMID)                                               00096100
SNAPTYPE DC    CL2'DB'                                                  00096200
PGMID    DC    CL8'SYSOCP31'                                            00096300
SUBID    DC    CL2'01'                                                  00096400
DESLTRM  DC    CL8'F000002O'                                            00096500
*                                                                       00096600
         COPY   LINK5740                                                00096700
         COPY   CODELINK    NOT GO PRODUCTION                           00096800
         COPY   IBCODES                                                 00096900
         COPY   IBOUTLU          1011031 ADD BY APJADE                  00097000
         COPY   IBSSA                                                   00097200
*        COPY   RCXXXX                                                  00097400
RC0205   DC    CL4'0205'                                                00097500
RC0801   DC    CL4'0801'                                                00097600
RC2999   DC    CL4'2999'               1140502 ADD                      00097700
ITAP1420 DC    CL8'ITAP1420'         1110119 ADD BY PHIP   FOR PROD     00097800
*                                                                       00097900
FEPTRMFG DS     CL1              1140307 ADD A/C --> B/D                00098000
WKSTANKY DC     CL1' '           1140307 REGION-FG作為CLIENT-ID起算 00098100
UNPK2    DS     CL2              1140307 ADD                            00098200
PK2      DS     PL2              1140307 ADD                            00098300
P0       DC     PL1'0'           1140502 ADD                            00098400
P1       DC     PL2'1'           1140307 ADD                            00098500
P2       DC     PL1'2'           1140502 ADD                            00098600
CHGCID   DS     CL1              1140502 ADD CHNG CLIENT-ID FLAG        00098700
EAITXSW  DS     CL1              1140502 ADD IS-EAI-TXN SW              00098800
PK3      DS     PL2              1140502 ADD                            00098900
*                                                                       00099000
         COPY   LCTXLSEG                                                00099100
         DS    CL20        971027 RESERVED FOR LCTXLSEG ADD BY APJADE   00099200
         LTORG                                                          00099300
*                                                                       00099400
SNAPPRT  DCB   DDNAME=SNAPPRT,DSORG=PS,BLKSIZE=80,LRECL=80,            *00099500
               RECFM=FB,MACRF=PM                                        00099600
         END    SYSOCP31                                                00099700
