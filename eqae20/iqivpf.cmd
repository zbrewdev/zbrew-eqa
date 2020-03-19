  comment show build date/time and service level (if any);
  call %ver;
  QUERY DYNDEBUG;
  STEP ;
  LIST ( 'Test case started' ) ;
  AT 3 ;
  GO ;
  QUERY LOCATION ;
  AT 6
    DO ;
       LIST I;
       GO ;
    END;
  AT 8 ;
  DCL TEMP FIXED DECIMAL ;
  AT OCCURRENCE ERROR
    DO ;
      LIST ( 'ERROR CONDITION REACHED UNEXPECTEDLY' ) ;
      QUIT ;
    END ;
  LIST NAMES TEST ;
  GO ;
  Q LOC ;
  QUIT DEBUG;
