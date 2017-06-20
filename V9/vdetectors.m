function vdetectors(u1,u2)

%% #codegen
coder.extrinsic('clc');
persistent detSet N  x n  Y ;

  
 

detSet=[0 0 0];

coder.varsize('detSet',[30000000 3]);
coder.varsize('X',[30000000 2]);

if isempty(N)&&isempty(x)&&isempty(n)
N=0; % count of not self
 
x=0; % count of not self 
p=0.8; % default probability 
n =(max(5/p, 5/(1-p)));
 % sample size/ total number of data
% detected occurances

end

z_alpha =3.49;
 

for i=1:1
 
    Y =cat(1,Y,readNormalLinebyLine(strcat('normal/' ,int2str(i),'.txt')));%,57275,57550);  #
    

end 

%% Generating the detector set 
% in oder to generate the detectors 
% sample size n, p and alpha has to be chosen,
%%
z =0; 
while z<z_alpha
    % Randomly generate a,b
    r = randi([0 100],1,2);
    a=r(1);
    b=r(2);
    %find the closest self point 
    [e,d]=knnsearch(Y,[a,b],'k',1,'distance','euclidean');
   if d>1
        N =N+1;  
        
    if (size(detSet) >2)
         %find the closest detector
           X = detSet(: , 1:2) ;
          [ee,dd]=knnsearch(X,[a,b],'k',1,'distance','euclidean')
          detSet(ee, 3)
          if (dd> detSet(ee, 3))&& ~(N==n)
              %covered =false; 
              detSet=[detSet; [a b d]]
              circle(a,b,d); 
%               x =x+1;
          else
              if (N==n)
                  %% need to understand why nonself point x is set to zero
                 N=0;
                 x=0;
              else
                  if n>0
              %covered =true;
                x=x+1;
               % p =x/n; % probability of not self
                q= 1-p;
                z=x/sqrt(n*p*q)-sqrt(n*p/q);
                % evaluate z score
                  end 
              end 
                    
               
              
                
                    if(N==n) 
                        %% Accept all saved candidates as new detectors
                        N=0;
                        x=0;
                    
                        
                    end 
               
               
          end 
%            
    else
        %first detector
       detSet=[detSet; [a b d]]; 
       circle(a,b,d); 
%        x=x+1;
    end
   end 
end 
    
%% Testing stage 
for i=1:1
    fid = fopen('faulty/30102001.txt');

tline = fgets(fid);


while ischar(tline)
    
   
    
   A = strsplit(tline);
    tline = fgets(fid);
    %if (str2double(A(1)) >from && str2double(A(1))<to)
    a =str2double(A(27));
    b=str2double(A(29)); 
    X = detSet(: , 1:2) ;
    [ee,dd]=knnsearch(X,[a,b],'k',1,'distance','euclidean');
    %ee index of X which has the value of the nearest and dd is the
    %distance between the two points
          if (dd< detSet(ee,3))
              
               plot(a ,b , '.r', 'MarkerSize',09);
              drawnow;
         
          end 
 end
 
end 
 
 

 function circle(x,y,r)
%x and y are the coordinates of the center of the circle
%r is the radius of the circle
%0.01 is the angle step, bigger values will draw the circle faster but
%you might notice imperfections (not very smooth)
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
plot(x+xp,y+yp);
hold on

function h = filledCircle(center,r,N,color)
THETA=linspace(0,2*pi,N);
RHO=ones(1,N)*r;
[X,Y] = pol2cart(THETA,RHO);
X=X+center(1);
Y=Y+center(2);
h=fill(X,Y,color);
axis square;

function [u1,u2]= readLinebyLine(filename) %, from, to)
      fid = fopen(filename);

tline = fgets(fid);
while ischar(tline)
    
   A = strsplit(tline);
    tline = fgets(fid);
    %if (str2double(A(1)) >from && str2double(A(1))<to)
    u1 =str2double(A(27));
    u2=str2double(A(29));
  
   % end
end


fclose(fid);
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
