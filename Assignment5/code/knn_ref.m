function [bag1_rn,bag2_rn]= knn_ref(i,knn)

d_i = knn(:,i);
bag1_rn = sum(d_i<=60);
bag2_rn = sum(d_i>60);

end

