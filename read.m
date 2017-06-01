function d = read( s )
%d detph
adcr=fscanf(s,'%d');
d=depth(adcr(num));
end