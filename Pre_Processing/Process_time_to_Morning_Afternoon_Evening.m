% Convert time of the day to Morning, Afternon, or Evening
function [Full] = Process_Time(Full)
load 'Full';
p = size(Full,1);
for i = 1:1:p
    if (0 <= Full(i,5)) && (Full(i,5) <=480)
        Full(i,5) = 1;
    elseif (481 <= Full(i,5)) && (Full(i,5) <=1020)
        Full(i,5) = 2;
    else
        Full(i,5) = 3;
    end
end

