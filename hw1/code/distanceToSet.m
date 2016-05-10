function [ histInter ] = distanceToSet( wordHist, histograms )
% CV Spring 2016 - Cole Gulino
% Find the closest match of the test set to a training set image
% Inputs: 
%   wordHist:           K(4^(L+1)-1)/3 x 1 vector of features
%   histograms:         K(4^(L+1)-1)/3 x T vector of T features like wordHist
% Outputs:
%   histInter:          K*4^(L+1)-1)/3 x 1 vector of intersection simularities         

% Repeat wordHist to make it the same size as histograms
size(histograms)
size(wordHist)
wordHist = repmat(wordHist, [1, size(histograms,2)]);
histInter = sum(bsxfun(@min, wordHist, histograms));
end
