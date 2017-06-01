function [d,t] = read1000( s )
%read Function that reads 1000 values data send by the arduino
%d detph
%t time
num=1;
d(num)=0;
t(num)=0;

adcr(num)=fscanf(s,'%d');
d(num)=depth(adcr(num));

while (num<=1000)
    num=num+1;
    t(num)=t(num-1)+200;
    adcr(num)=fscanf(s,'%d');
    d(num)=depth(adcr(num));
end

end

