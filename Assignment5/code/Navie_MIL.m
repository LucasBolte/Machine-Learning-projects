clear
clc
path = '/Users/gaoxiaoxu/Dropbox/TU_Delft/Quarter4/Machine Learning/Assignment5/sivalsmall/apple/';
path2= '/Users/gaoxiaoxu/Dropbox/TU_Delft/Quarter4/Machine Learning/Assignment5/sivalsmall/banana/';
apple = dir(fullfile('sivalsmall','apple','*.jpg'));
banana = dir(fullfile('sivalsmall','banana','*.jpg'));

% apple
apple_cell = cell(length(apple),1);
for i=1:length(apple)
    img = imread(fullfile(path,[apple(i).name]));
    segement = extractinstances(img);
    apple_cell{i,1} = segement;
    fprintf('%i\n',i);
end
apple_label = ones(length(apple),1);

% banana
banana_cell = cell(length(banana),1);
for i=1:length(banana)
    img = imread(fullfile(path2,[banana(i).name]));
    segement = extractinstances(img);
    banana_cell{i,1} = segement;
    fprintf('%i\n',i);
end
banana_label = (-1)*ones(length(banana),1);







