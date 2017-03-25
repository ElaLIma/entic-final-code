function sFile(data)
%sFile Function that save the data into a file, line by line
fid=fopen('results\resultats.txt','w');
fprintf(fid,'%s\n', data);
fclose(fid);
end

