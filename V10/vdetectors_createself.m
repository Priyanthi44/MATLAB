function vdetectors_createself()
t = cputime;
%% #codegen
coder.extrinsic('clc');
persistent Y;

  
 



 

for i=1:20
 
    Y =cat(1,Y,readNormalLinebyLine(strcat('normal/' ,int2str(i),'.txt')));%,57275,57550);  #
    csvwrite('csvlist.dat',Y);


end 


function Y= readNormalLinebyLine(filename) %, from, to)
      fid = fopen(filename);
Y =[0 0];
tline = fgets(fid);
while ischar(tline)
    
   A = strsplit(tline);
    tline = fgets(fid);
    %if (str2double(A(1)) >from && str2double(A(1))<to)
    u1 =str2double(A(27));
    u2=str2double(A(29));
    Y =[ Y;horzcat(u1,u2)];
   % end
end

Y =unique(Y,'rows');

fclose(fid);
