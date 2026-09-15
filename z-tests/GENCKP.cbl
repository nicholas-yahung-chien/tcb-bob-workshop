       IDENTIFICATION DIVISION.
       PROGRAM-ID. GENCKP.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FILE-A ASSIGN TO WORKDD.
           SELECT FILE-B ASSIGN TO EXP1DD.
           SELECT FILE-C ASSIGN TO EXP2DD.
           SELECT FILE-D ASSIGN TO EMPTYDD.
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
       PROCEDURE DIVISION.
           OPEN OUTPUT FILE-A FILE-B FILE-C FILE-D.
           MOVE ALL "Q" TO REC-A.
           MOVE "0012345678" TO REC-A(1:10).
           MOVE "K" TO REC-A(11:1).
           MOVE "ABC" TO REC-A(14:3).
           MOVE "0001" TO REC-A(397:4).
           DISPLAY "CASE 0001 ORIGINAL RECORD; LENGTH=400".
           DISPLAY 'ID="' REC-A(1:10) '"'.
           DISPLAY 'BYTES-014-016="' REC-A(14:3) '"'.
           DISPLAY '0001-0080="' REC-A(1:80) '"'.
           DISPLAY '0081-0160="' REC-A(81:80) '"'.
           DISPLAY '0161-0240="' REC-A(161:80) '"'.
           DISPLAY '0241-0320="' REC-A(241:80) '"'.
           DISPLAY '0321-0400="' REC-A(321:80) '"'.
           MOVE REC-A TO REC-B REC-C.
           MOVE "12345678  " TO REC-B(1:10).
           MOVE "12345678  " TO REC-C(1:10).
           WRITE REC-A.
           WRITE REC-B.
           WRITE REC-C.
           MOVE ALL "Q" TO REC-A.
           MOVE "AB12345678" TO REC-A(1:10).
           MOVE "K" TO REC-A(11:1).
           MOVE "ABC" TO REC-A(14:3).
           MOVE "0002" TO REC-A(397:4).
           DISPLAY "CASE 0002 ORIGINAL RECORD; LENGTH=400".
           DISPLAY 'ID="' REC-A(1:10) '"'.
           DISPLAY 'BYTES-014-016="' REC-A(14:3) '"'.
           DISPLAY '0001-0080="' REC-A(1:80) '"'.
           DISPLAY '0081-0160="' REC-A(81:80) '"'.
           DISPLAY '0161-0240="' REC-A(161:80) '"'.
           DISPLAY '0241-0320="' REC-A(241:80) '"'.
           DISPLAY '0321-0400="' REC-A(321:80) '"'.
           MOVE REC-A TO REC-B REC-C.
           MOVE "AB12345678" TO REC-B(1:10).
           MOVE "AB12345678" TO REC-C(1:10).
           WRITE REC-A.
           WRITE REC-B.
           WRITE REC-C.
           MOVE ALL "Q" TO REC-A.
           MOVE "0098765432" TO REC-A(1:10).
           MOVE "K" TO REC-A(11:1).
           MOVE "EOF" TO REC-A(14:3).
           MOVE "0003" TO REC-A(397:4).
           DISPLAY "CASE 0003 ORIGINAL RECORD; LENGTH=400".
           DISPLAY 'ID="' REC-A(1:10) '"'.
           DISPLAY 'BYTES-014-016="' REC-A(14:3) '"'.
           DISPLAY '0001-0080="' REC-A(1:80) '"'.
           DISPLAY '0081-0160="' REC-A(81:80) '"'.
           DISPLAY '0161-0240="' REC-A(161:80) '"'.
           DISPLAY '0241-0320="' REC-A(241:80) '"'.
           DISPLAY '0321-0400="' REC-A(321:80) '"'.
           MOVE REC-A TO REC-B REC-C.
           MOVE "0098765432" TO REC-B(1:10).
           MOVE "0098765432" TO REC-C(1:10).
           WRITE REC-A.
           WRITE REC-B.
           WRITE REC-C.
           MOVE ALL "Q" TO REC-A.
           MOVE "0000123456" TO REC-A(1:10).
           MOVE "K" TO REC-A(11:1).
           MOVE "ABC" TO REC-A(14:3).
           MOVE "0004" TO REC-A(397:4).
           DISPLAY "CASE 0004 ORIGINAL RECORD; LENGTH=400".
           DISPLAY 'ID="' REC-A(1:10) '"'.
           DISPLAY 'BYTES-014-016="' REC-A(14:3) '"'.
           DISPLAY '0001-0080="' REC-A(1:80) '"'.
           DISPLAY '0081-0160="' REC-A(81:80) '"'.
           DISPLAY '0161-0240="' REC-A(161:80) '"'.
           DISPLAY '0241-0320="' REC-A(241:80) '"'.
           DISPLAY '0321-0400="' REC-A(321:80) '"'.
           MOVE REC-A TO REC-B REC-C.
           MOVE "00123456  " TO REC-B(1:10).
           MOVE "123456    " TO REC-C(1:10).
           WRITE REC-A.
           WRITE REC-B.
           WRITE REC-C.
           MOVE ALL "Q" TO REC-A.
           MOVE "0012345678" TO REC-A(1:10).
           MOVE "K" TO REC-A(11:1).
           MOVE "EOF" TO REC-A(12:3).
           MOVE "0005" TO REC-A(397:4).
           DISPLAY "CASE 0005 ORIGINAL RECORD; LENGTH=400".
           DISPLAY 'ID="' REC-A(1:10) '"'.
           DISPLAY 'BYTES-014-016="' REC-A(14:3) '"'.
           DISPLAY '0001-0080="' REC-A(1:80) '"'.
           DISPLAY '0081-0160="' REC-A(81:80) '"'.
           DISPLAY '0161-0240="' REC-A(161:80) '"'.
           DISPLAY '0241-0320="' REC-A(241:80) '"'.
           DISPLAY '0321-0400="' REC-A(321:80) '"'.
           MOVE REC-A TO REC-B REC-C.
           MOVE "12345678  " TO REC-B(1:10).
           MOVE "12345678  " TO REC-C(1:10).
           WRITE REC-A.
           WRITE REC-B.
           WRITE REC-C.
           MOVE ALL "Q" TO REC-A.
           MOVE "00ABCDEFGH" TO REC-A(1:10).
           MOVE "K" TO REC-A(11:1).
           MOVE "ABC" TO REC-A(14:3).
           MOVE "0006" TO REC-A(397:4).
           DISPLAY "CASE 0006 ORIGINAL RECORD; LENGTH=400".
           DISPLAY 'ID="' REC-A(1:10) '"'.
           DISPLAY 'BYTES-014-016="' REC-A(14:3) '"'.
           DISPLAY '0001-0080="' REC-A(1:80) '"'.
           DISPLAY '0081-0160="' REC-A(81:80) '"'.
           DISPLAY '0161-0240="' REC-A(161:80) '"'.
           DISPLAY '0241-0320="' REC-A(241:80) '"'.
           DISPLAY '0321-0400="' REC-A(321:80) '"'.
           MOVE REC-A TO REC-B REC-C.
           MOVE "ABCDEFGH  " TO REC-B(1:10).
           MOVE "ABCDEFGH  " TO REC-C(1:10).
           WRITE REC-A.
           WRITE REC-B.
           WRITE REC-C.
           MOVE ALL "Q" TO REC-A.
           MOVE "00        " TO REC-A(1:10).
           MOVE "K" TO REC-A(11:1).
           MOVE "ABC" TO REC-A(14:3).
           MOVE "0007" TO REC-A(397:4).
           DISPLAY "CASE 0007 ORIGINAL RECORD; LENGTH=400".
           DISPLAY 'ID="' REC-A(1:10) '"'.
           DISPLAY 'BYTES-014-016="' REC-A(14:3) '"'.
           DISPLAY '0001-0080="' REC-A(1:80) '"'.
           DISPLAY '0081-0160="' REC-A(81:80) '"'.
           DISPLAY '0161-0240="' REC-A(161:80) '"'.
           DISPLAY '0241-0320="' REC-A(241:80) '"'.
           DISPLAY '0321-0400="' REC-A(321:80) '"'.
           MOVE REC-A TO REC-B REC-C.
           MOVE "          " TO REC-B(1:10).
           MOVE "          " TO REC-C(1:10).
           WRITE REC-A.
           WRITE REC-B.
           WRITE REC-C.
           CLOSE FILE-A FILE-B FILE-C FILE-D.
           DISPLAY "FIXTURES=7; RECORD-LENGTH=400".
           MOVE ZERO TO RETURN-CODE.
           STOP RUN.
