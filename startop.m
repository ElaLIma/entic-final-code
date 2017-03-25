function startop(s,op)
%starStop Function that starts or stop the measures on the ROUV
if (op == 1) %Start
    %Sendind S for start the communication
    fprintf(s,'%s\n','S');
else %Stop
    fprintf(s,'%s\n','E');
end

end

