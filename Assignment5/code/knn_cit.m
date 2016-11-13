function [bag1_cn,bag2_cn] = knn_cit(i,knn)

bag1_cn = 0;
bag2_cn = 0;
knn(:,i) = zeros(size(knn,1),1);
for i=1:size(knn,2)
    if sum(knn(:,i)==i)>0
        if i<=60
            bag1_cn = bag1_cn + 1;
        else
            bag2_cn = bag2_cn + 1;
        end
    end
end

end

