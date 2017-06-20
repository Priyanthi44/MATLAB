%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%                  V-Detectors Algorithm
%                  
%                  Naive Estimation 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Experimented self radius (Diameter)
rs_max =11.4591559045;
rs_min =11.4591559010;

%Distance measures
dist_min=0;
temp_dist=0;

% Estimated coverage 99% 
%%%% NAIVE ESTIMATION%%%%
m_max =100;

%Until N ==m_max
N=0;
i=0; %# of detectors

%Selected point 
p=0;
x=0; % occarance 
n=0; % sample size

% Detector set Key value pair (Center, radius)
detSet = containers.Map('KeyType','double','ValueType','double');

% Outside the self
if (N<m_max) % exit criterion 
     
    if (p >rs_max || p < rs_min)
        
         
    
        if (i==0) % first detector
            i=i+1;
            if(p >rs_max)
                detSet(p)=abs (p-rs_max);
            else
                detSet(p)=abs (p-rs_min);
            end 
            
        else % not the first detector
            v =values(detSet);
            k =keys(detSet);
            temp_dist = abs (k{1}-p) ;
            a =1; % default mark of the map
            N =N+1; %% Start increasing  
            %finding the minimum distance to the point selected
            for j=1: length(v)
               
                if(j>1)
                    dist_min = abs (k{j}-p) ;
                    if dist_min<temp_dist
                        a =j; % mark the index of the map
                        temp_dist =dist_min; % save the smallest amount to be minimum
                    end 
                end 
                
            end 
        end 
        
     end     
end 
 


