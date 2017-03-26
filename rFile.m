function data = rFile()
%rFile function that read file from a file
fid = fopen('results\resultats.txt','r');
formatSpec = '%s';

sizeA = [Inf 1];

data = fscanf(fid,formatSpec,sizeA);

fclose(fid);
end

