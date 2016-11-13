clear
clc
load apple_cell.mat
load banana_cell.mat
bags = [apple_cell;banana_cell];
baglab = [ones(length(apple_cell),1);(-1)*ones(length(banana_cell),1)];
dataset = bags2dataset(bags,baglab);
instance = dataset.data;


for k=1:5
d = [];
d_full = [];
knn = [];
for i=1:length(bags)
    bag_i = bags{i};
    for j=1:length(bags)
        bag1 = bag_i;
        bag2 = bags{j};
        d_j = bag_distance(bag1,bag2);
        d = [d;d_j];
    end
    d_full = [d_full d];
    [B,I] = sort(d);
    knn = [knn I(1:k,:)];
    d = [];
end

% test
result = [];
for i=1:length(bags)
    % references
    [bag1_rn,bag2_rn]= knn_ref(i,knn);    
    % citers
    [bag1_cn,bag2_cn]= knn_cit(i,knn);
    
    if(bag1_rn+bag1_cn)>=(bag2_rn+bag2_cn)
        label = 1;
    else
        label = 2;
    end
    
    result = [result;label];

end

acc = [ones(length(apple_cell),1);(2)*ones(length(banana_cell),1)];
sum(acc==result)/120
end