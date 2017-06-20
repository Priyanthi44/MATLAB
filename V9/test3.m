x;
y;
coder.varsize('x',[30000000]);
coder.varsize('y',[30000000]);
fid = fopen('01112001.txt');

tline = fgets(fid);

while ischar(tline)
    
   A = strsplit(tline);
    tline = fgets(fid);
    x =[x;str2double(A(27))];
    y=[y;str2double(A(29))];
    h = scatter(x(:,1),y(:,1),'bs', 'filled') ;
    set(h,'XData',x,'YData',y) ;
    drawnow
    pause(0.1)
end 


 
 y1=max(y);
 y2 =min(y);

 x1=max(x);
 x2=min(x); 
%Distance measures

 c_s1 =  (x1+x2)/2;
 c_s2=(y1+y2)/2;

if (abs(y1-y2)>abs(x1-x2))
    rs =abs(x1-x2);
else 
    rs =abs(y1-y2);
end 
ang=0:0.01:2*pi; 
xp=rs*cos(ang);
yp=rs*sin(ang);
plot(c_s1+xp,c_s2+yp);
hold on
plot(c_s1, c_s2, '.r', 'MarkerSize',09);


