%% Function to Open a COM port

function s = oSPort(COMPort)
s=serial(COMPort,'BaudRate',9600,'Terminator','CR/LF');
fopen(s);
end
