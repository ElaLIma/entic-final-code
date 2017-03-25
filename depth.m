function d = depth( aDCR )
%aVM Function that converts the ADC reading to a decimal value
%   aVM: analogic voltage measured
%   aDCR: ADC reading

s=0.2;
res=1023;
sysV=5;
a=(sysV*aDCR)/res; %Conversion of the ADC reading value to a voltage
p=a/s; %Conversion of the voltage given by the sensor to a valid a presion

d=(p*10)/(100e5/0.986); %The deph is obtain through the known pressure at 10m of deph by a rule of three
end

