clc
clear all
close all

COMport='COM1';
s=oSPort(COMport);
startop(s,1);


[d,t]=read1000(s);%Obtaining data from arduino
cSPort(s);

title('Deph vs time');
xlabel('Time [hh:mm:ss]');
ylabel('Depth [m]')
plot(t,d)
grid on;

startop(s,0);
sFile(rData);


