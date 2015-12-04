% Encding the Time, Day, and Year into binary features for Regression
load "Full_Dataset_Unprocessed";

N = Dataset_Unprocessed; 
p = size(N,1);
 INPUT = zeros(p,3);
 for i = 1:1:p
     % Map time of the day
     if (N(i,5) == 1)
         INPUT(i,1:3) = [1,0,0];
     elseif (N(i,5) == 2)
         INPUT(i,1:3) = [0,1,0];
     else
         INPUT(i,1:3) = [0,0,1];
     end
     % Map weekday or weekend
     if(N(i,14) == 1)
         INPUT(i,4:5) = [1,0];
     else
         INPUT(i,4:5) = [0,1];
     end
     % Map season of the year
     if(N(i,15) == 1)
         INPUT(i,4:5) = [1,0];
     else
         INPUT(i,4:5) = [0,1];
     end
 end
 