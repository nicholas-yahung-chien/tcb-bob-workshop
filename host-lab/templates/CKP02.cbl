      **********************
       ID DIVISION.
      **********************
       PROGRAM-ID. CKP02.
      ******************************************************************
      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.       IBM3083.
       OBJECT-COMPUTER.       IBM3083.
       SPECIAL-NAMES.         C01 IS NEW-PAGE.
      *
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT IN-REF      ASSIGN TO UT-S-INPUT1.

      **********************
       DATA DIVISION.
      **********************
       FILE SECTION.
       FD  IN-REF
           LABEL RECORD IS STANDARD
           BLOCK  CONTAINS   0 RECORDS
           RECORD CONTAINS 400 CHARACTERS.
       01  IN-REF-REC.
           05  R-ID.
               10 R-ID-1         PIC X(10).
               10 R-ID-NEXT REDEFINES R-ID-1.
                   15 CH-R-ID-1            PIC XX.
                      88  CH-RPD-KEY   VALUE "00".
                   15 CH-R-ID-2            PIC X(8).
               10 R-ID-2         PIC X.
           05  R-NAME            PIC X(40).
           05  R-PID.
               10 R-PID-1        PIC X(10).
               10 R-PID-2        PIC X.
           05  R-PNAME           PIC X(40).
           05  R-ADR             PIC X(64).
           05  R-BK1             PIC X(14).
           05  R-BK2             PIC X(14).
           05  R-BK3             PIC X(14).
           05  R-AC1             PIC 9(09).
           05  R-AC2             PIC 9(09).
           05  R-AC3             PIC 9(09).
80806D*    05  R-RJD             PIC 9(06).
80806A     05  R-RJD             PIC 9(08).
           05  R-RJN             PIC X(06).
           05  R-NOTE            PIC X(60).
80806D*    05  FILLER            PIC X(93).
80806A     05  FILLER            PIC X(91).
      *
       WORKING-STORAGE SECTION.
       01  USER-ITEM.
           05  EOF                      PIC 99 VALUE 0.
           05  CHANGE-RPD-KEY.
               10  RPD-KEY              PIC X(8).
               10  RPD-SPACE            PIC XX VALUE SPACE.

      **********************
       PROCEDURE DIVISION.
      **********************
      **********************
       0000-MAIN-RTN.
      **********************
           PERFORM 1000-OPEN-RTN.
           PERFORM 2000-PROCESS-RTN UNTIL EOF = 1.
           PERFORM 3000-CLOSE-RTN.

      **********************
       1000-OPEN-RTN.
      **********************
           OPEN I-O   IN-REF.

           READ IN-REF
             AT END  MOVE 1 TO EOF.

      **********************
       2000-PROCESS-RTN.
      **********************
      * Identifier conversion when prefix matches.
           IF CH-RPD-KEY
90209A      AND IN-REF-REC (14:3) NOT = "EOF"
              PERFORM 2100-MOVE-ZERO-RTN.

           REWRITE IN-REF-REC.

           READ IN-REF
             AT END  MOVE 1 TO EOF.

      **********************
       2100-MOVE-ZERO-RTN.
      **********************
           MOVE CH-R-ID-2      TO RPD-KEY.
           MOVE CHANGE-RPD-KEY TO R-ID-1.

      **********************
       3000-CLOSE-RTN.
      **********************
           CLOSE IN-REF.
           STOP  RUN.
