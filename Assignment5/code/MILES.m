
% addpath Users/gaoxiaoxu/Dropbox/TU_Delft/Quarter4/prtools/@prdataset
clear
clc
load apple_cell.mat
load banana_cell.mat
bags = [apple_cell;banana_cell];
baglab = [ones(length(apple_cell),1);(-1)*ones(length(banana_cell),1)];
dataset = bags2dataset(bags,baglab);

instance = dataset.data;
labels = dataset.nlab;
m= bagembed(bags,instance);
m_lab = [ones(length(apple_cell),1);(-1)*ones(length(banana_cell),1)];
dataset_miles = bags2dataset(m,m_lab);


% x = dataset_miles.data;

acc_set = [];
for i = 1:10
[A,B,IA,IB] = gendat(dataset_miles,0.7);
[w,C] = liknonc(A)
a = labeld(B,w);
true = [ones(18,1);(-1)*ones(18,1)];
result = a==true;
acc = sum(result)/36
acc_set = [acc_set acc];
end


