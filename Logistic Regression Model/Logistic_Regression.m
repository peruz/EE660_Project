% The Logistic regression model for the Project

Xtrain_s = standardizeCols(XTRAIN);
Xtest_s = standardizeCols(XTEST);

X = Xtrain_s;
y = ytrain;
ytest = ytest;
maxLambda    =  log10(lambdaMaxLasso(X, y));
paramRange  =  logspace(-2, maxLambda, 30);


fitFn = @(Xtrain_s, ytrain, param)...
    logregFit(X, y, 'lambda', param(1),'regType','L2');

predictFn = @logregPredict;
lossFn = @zeroOneLossFn;
nfolds = 10;

[LRmodel, bestParam, LRmu, LRse] = ...
    fitCv(paramRange, fitFn, predictFn, lossFn, Xtrain_s, y, nfolds);

% Training Error
yhat1 = logregPredict(LRmodel, Xtrain_s);
train_error = mean(yhat1 ~= y);

% Testing Error  
yhat = logregPredict(LRmodel, Xtest_s);
test_error = mean(yhat ~= ytest);
weight = LRmodel.w;
%% OUTPUT A TEXT FILE

fid = fopen('RESULT_LR2.txt','w');
fprintf(fid,'%s\t %15s\t\n','TERMS','VALUE');
term = {'INTERCEPT  ', 'MORNING    ','AFTERNOON  ','NIGHT      ','WEEKDAY    ','WEEKEND    ','HOT SEASON ','COLD SEASON', 'VOLTAGE    ','METER 1    ','METER 2    ', 'METER 3    '};
for i = 1:1:11
    fprintf(fid,'%s %13.4f\t\n',term{i},weight(i));
end
fprintf(fid,'\n\n');
 fprintf(fid,'%s %12.4f\t\n','TESTING ERROR', test_error);
fclose(fid);