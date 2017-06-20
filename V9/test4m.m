u1 = zeros(1,1,'uint32');
u2 = zeros(1,1,'uint32');
coder.varsize('u1',[30000000]);
coder.varsize('u2',[30000000]);

for i=1:20
fid = fopen(strcat('18\',int2str(i),'.txt'));

tline = fgets(fid);
while ischar(tline)
    
   A = strsplit(tline);
    tline = fgets(fid);
%    if ~(str2double(A(1))> 57275 && str2double(A(1))<57550)
       % self sample 
    u1 =[u1;str2double(A(6))];
    u2=[u2;str2double(A(7))];
     h = scatter(u1,u2) ;
    set(h,'XData',u1,'YData',u2) ;
    %drawnow
    
%    end 
end
end 
u1 =unique(u1);
u2=unique(u2);
min_u1= min(u1)
max_u1 =max(u1)
avg_u1=mean(u1)
min_u2=min(u2)
max_u2=max(u2)
avg_u2= mean(u2)




   