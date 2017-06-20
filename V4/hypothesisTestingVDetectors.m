%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%%                 V-Detectors Algorithm
%                  
%%                 Hypothesis Testing and Estimation 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Experimented self radius (Diameter)
rs_max =11.4591559045;
rs_min =11.4591559010;

%%Distance measures
dist_min=0;
temp_dist=0;



%Until N ==m_max
N=0; % count of not self
i=0; %# of detectors


p=0.5; % default probability 
x=0; % %Selected point /occarance 
n=0; % sample size/ total number of data
m =0; % detected occurances
n_sample=10; % predefined sample size


% Detector set map(Key value pair diameter)
% detSet = containers.Map('KeyType','double','ValueType','double');


% Estimated coverage 99% 
%%%% Hyppthesis testing %%%%
m_max =max(5/p, 5/(1-p);
z_alpha =3.49
% Sample a point 
%%
%"x =input"
% if (N<m_max) % exit criterion 
%      n =n+1; % count the sample size
%     if (x >rs_max || x < rs_min)
%         %%--------not-self-------
%         N=N+1; % count not self sample
%         if (i==0) % first detector
%             i=i+1;
%             % addthe first detector to the map
%             if(x >rs_max)
%                 detSet(rs_max)=x;
%             else
%                 detSet(x)=rs_min;
%             end 
%             
%         else 
%             %%%---Covered?---%%%
%             k =keys(detSet);
%             temp_dist = abs (k{1}-p) ;
%             key =1; % default mark of the map
%             %finding the minimum distance to the point selected
%             for j=1: length(k) 
%                      temp_dist= abs (k{j}-x) ;
%                     if temp_dist<dist_min
%                         key =k{j}; % mark the index of the map
%                         dist_min=temp_dist ; % save the smallest amount to be minimum
%                     end    
%             end 
%             %Check if it is within the raduis of the closest detector
%             %% Covered?
%             if detSet(key)>dist_min
%                  
%                 m=m+1; % count covered sample
%                 p =N/n; % probability of not self
%                 q= 1-N/n;
%                 z=m/sqrt(n*p*q)-sqrt(n*p/q); % evaluate z score
%                 if z<z_alpha % not enough coverage
%                     if(N==n_sample) 
%                         %% Accept all saved candidates as new detectors
%                         N=0;
%                         m=0;
%                     else 
%                         
%                     end 
%                 else %enough coverage
%                     N=m_max+1; % exist the function
%                 end 
%             else 
%                 %% save the candidate
%                 detSet(x) = dist_min;
%             end    
%         end 
%         
%      end     
end 
 


