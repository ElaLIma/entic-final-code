function cSPort( s )
%cSPort function that close a serial port
fclose(s);
delete(s);
clear s;
instrfind;
fclose(instrfind);
end

