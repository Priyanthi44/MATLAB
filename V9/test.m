fid = fopen('01112001.txt');

tline = fgets(fid);
while ischar(tline)
    
   A = strsplit(tline);
    tline = fgets(fid);
    A(2)
    A(3)
end

fclose(fid)