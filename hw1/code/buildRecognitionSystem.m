% CV Spring 2016 - Cole Gulino
% Build system to run recognition on
% Creates vision.mat containing:
%   filterBank:         bank of filters
%   dictionary:         visual word dictionary
%   train_features:     K(4^(L+1)-1)/3xN matrix of training histograms
%   train_labels:       1xN vector of training labels
 
% Get filterBank
filterBank = createFilterBank();

% Get dictionary
load('dictionary.mat');

% Load the training information
load('../dat/traintest.mat', 'train_imagenames', 'train_labels');

% Get the image files
source = '../dat/';
target = '../dat/';
K = 250;
H = K*(4^3-1)/3; % Size of array
train_features = zeros(H, length(train_imagenames));
for i=1:length(train_imagenames)
    load([target, strrep(train_imagenames{i},'.jpg','.mat')]);
    train_features(:,i) = getImageFeaturesSPM(2, wordMap, length(dictionary));
end
save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');
% %% Test images
% target = '../dat/';
% for i=1:length(test_imagenames)
%     guessImage([target, test_imagenames{i}]);
% end



