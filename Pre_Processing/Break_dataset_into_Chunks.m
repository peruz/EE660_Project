% This code divides the entrie dataset into smaller chunks that can be
% handled by MATLAB and Microsoft Excel. I saved the smaller chunks as
% "A1.txt", "A2.txt", "A3.txt", and "A4.txt".


    fid = fopen('Data.txt'); 
    fileID = fopen('A1.txt','w');
    tline = fgetl(fid);
    t = tline;
    fprintf(fileID,tline);
    i = 1;
    while(i < 500000)
        tline = fgetl(fid);
        fprintf(fileID, '\n%s',tline);
        i = i+1;
    end
    fclose(fileID);
    fileID = fopen('A2.txt','w');
    tline = fgetl(fid);
    fprintf(fileID,t);
    fprintf(fileID,tline);
     while(i < 1000000)
        tline = fgetl(fid);
        fprintf(fileID, '\n%s',tline);
        i = i+1;
     end
    fclose(fileID);
    fileID = fopen('A3.txt','w');
    fprintf(fileID,t);
    tline = fgetl(fid);
    fprintf(fileID,tline);
     while(i < 1500000)
        tline = fgetl(fid);
        fprintf(fileID, '\n%s',tline);
        i = i+1;
     end
    fclose(fileID);
    fileID = fopen('A4.txt','w');
    fprintf(fileID,t);
    tline = fgetl(fid);
    fprintf(fileID,tline);
     while(i < 2000000)
        tline = fgetl(fid);
        fprintf(fileID, '\n%s',tline);
        i = i+1;
     end
    fclose(fileID);