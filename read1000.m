function adcr = read1000( s )
%read Function that reads 1000 values data send by the arduino

adcr(0)=fscanf(s,'%3d');
for i=1:1000
    adcr(i)=fscanf(s,'%3d');
end
end

