clc
clear all
close all

COMport='COM8';
arduino=oSPort(COMport);
%startop(arduino,1);


[d,t]=read1000(arduino);%Obtaining data from arduino
cSPort(arduino);


plot(t,d)
grid on;
title('Deph vs time');
xlabel('Time [ms]');
ylabel('Depth [m]')

startop(arduino,0);
sFile(rData);


