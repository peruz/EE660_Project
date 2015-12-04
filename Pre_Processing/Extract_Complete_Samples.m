% This code seperates the missing samples into a file and the complete
% samples into another file.

fid = fopen('A1.txt');
fileID = fopen('A1_complete.txt','w');
fileID1 = fopen('A1_missing.txt','w');
tline = fgetl(fid);
t = tline;
fprintf(fileID,tline);
fprintf(fileID1,tline);
while ischar(tline)
    tline = fgetl(fid);
    check = strfind(tline,'?');
    if sum(size(check))== 0
        fprintf(fileID,'\n%s',tline);
    else
        fprintf(fileID1,'\n%s',tline);
    end
end
fclose(fileID);
fclose(fileID1);

%SEPARATE THE SECOND FILE 
fid = fopen('A2.txt');
fileID = fopen('A2_complete.txt','w');
fileID1 = fopen('A2_missing.txt','w');
tline = t;
fprintf(fileID,tline);
fprintf(fileID1,tline);
while ischar(tline)
    tline = fgetl(fid);
    check = strfind(tline,'?');
    if sum(size(check))== 0
        fprintf(fileID,'\n%s',tline);
    else
        fprintf(fileID1,'\n%s',tline);
    end
end
fclose(fileID);
fclose(fileID1);

%SEPARATE THE THIRD FILE 
fid = fopen('A3.txt');
fileID = fopen('A3_complete.txt','w');
fileID1 = fopen('A3_missing.txt','w');
tline = t;
fprintf(fileID,tline);
fprintf(fileID1,tline);
while ischar(tline)
    tline = fgetl(fid);
    check = strfind(tline,'?');
    if sum(size(check))== 0
        fprintf(fileID,'\n%s',tline);
    else
        fprintf(fileID1,'\n%s',tline);
    end
end
fclose(fileID);
fclose(fileID1);

%SEPARATE THE FOURTH FILE 
fid = fopen('A4.txt');
fileID = fopen('A4_complete.txt','w');
fileID1 = fopen('A4_missing.txt','w');
tline = t;
fprintf(fileID,tline);
fprintf(fileID1,tline);
while ischar(tline)
    tline = fgetl(fid);
    check = strfind(tline,'?');
    if sum(size(check))== 0
        fprintf(fileID,'\n%s',tline);
    else
        fprintf(fileID1,'\n%s',tline);
    end
end
fclose(fileID);
fclose(fileID1);