function [  ] = viewVisualWords( visualWords, filterBank )

W = 320; % Width
H = 240; % Height
newWord = [];
filters = [];
for i = 1:length(filterBank)
    filters(:,i) = filterBank{i};
end
for i = 1:76800 % Run over the pixels
    newWord(i,1) = pinv(filters')*visualWords(i,:);
end

newWord = reshape(newWord,[320, 240]);
colormap jet;
imagesc(newWord)
end

