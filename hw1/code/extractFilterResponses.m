function [filterResponses] = extractFilterResponses(I, filterBank)
% CV Fall 2015 - Provided Code
% Extract the filter responses given the image and filter bank
% Pleae make sure the output format is unchanged. 
% Inputs: 
%   I:                  a 3-channel RGB image with width W and height H 
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W*H x N*3 matrix of filter responses

% Convert to WxHx3 matrix if grayscale
if(size(I,3) == 1)
    I = repmat(I, [1 1 3]);
end

%Convert input Image to Lab
doubleI = double(I);
[L,a,b] = RGB2Lab(doubleI(:,:,1), doubleI(:,:,2), doubleI(:,:,3));
pixelCount = size(doubleI,1)*size(doubleI,2);

%filterResponses:    a W*H x N*3 matrix of filter responses
filterResponses = zeros(pixelCount, length(filterBank)*3);

%for each filter and channel, apply the filter, and vectorize

% === fill in your implementation here  ===
% Setup loops
i = 1;
j = 1;
while(i < (length(filterBank)*3)) % Iterate over the filter bank
    % Convolve current filter with R, G, and B of image
    filterResponses(:,i) = reshape(imfilter(L,filterBank{j},'conv', 'symmetric', 'same'),pixelCount,1);
    filterResponses(:,i+1) = reshape(imfilter(a,filterBank{j},'conv', 'symmetric', 'same'),pixelCount,1);
    filterResponses(:,i+2) = reshape(imfilter(b,filterBank{j},'conv', 'symmetric', 'same'),pixelCount,1);
    i = i+3;
    j = j+1;
end

end
