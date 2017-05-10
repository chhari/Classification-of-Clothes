convnet = helperImportMatConvNet('cnnmatfile.mat');
imds = imageDatastore('AsadData', 'IncludeSubfolders', true,...
    'LabelSource', 'foldernames');
imds.ReadFcn = @(filename)readAndPreprocessImage(filename);
[trainingImages, testImages] = splitEachLabel(imds, 0.8, 'randomize');
layers = convnet.Layers;
layers(21) = fullyConnectedLayer(5);
layers(23) = classificationLayer;
opts = trainingOptions('sgdm', 'InitialLearnRate', 0.001, 'MaxEpochs', 15, 'MiniBatchSize', 64);
myNet = trainNetwork(trainingImages, layers, opts);
save('trainednet.mat','myNet');
%% 
predictedlabels = classify(myNet,testImages);
accuracy = mean(predictedlabels == testImages.Labels);

