% Label the year as Hot season or Cold season
load "Full_Dataset_Unprocessed";

N = Dataset_Unprocessed; p = size(N,1);
for i = 1:1:p
    j = 12 - N(i,2);
    if (3 <= j)&&(j <=8)
        N(i,15) = 1;
    else
        N(i,15) = 2;
    end
end