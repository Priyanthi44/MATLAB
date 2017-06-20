function generateDetectors

%generate synthetic data 
%y = linspace(x1,x2) returns a row vector of 100 evenly spaced points between x1 and x2.
%y = linspace(x1,x2,n) generates n points. The spacing between the points is (x2-x1)/(n-1).
clc;
% t = linspace(-4,4,1000);
% y = cos(t);

% for i =y 
%     if ~(i<0.5 &&i>-0.5)
%          %check if the data point is within the previous circles
%          % in a for loop
%          
%          pdecirc(i,i,abs(i-0.5));
%     end ;
% end ;
n=10;% number of detectors 

age =10;
eta_i =0.2; % adaptation rate

tau =0.3; % decay rate
i=0; % age of the detector
threshold=0.05; % shortest allowable distance to self data
dir =0;% direction to move 
count =0; % number of detectors 
c_nearest =1:10;

det =randn(10,1); % generate 10 detectors within the standards normal distribution 

y =linspace(-3,3,100);% self data
%y =randn(100,1);


j=1;
while  j<11
   currentDetector =det(j);
   
   a =1;
   c= abs(y(a)-currentDetector);
  
    %shortest distance from ditector
   for b =y
     if c > abs(b-currentDetector)
        c = abs(b-currentDetector);
        c_nearest(j) = b;
     end ;     
   end ;
   i=1;
    while c > threshold
          if i<age
            
              % direction to move 
              dir=(currentDetector-c_nearest(j))/(abs(currentDetector -c_nearest(j)));
              
             % move detector by eta  
             eta_i= eta_i* exp(-i/tau);
             currentDetector = currentDetector+dir *eta_i;
             det(j) =currentDetector;
             i= i+1;% increase age
             %recalculating the minimum distance
               for b =y
                 if c > abs(b-currentDetector)
                     c = abs(b-currentDetector);
                     c_nearest(j) =b;
                 end ;     
                 a =a+1;
                 
               end ;
          else
              % generate a new detector
              det(j)
              currentDetector =randn;
              det(j) =currentDetector;
              
              
          end;
        i=1;  
    end; 
 j=j+1;   
end; 
plot(c_nearest,det)
hold on
j =0; i=0;
 %TODO move detectors away
%  for k =det
%      if (k
%  end;
 
%         if d<threshold
%              
%         else
%         end;
%         
%       
%     end;
%     
%     j=j+1;
% end

end 