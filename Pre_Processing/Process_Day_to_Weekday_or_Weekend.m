% Process day of the week to weekday or weekend
load "Full_Dataset_Unprocessed";
N = Dataset_Unprocessed; p = size(N,1);
p = size(N,1);
for i = 1:1:p
    if (N(i,4)==1)||(N(i,4)== 7)
        N(i,14) = 1;
    else
        N(i,14) = 2;
    end
end
