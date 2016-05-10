function [ wordMap ] = getVisualWords( I, filterBank, dictionary )
% CV Spring 2016 - Cole Gulino
% Generate a dictionary given a list of images
% Inputs: 
%   I:                  a MxNx3 RGB image
%   filterBank:         bank of filters
%   dictionary:         dictionary of visual words
% Outputs:
%   worldMap:           a MxN image with pixels = visual words

% Read in the image and put it through the filter bank
f = extractFilterResponses(I, filterBank);

% Find the indices with closest mark from filtered image
[D, in] = pdist2(dictionary', f, 'euclidean', 'smallest', 1);

% Create the visual word in WxH shape
W = size(I,2);
H = size(I,1);
wordMap = zeros(H, W);
in = in';
k = 1;
for i = 1:W
    for j = 1:H
        wordMap(j, i) = in(k,1);
        k = k + 1;
    end
end

end

