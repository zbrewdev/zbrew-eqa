comment show build date/time and service level (if any);
call %ver;
set source on (dtivpa) eqalangx;
ldd dtivpa;
query location;

at termination
  do;
   q loc;
   quit;
  end;

at statement 48
  do;
   q loc;
   list r10+0;
   clear at statement 48;
   go;
  end;

at statement 55
  do;
   q loc;
   list r02;
   go;
  end;

go;
