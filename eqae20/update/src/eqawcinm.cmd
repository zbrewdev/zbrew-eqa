        comment show build date/time and service level (if any);
        call %ver;
        AT 36
          LIST ( "At the breakpoint for line", %LINE ) ;
        GO ;
        STEP 1 ;
        LIST var1 ;
        DESCRIBE ATTRIBUTES var1 ;
        int X ;
        X = var1;
        X++;
        LIST X ;
        AT EXIT *
          LIST ( "Exiting ", %CU ) ;
        GO ;
        QUIT ;
