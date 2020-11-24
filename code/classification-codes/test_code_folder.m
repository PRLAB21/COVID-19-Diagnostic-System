datapath = 'dataset/classification/corona-CT-resize';

% Image Datastore
imds = imageDatastore(datapath, ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

% Determine the split up
total_split = countEachLabel(imds);
num_images = length(imds.Labels);

% Visualize random 20 images
perm = randperm(num_images,20);
train_percent = 0.80;
[imdsTrain,imdsTest2] = splitEachLabel(imds,train_percent,'randomize');
% Split the Training and Validation
valid_percent = 0.2;
[imdsValid12_1,imdsTrain1] = splitEachLabel(imdsTrain,valid_percent,'randomize');
train_split = countEachLabel(imdsTrain1);
% Define the new layers
numClasses = numel(categories(imdsTrain1.Labels));
% New layers
imdsTrain1.ReadFcn = @(filename)(preprocess_COVID_image(filename,[156,156]));
imdsValid12_1.ReadFcn = @(filename)(preprocess_COVID_image(filename,[156,156]));
imdsTest2.ReadFcn = @(filename)(preprocess_COVID_image(filename,[156,156]));
load('trained-models/model-covid19-classification.mat','Custom_netresnet18_CT_Corona_DWT_W1');
disp(class(imdsTest2));
[predicted_labels,posterior] = classify(Custom_netresnet18_CT_Corona_DWT_W1,imdsTest2);
actual_labels = imdsTest2.Labels;
accuracy = sum(predicted_labels == actual_labels) / numel(actual_labels);
% Confusion Matrix
figure;
plotconfusion(actual_labels,predicted_labels);
confMat = confusionmat(actual_labels,predicted_labels);
title('Confusion Matrix: COV-CTNet');
test_labels = double(nominal(imdsTest2.Labels));
% ROC Curve - Our target class is the first class in this scenario.
[fp_rate_R18,tp_rate_R18,T,AUC] = perfcurve(test_labels,posterior(:,1),1, 'XCrit', 'tpr', 'YCrit', 'prec');
confMat = bsxfun(@rdivide,confMat,sum(confMat,2));
% mean(diag(confMat))
TP = confMat(1,1);
FP = confMat(1,2);
FN = confMat(2,1);
TN = confMat(2,2);
P = TP+FN;
N = FP+TN;
recall_1 = (TN./(TN+FP))*100;
accuarcy_1 = ((TP+TN)/(P+N))*100;
Sensitivity_1 = (TP/P)*100;
Specificity_1 = (TN/N)*100;
Precision = TP./(TP+FP)*100;
FPR = 1-Specificity_1;
beta = 1;
F1_score = ((2*Precision*Sensitivity_1)/(Precision+Sensitivity_1))*100;
MCC = [( TP.*TN - FP.*FN ) ./ ( ( (TP+FP).*P.*N.*(TN+FN) ).^(0.5) );( FP.*FN - TP.*TN ) ./ ( ( (TP+FP).*P.*N.*(TN+FN) ).^(0.5) )] ;
%             MCC=max(MCC);
% save ('COV-CTNet.mat','fp_rate_R18','tp_rate_R18','TP','FP','TN','FN','accuracy','AUC','Sensitivity_1','accuarcy_1','recall_1','Specificity_1','Precision','FPR','F1_score','MCC');
figure;
plot(fp_rate_R18,tp_rate_R18,'b-');hold on;
grid on;
xlabel('Recall')
ylabel('Precision')
title('Custom_netresnet18_CT_Corona');
