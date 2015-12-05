[styles, colors, symbols] = plotColors();
plotArgs = {'linewidth', 1.5, 'markersize', 8}; 
X = X_Clustering;
%setSeed(1);
K = 3;
m = (mean(X,1))';
den = 0;
[mu, Z] = kmeansFit(X, K);
N = size(X,1);
    for c = 1:K
        ndx = (Z==c);
        marker = [symbols(c+1), colors(c+1)];
        %figure(1);
        %plot(X(ndx, 1), X(ndx, 5), marker, plotArgs{:});
        %hold on; xlabel('Sub-Metering 1'); ylabel('Avergae Power Consumed per minute');figure(2);
        %plot(X(ndx, 2), X(ndx, 5), marker, plotArgs{:});
        %hold on; xlabel('Sub-Metering 2'); ylabel('Average Power Consumed per minute');figure(3);
        %plot(X(ndx, 3), X(ndx, 5), marker, plotArgs{:});
        %hold on; xlabel('Sub-Metering 3'); ylabel('Average Power Consumed per minute');figure(4);
        %plot(X(ndx, 4), X(ndx, 5), marker, plotArgs{:});
        %hold on; xlabel('Unmetered Power'); ylabel('Average Power Consumed per minute');
        num(c) = sum(ndx)* (norm(mu(:,c)-m))^2 ;
        a = find(ndx == 1);
        d = (mu(:,c))';
        p = 0;
        Xh = X(a,:);
        for j = 1:1:sum(ndx)
            p = p + (norm((Xh(j,:) - ((mu(:,c))'))))^2;
        end
        den = den + p;
    end

    num = sum(num)*(1/(K-1));
    den = den / (N - K);
    CH_K = num/den;
    
fid = fopen('RESULT_CLUSTER.txt','w');
fprintf(fid,'%s\t %15s %15s %15s %15s %15s\t\n','TERMS','METER 1    ','METER 2    ', 'METER 3    ', 'UNMETERED  ', 'TOTAL POWER' );
term = {'CLUSTER 1  ', 'CLUSTER 2  ','CLUSTER 3   '};
for i = 1:1:K
    fprintf(fid,'%s %13.4f %13.4f %13.4f %13.4f %13.4f\t\n',term{i},mu(1,i),mu(2,i),mu(3,i),mu(4,i),mu(5,i));
end
fprintf(fid,'\n');
fprintf(fid,'%s %12.4f\t\n','CALINSKI AND HARABASZ INDEX is', CH_K);
fprintf(fid,'\n');
fclose(fid);