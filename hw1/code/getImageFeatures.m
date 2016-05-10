function [ h ] = getImageFeatures( wordMap, dictionarySize )
% CV Spring 2016 - Cole Gulino
% Generate a histogram given a word map
% Inputs: 
%   wordMap:            WxH image containing IDs of visual words
%   dictionarySize:     maximum visual word ID
% Outputs:
%   h:                  dictionarySize x 1 histogram that is L1 normalized

% return the histogram with probability normalization
[h, centers] = hist(wordMap, dictionarySize);
h = sum(h,2);
end

