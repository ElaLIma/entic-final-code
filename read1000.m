function [d,t] = read1000( s )
%read Function that reads 1000 values data send by the arduino

adcr(0)=fscanf(s,'%3d');
d(0)=depth(adcr(0));

for i=1:1000
    adcr(i)=fscanf(s,'%3d');
    d(i)=depth(adcr(i));
end
t=0:200:lenght(addcr);
end

