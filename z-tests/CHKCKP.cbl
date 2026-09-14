       IDENTIFICATION DIVISION.
       PROGRAM-ID. CHKCKP.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ACTUAL ASSIGN TO ACTUALDD FILE STATUS FS-A.
           SELECT EXPECTED ASSIGN TO EXPECTDD FILE STATUS FS-E.
       DATA DIVISION.
       FILE SECTION.
       FD ACTUAL RECORD CONTAINS 400 CHARACTERS.
       01 REC-A PIC X(400).
       FD EXPECTED RECORD CONTAINS 400 CHARACTERS.
       01 REC-E PIC X(400).
       WORKING-STORAGE SECTION.
       01 FS-A PIC XX.
       01 FS-E PIC XX.
       01 CASE-N PIC 9(4) VALUE ZERO.
       01 ERRORS PIC 9(4) VALUE ZERO.
       PROCEDURE DIVISION.
           OPEN INPUT ACTUAL EXPECTED.
           IF FS-A NOT = "00" OR FS-E NOT = "00"
               DISPLAY "OPEN FAILED " FS-A " " FS-E
               MOVE 12 TO RETURN-CODE
               STOP RUN
           END-IF.
           PERFORM UNTIL FS-A = "10" OR FS-E = "10"
               READ ACTUAL
               READ EXPECTED
               EVALUATE TRUE
                 WHEN FS-A = "00" AND FS-E = "00"
                   ADD 1 TO CASE-N
                   IF REC-A = REC-E
                       DISPLAY "CASE " CASE-N " PASS ALL 400 BYTES"
                   ELSE
                       ADD 1 TO ERRORS
                       DISPLAY "CASE " CASE-N " FAIL"
                   END-IF
                   DISPLAY "ACTUAL-ID=[" REC-A(1:10) "]"
                   DISPLAY "EXPECT-ID=[" REC-E(1:10) "]"
                 WHEN FS-A = "10" AND FS-E = "10"
                   CONTINUE
                 WHEN OTHER
                   DISPLAY "READ OR COUNT FAILED " FS-A " " FS-E
                   ADD 1 TO ERRORS
                   MOVE "10" TO FS-A FS-E
               END-EVALUATE
           END-PERFORM.
           IF CASE-N NOT = 7 ADD 1 TO ERRORS END-IF.
           CLOSE ACTUAL EXPECTED.
           DISPLAY "CHECKED=" CASE-N " ERRORS=" ERRORS.
           IF ERRORS = ZERO MOVE ZERO TO RETURN-CODE
           ELSE MOVE 8 TO RETURN-CODE END-IF.
           STOP RUN.
