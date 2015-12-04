[styles, colors, symbols] = plotColors();
plotArgs = {'linewidth', 1.5, 'markersize', 8}; 
X = X_Clustering;
setSeed(1);
K = 3;

[mu, Z] = kmeansFit(X, K);
    for c = 1:K
        ndx = Z==c;
        marker = [symbols(c+1), colors(c+1)];
        figure(1);
        plot(X(ndx, 1), X(ndx, 5), marker, plotArgs{:});
        hold on; xlabel('Sub-Metering 1'); ylabel('Avergae Power Consumed per minute');figure(2);
        plot(X(ndx, 2), X(ndx, 5), marker, plotArgs{:});
        hold on; xlabel('Sub-Metering 2'); ylabel('Average Power Consumed per minute');figure(3);
        plot(X(ndx, 3), X(ndx, 5), marker, plotArgs{:});
        hold on; xlabel('Sub-Metering 3'); ylabel('Average Power Consumed per minute');figure(4);
        plot(X(ndx, 4), X(ndx, 5), marker, plotArgs{:});
        hold on; xlabel('Unmetered Power'); ylabel('Average Power Consumed per minute');
    end

fid = fopen('RESULT_CLUSTER.txt','w');
fprintf(fid,'%s\t %15s\t\n','TERMS','MEAN');
term = {'CLUSTER 1  ', 'CLUSTER 2  ','CLUSTER 3   '};
for i = 1:1:K
    fprintf(fid,'%s %13.4f %13.4f %13.4f %13.4f\t\n',term{i},mu(1,i),mu(2,i),mu(3,i),mu(4,i));
end
fprintf(fid,'\n\n');
fclose(fid);