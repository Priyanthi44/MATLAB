 
fid = fopen('30102001.txt');

tline = fgets(fid);
while ischar(tline)
    
   A = strsplit(tline);
    tline = fgets(fid);
    if ~(str2double(A(1)) >57340 && str2double(A(1))<57890)
    x =[x;str2double(A(27))];
    y=[y;str2double(A(29))];
    h = plot(x,y) ;
    %set(h,'XData',x,'YData',y) ;
    %drawnow
    pause(0.1)
    end
end 
