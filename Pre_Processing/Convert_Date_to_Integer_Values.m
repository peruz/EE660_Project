% Convert the date to interger values.
load 'DATE.mat';
y = size(DATE,1);
for i = 1:1:y
    day = int2str(DATE(i,1));
    month = int2str(DATE(i,2));
    year = int2str(DATE(i,3));
    p = strcat(month,'-',day,'-',year);
    DATE(i,4) = weekday(p);
end