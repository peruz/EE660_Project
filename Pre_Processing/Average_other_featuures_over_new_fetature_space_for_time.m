% Find the average of values after redefining time
load "Full_Dataset_Unprocessed";
N = Dataset_Unprocessed; p = size(N,1);
M = [];
a = size(N,1);
sum_m = zeros(1,7);
ch_d = N(1,1:5);
g = 0;

for i = 1:1:a
    j = sum(ch_d == N(i,1:5));
    if j== 5
        sum_m = sum_m + N(i,6:12);
        g = g+1;
    else
        A = (1/g)*sum_m;
        B = [ch_d,A];
        M = [M;B];
        ch_d = N(i,1:5);
        g =1;
        sum_m = N(i,6:12);
    end;
end
        
        
