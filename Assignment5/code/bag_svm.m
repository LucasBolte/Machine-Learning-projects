clear
clc

load apple_cell.mat
load banana_cell.mat

bags = [apple_cell;banana_cell];
baglab = [2*ones(length(apple_cell),1);ones(length(banana_cell),1)];

dataset = bags2dataset(bags,baglab);

ins = dataset.data;
labels = dataset.nlab;

distance_up = inf;
bag_dis = zeros(length(bags),length(bags));
for i=1:length(bags)
    bag_cur = bags{i};
    for j=1:length(bags)
        bag_nex = bags{j};
        for z=1:size(bag_cur,1)
            bag_cur_ins = bag_cur(z,:);
            for m=1:size(bag_nex,1)
                bag_nex_ins = bag_nex(m,:);
                distance = sum((bag_cur_ins-bag_nex_ins).^2);
                if(distance<distance_up)
                    distance_min = distance;
                    distance_up  = distance;
                end
            end
        end
        distance_up = inf;
        bag_dis(i,j) = distance_min;
    end
end

features = [bag_dis(1:40,:);bag_dis(61:100,:)];
baglab = [ones(40,1);(-1)*ones(40,1)];
test = [bag_dis(41:60,:);bag_dis(101:120,:)];

a = fitcdiscr(features,baglab);
pre = predict(a,features);
