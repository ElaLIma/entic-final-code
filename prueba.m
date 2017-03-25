clc
clear all
close all

COMport='COM1';
s=oSPort(COMport);
startop(s,1);


adcr=read1000(s);%Obtaining data from arduino
t=0:200:lenght(addcr);

cSPort(s);

d(0)=depth(adcr(0));

for i=1:length(adcr)
    d(i)=depth(adcr(i));
end

title('Deph vs time');
xlabel('Time [hh:mm:ss]');
ylabel('Depth [m]')
plot(t,d)
grid on;

startop(s,0);
sFile(rData);


