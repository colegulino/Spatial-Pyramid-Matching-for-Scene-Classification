function [ filterBank, dictionary ] = getFilterBankAndDictionary( image_names )
% CV Spring 2016 - Cole Gulino
% Generate a dictionary given a list of images
% Inputs: 
%   image_names:        a dictionary of file paths to images
% Outputs:
%   filterBank:         a cell array of N filters
%   dictionary:         a dictionary of visual words

% Set the constants
K = 250; % K-value in K-means clustering
alpha = 300; % Alpha value for getting pixels
filterBank = createFilterBank();
% Pre-initialize filter_responses
filter_responses = zeros((alpha*length(image_names)), 60);
% Generate the filter responses
j = 1;
for i = 1:length(image_names)
    % Load the image and get filter responses
    filt = (extractFilterResponses( ...
        imread(strcat('../dat/', image_names{i})), filterBank));
    pixelCount = size(filt,1);
    rp = sort(randperm(pixelCount,alpha)); % Get random permutation of row numbers
    filter_responses(j:alpha-1 + j,:) = filt(rp,:);
    j = j + alpha;
end

% Use K-means clustering
[~, dictionary] = kmeans(filter_responses, K, 'EmptyAction', 'drop');
dictionary = dictionary';
end

