% CV Spring 2016 - Cole Gulino
% Tests the system and builds the confusion matrix

% Preinitialize the confusion matrix
C = zeros(8,8);
% load the data needed
load('vision.mat');
load('../dat/traintest.mat');
source = '../dat/';
% Now create the confusion matrix
for i = 1:length(test_imagenames)
    image = im2double(imread([source, test_imagenames{i}]));
    wordMap = getVisualWords(image, filterBank, dictionary);
    h = getImageFeaturesSPM(2, wordMap, size(dictionary,2));
    distances = distanceToSet(h, train_features);
    [~,nnI] = max(distances);
    guess = train_labels(nnI);
    real = test_labels(i);
    C(real, guess) = C(real, guess) + 1;
end

% Now get accuracy
C
trace(C) / sum(C(:))