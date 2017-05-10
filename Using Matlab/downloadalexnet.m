cnnURL = 'http://www.vlfeat.org/matconvnet/models/beta16/imagenet-caffe-alex.mat';
cnnMatFile = 'cnnmatfile.mat';
if ~exist(cnnMatFile, 'file')
    disp('Downloading pre-trained CNN model...');
    websave(cnnMatFile, cnnURL);
end
