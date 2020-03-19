        Comment Simple test of PROGT ;
        comment show build date/time and service level (if any);
        call %ver;
        QUERY DYNDEBUG;
        STEP 3 ;
        LIST STR1 ;
        01 TEMP PIC X(5) ;
        MOVE STR1 TO TEMP ;
        LIST TEMP ;
        AT 49 PERFORM
          LIST ( "At the breakpoint for line", %LINE );
          LIST (R) ;
          GO ;
        END-PERFORM;
        AT CHANGE STR1 PERFORM
          LIST STR1 ;
          GO ;
        END-PERFORM;
        AT EXIT *
          LIST ( "Exiting ", %CU ) ;
        GO ;
        QUIT ;
