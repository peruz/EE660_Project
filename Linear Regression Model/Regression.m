% This is the Code for the Regression Model (Using both Ridge regression
% and Lasso regression.

Xtrain_s = (Xtrain);

[X,mu] = standardizeCols(Xtrain_s);
y = (ytrain);
ytrain_s = y;
Xtest_s = standardizeCols (Xtest);
ytest = ytest;
paramRange = 1:0.05:10;

%------------------LASSO REGRESSION----------------------------
%--------------------------------------------------------------
fitFn = @(Xtrain_s, ytrain, param)...
   linregFit(X, y, 'lambda', param,'regtype','L1');
predictFn = @linregPredict;
lossFn = @squaredErrorLossFn;
nfolds = 5;
[LRmodel_l1, bestParaml1, LRmu, LRse] = ...
    fitCv(paramRange, fitFn, predictFn, lossFn, Xtrain_s, ytrain_s, nfolds);
% Training Error
yhat1 = linregPredict(LRmodel_l1, X);
mse_train(1) = mean(squaredErrorLossFn(yhat1, ytrain_s));
% Testing Error  
yhat = linregPredict(LRmodel_l1, Xtest_s);
mse_test(1) = mean(squaredErrorLossFn(yhat, ytest));
figure(2);
scatter3(Xtest(:,1), Xtest(:,2),yhat);
%-----------------RIDGE REGRESSION----------------------------
%-------------------------------------------------------------
fitFn = @(Xtrain_s, ytrain, param)...
   linregFit(X, y, 'lambda', param,'regtype','L2');
predictFn = @linregPredict;
lossFn = @squaredErrorLossFn;
nfolds = 5;
[LRmodel_l2, bestParaml2, LRmu, LRse] = ...
    fitCv(paramRange, fitFn, predictFn, lossFn, Xtrain_s, ytrain_s, nfolds);
% Training Error
yhat1 = linregPredict(LRmodel_l2, X);
mse_train(2) = mean(squaredErrorLossFn(yhat1, ytrain_s));
% Testing Error  
yhat = linregPredict(LRmodel_l2, Xtest_s);
mse_test(2) = mean(squaredErrorLossFn(yhat, ytest));

%% OUTPUT A TEXT FILE

fid = fopen('RESULT.txt','w');
fprintf(fid,'%s\t %15s\t\t %9s\t\n','TERMS','Lasso', 'Ridge');
term = {'INTERCEPT  ', 'MORNING    ','AFTERNOON  ','NIGHT      ','WEEKDAY    ','WEEKEND    ','HOT SEASON ','COLD SEASON', 'VOLTAGE    ','INTENSITY  ','METER 1    ','METER 2    ', 'METER 3    '};
for i = 1:1:13
    fprintf(fid,'%s %13.4f\t\t %10.4f\t\n',term{i},LRmodel_l1.w(i),LRmodel_l2.w(i));
end
fprintf(fid,'\n\n');
 fprintf(fid,'%s %12.4f\t\t %10.4f\t\n','TESTING ERROR',mse_test(1),mse_test(2));
fprintf(fid,'\n');
 fprintf(fid,'%s %12.4f\t\t %10.4f\t\t %10.4f\t\n','TRAINING ERROR',mse_train(1),mse_train(2));
 fprintf(fid,'\n');
 fprintf(fid,'%s %12.4f\t\t %10.4f\t\t %10.4f\t\n','REGULARIZATION TERM',LRmodel_l1.lambda, LRmodel_l2.lambda);
fclose(fid);

