
function startop(s,op)
%starStop Function that starts or stop the measures on the ROUV
if (op == 1) %Start
    %Sendind S for start the communication
    fprintf(s,'S');
end
if (op==0) %Stop
    fprintf(s,'E');
end

end

