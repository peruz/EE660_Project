% Estimate Unmetered Power in the House
load 'Full_Data_Unprocessed';
N = Data_Unprocessed;
p = size(N,1);
for i = 1:1:p
    a = (N(i,6)*1000/60) - N(i,10) - N(i,11) - N(i,12);
    N(i,13) = a;
end