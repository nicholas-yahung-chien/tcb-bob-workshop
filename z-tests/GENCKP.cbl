       IDENTIFICATION DIVISION.
       PROGRAM-ID. GENCKP.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FILE-A ASSIGN TO WORKDD.
           SELECT FILE-B ASSIGN TO EXP1DD.
           SELECT FILE-C ASSIGN TO EXP2DD.
           SELECT FILE-D ASSIGN TO EMPTYDD.
           SELECT FILE-P ASSIGN TO PRINTDD.
       DATA DIVISION.
       FILE SECTION.
       FD FILE-A RECORD CONTAINS 400 CHARACTERS.
       01 REC-A PIC X(400).
       FD FILE-B RECORD CONTAINS 400 CHARACTERS.
       01 REC-B PIC X(400).
       FD FILE-C RECORD CONTAINS 400 CHARACTERS.
       01 REC-C PIC X(400).
       FD FILE-D RECORD CONTAINS 400 CHARACTERS.
       01 REC-D PIC X(400).
       FD FILE-P RECORD CONTAINS 402 CHARACTERS.
       01 REC-P PIC X(402).
       PROCEDURE DIVISION.
           OPEN OUTPUT FILE-A FILE-B FILE-C FILE-D FILE-P.
           MOVE SPACES TO REC-A.
           MOVE "0012345678" TO REC-A(1:10).
           MOVE "FORMOSA DEMO TRADING CO LTD"
             TO REC-A(12:40).
           MOVE "CHEN DEMO CONTACT"
             TO REC-A(63:40).
           MOVE "NO 10, DEMO RD, ZHONGZHENG DIST, TAIPEI"
             TO REC-A(103:64).
           MOVE "000000000"
             TO REC-A(209:9).
           MOVE "000000000"
             TO REC-A(218:9).
           MOVE "000000000"
             TO REC-A(227:9).
           MOVE "20260915"
             TO REC-A(236:8).
           MOVE "SYNTHETIC WORKSHOP DATA - NOT A REAL CUSTOMER"
             TO REC-A(250:60).
           DISPLAY "CASE 0001 ORIGINAL RECORD; LENGTH=400".
           DISPLAY 'ID="' REC-A(1:10) '"'.
           DISPLAY 'BYTES-014-016="' REC-A(14:3) '"'.
           MOVE '"' TO REC-P(1:1) REC-P(402:1).
           MOVE REC-A TO REC-P(2:400).
           WRITE REC-P.
           MOVE REC-A TO REC-B REC-C.
           MOVE "12345678  " TO REC-B(1:10).
           MOVE "12345678  " TO REC-C(1:10).
           WRITE REC-A.
           WRITE REC-B.
           WRITE REC-C.
           MOVE SPACES TO REC-A.
           MOVE "AB12345678" TO REC-A(1:10).
           MOVE "LIN DEMO CUSTOMER"
             TO REC-A(12:40).
           MOVE "CHEN DEMO CONTACT"
             TO REC-A(63:40).
           MOVE "NO 11, DEMO RD, ZHONGZHENG DIST, TAIPEI"
             TO REC-A(103:64).
           MOVE "000000000"
             TO REC-A(209:9).
           MOVE "000000000"
             TO REC-A(218:9).
           MOVE "000000000"
             TO REC-A(227:9).
           MOVE "20260915"
             TO REC-A(236:8).
           MOVE "SYNTHETIC WORKSHOP DATA - NOT A REAL CUSTOMER"
             TO REC-A(250:60).
           DISPLAY "CASE 0002 ORIGINAL RECORD; LENGTH=400".
           DISPLAY 'ID="' REC-A(1:10) '"'.
           DISPLAY 'BYTES-014-016="' REC-A(14:3) '"'.
           MOVE '"' TO REC-P(1:1) REC-P(402:1).
           MOVE REC-A TO REC-P(2:400).
           WRITE REC-P.
           MOVE REC-A TO REC-B REC-C.
           MOVE "AB12345678" TO REC-B(1:10).
           MOVE "AB12345678" TO REC-C(1:10).
           WRITE REC-A.
           WRITE REC-B.
           WRITE REC-C.
           MOVE SPACES TO REC-A.
           MOVE "0098765432" TO REC-A(1:10).
           MOVE "  EOF"
             TO REC-A(12:40).
           MOVE "000000000"
             TO REC-A(209:9).
           MOVE "000000000"
             TO REC-A(218:9).
           MOVE "000000000"
             TO REC-A(227:9).
           MOVE "00000000"
             TO REC-A(236:8).
           MOVE "SYNTHETIC EOF CONTROL RECORD"
             TO REC-A(250:60).
           DISPLAY "CASE 0003 ORIGINAL RECORD; LENGTH=400".
           DISPLAY 'ID="' REC-A(1:10) '"'.
           DISPLAY 'BYTES-014-016="' REC-A(14:3) '"'.
           MOVE '"' TO REC-P(1:1) REC-P(402:1).
           MOVE REC-A TO REC-P(2:400).
           WRITE REC-P.
           MOVE REC-A TO REC-B REC-C.
           MOVE "0098765432" TO REC-B(1:10).
           MOVE "0098765432" TO REC-C(1:10).
           WRITE REC-A.
           WRITE REC-B.
           WRITE REC-C.
           MOVE SPACES TO REC-A.
           MOVE "0000123456" TO REC-A(1:10).
           MOVE "TAIPEI DEMO INDUSTRIAL CO LTD"
             TO REC-A(12:40).
           MOVE "CHEN DEMO CONTACT"
             TO REC-A(63:40).
           MOVE "NO 13, DEMO RD, ZHONGZHENG DIST, TAIPEI"
             TO REC-A(103:64).
           MOVE "000000000"
             TO REC-A(209:9).
           MOVE "000000000"
             TO REC-A(218:9).
           MOVE "000000000"
             TO REC-A(227:9).
           MOVE "20260915"
             TO REC-A(236:8).
           MOVE "SYNTHETIC WORKSHOP DATA - NOT A REAL CUSTOMER"
             TO REC-A(250:60).
           DISPLAY "CASE 0004 ORIGINAL RECORD; LENGTH=400".
           DISPLAY 'ID="' REC-A(1:10) '"'.
           DISPLAY 'BYTES-014-016="' REC-A(14:3) '"'.
           MOVE '"' TO REC-P(1:1) REC-P(402:1).
           MOVE REC-A TO REC-P(2:400).
           WRITE REC-P.
           MOVE REC-A TO REC-B REC-C.
           MOVE "00123456  " TO REC-B(1:10).
           MOVE "123456    " TO REC-C(1:10).
           WRITE REC-A.
           WRITE REC-B.
           WRITE REC-C.
           MOVE SPACES TO REC-A.
           MOVE "0012345678" TO REC-A(1:10).
           MOVE "EOF DEMO TRADING CO LTD"
             TO REC-A(12:40).
           MOVE "CHEN DEMO CONTACT"
             TO REC-A(63:40).
           MOVE "NO 14, DEMO RD, ZHONGZHENG DIST, TAIPEI"
             TO REC-A(103:64).
           MOVE "000000000"
             TO REC-A(209:9).
           MOVE "000000000"
             TO REC-A(218:9).
           MOVE "000000000"
             TO REC-A(227:9).
           MOVE "20260915"
             TO REC-A(236:8).
           MOVE "SYNTHETIC WORKSHOP DATA - NOT A REAL CUSTOMER"
             TO REC-A(250:60).
           DISPLAY "CASE 0005 ORIGINAL RECORD; LENGTH=400".
           DISPLAY 'ID="' REC-A(1:10) '"'.
           DISPLAY 'BYTES-014-016="' REC-A(14:3) '"'.
           MOVE '"' TO REC-P(1:1) REC-P(402:1).
           MOVE REC-A TO REC-P(2:400).
           WRITE REC-P.
           MOVE REC-A TO REC-B REC-C.
           MOVE "12345678  " TO REC-B(1:10).
           MOVE "12345678  " TO REC-C(1:10).
           WRITE REC-A.
           WRITE REC-B.
           WRITE REC-C.
           MOVE SPACES TO REC-A.
           MOVE "00ABCDEFGH" TO REC-A(1:10).
           MOVE "INVALID ID TEST COMPANY"
             TO REC-A(12:40).
           MOVE "CHEN DEMO CONTACT"
             TO REC-A(63:40).
           MOVE "NO 15, DEMO RD, ZHONGZHENG DIST, TAIPEI"
             TO REC-A(103:64).
           MOVE "000000000"
             TO REC-A(209:9).
           MOVE "000000000"
             TO REC-A(218:9).
           MOVE "000000000"
             TO REC-A(227:9).
           MOVE "20260915"
             TO REC-A(236:8).
           MOVE "SYNTHETIC WORKSHOP DATA - NOT A REAL CUSTOMER"
             TO REC-A(250:60).
           DISPLAY "CASE 0006 ORIGINAL RECORD; LENGTH=400".
           DISPLAY 'ID="' REC-A(1:10) '"'.
           DISPLAY 'BYTES-014-016="' REC-A(14:3) '"'.
           MOVE '"' TO REC-P(1:1) REC-P(402:1).
           MOVE REC-A TO REC-P(2:400).
           WRITE REC-P.
           MOVE REC-A TO REC-B REC-C.
           MOVE "ABCDEFGH  " TO REC-B(1:10).
           MOVE "ABCDEFGH  " TO REC-C(1:10).
           WRITE REC-A.
           WRITE REC-B.
           WRITE REC-C.
           MOVE SPACES TO REC-A.
           MOVE "00        " TO REC-A(1:10).
           MOVE "MISSING ID TEST COMPANY"
             TO REC-A(12:40).
           MOVE "CHEN DEMO CONTACT"
             TO REC-A(63:40).
           MOVE "NO 16, DEMO RD, ZHONGZHENG DIST, TAIPEI"
             TO REC-A(103:64).
           MOVE "000000000"
             TO REC-A(209:9).
           MOVE "000000000"
             TO REC-A(218:9).
           MOVE "000000000"
             TO REC-A(227:9).
           MOVE "20260915"
             TO REC-A(236:8).
           MOVE "SYNTHETIC WORKSHOP DATA - NOT A REAL CUSTOMER"
             TO REC-A(250:60).
           DISPLAY "CASE 0007 ORIGINAL RECORD; LENGTH=400".
           DISPLAY 'ID="' REC-A(1:10) '"'.
           DISPLAY 'BYTES-014-016="' REC-A(14:3) '"'.
           MOVE '"' TO REC-P(1:1) REC-P(402:1).
           MOVE REC-A TO REC-P(2:400).
           WRITE REC-P.
           MOVE REC-A TO REC-B REC-C.
           MOVE "          " TO REC-B(1:10).
           MOVE "          " TO REC-C(1:10).
           WRITE REC-A.
           WRITE REC-B.
           WRITE REC-C.
           CLOSE FILE-A FILE-B FILE-C FILE-D FILE-P.
           DISPLAY "FIXTURES=7; RECORD-LENGTH=400".
           MOVE ZERO TO RETURN-CODE.
           STOP RUN.
