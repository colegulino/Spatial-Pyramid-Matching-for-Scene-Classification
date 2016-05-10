function [ h ] = getImageFeaturesSPM( layerNum, wordMap, dictionarySize )
% CV Spring 2016 - Cole Gulino
% Generate a dictionary given a list of images
% Inputs: 
%   layerNum            number of layers in the spatial pyramid
%   wordMap:            WxH image containing IDs of visual words
%   dictionarySize:     maximum visual word ID
% Outputs:
%   h:                  K(4^(L+1) - 1)/3 dimension vector
%                           K = Visual Words
%                           L = Layers => Here L = 2

%==========================================================================
% Start with layer 2: l = 2
% 1. break up into 16 cells
% 2. Get histograms for each cell
% 3. Store them
%==========================================================================
% Get constants for l = 2
W = size(wordMap, 2); % Size of wordMap width (columns)
H = size(wordMap, 1); % Size of wordMap hieght (rows)
h = [];
for l = 0:layerNum
    % Get the histograms for the finest layer
    w_step = floor(W / (2^(l)));
    h_step = floor(H / (2^(l)));
    if(l == 0)
        histo = getImageFeatures(wordMap, dictionarySize);
        weight = 2^(-layerNum);
        h = [h; weight*histo];
    else
        for i = 1:w_step-1:(W-w_step)
            for j = 1:h_step-1:(H-h_step)
                if((i+w_step) > W)
                    endI = W;
                else
                    endI = i + w_step;
                end
                if((j+h_step) > H)
                    endJ = H;
                else
                    endJ = j + h_step;
                end
                histo = getImageFeatures(wordMap(j:endJ, i:endI), dictionarySize);
                if(l == 1)
                    weight = 2^(-layerNum);
                else
                    weight = 2^(l-layerNum - 1);
                end
                h = [h; weight*histo];
            end
        end
    end
end

h = h./norm(h,1);
end
