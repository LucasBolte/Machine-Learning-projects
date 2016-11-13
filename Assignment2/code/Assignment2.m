%%Question I

% x = [0:0.01:1];
% y1 = log(1-x);
% y2 = -x;
% 
% plot(x,y1);
% hold on
% plot(x,y2);
% legend('log(1-x)','-x')

%%Question a--weak learner
% load data_x.mat
% x = a;
% load data_y.mat
% y = labels;
% for i = 1:100
%     if y(i,:)==2
%         y(i,:)=-1;
%     end
% end
% w = ones(size(x,1), 1);
% [stump,h] = build_stump(x,y,w);


%%Question b--Gaussian distributions
%%Question c1--optdigitsubset
% load optdigitsubset.mat
% x1 = ex1([1:50],:);
% x2 = ex1([555:604],:);
% x  = [x1;x2];
% y  = [ones(50,1).*(-1);ones(50,1)];
% w = ones(size(x,1), 1);
% stump = build_stump(x,y,w);
% %werr = 0.0100 
% %xo = 24
% %s = 1
% %ind = 37
% t1 = ex1([51:554],:);
% t11 = t1(:,37);
% t2 = ex1([605:1125],:);
% t22 = t2(:,37);
% tt  = [t11;t22];
% yt = [ones(504,1).*(-1);ones(521,1)];
% result=[];
% for i = 1:1025
%     if tt(i,1)>24
%         key = 1;
%     else
%         key = -1;
%     end
%     result = [result;key];  
% end
% sum(yt~=result)
% ErrorM  = sum(yt ~= result) / length(yt);

%%Question c2--random 50
% load optdigitsubset.mat
% x1 = ex1([1:554],:);
% x2 = ex1([555:1125],:);
% idx1 = randperm(size(x1,1),50);
% idx2 = randperm(size(x2,1),50);
% 
% r1 = x1(idx1,:);
% r2 = x2(idx2,:);
% r  = [r1;r2];
% y  = [ones(50,1).*(-1);ones(50,1)];
% w = ones(size(r,1), 1);
% stump = build_stump(r,y,w);
% 
% x1(idx1,:)=[];
% x2(idx2,:)=[];
% t  = [x1;x2];
% thresh = stump.x0;
% ind = stump.ind;
% tt = t(:,ind);
% yt = [ones(504,1).*(-1);ones(521,1)];
% result=[];
% for i = 1:1025
%     if tt(i,1)>thresh
%         key = 1;
%     else
%         key = -1;
%     end
%     result = [result;key];  
% end
% sum(yt~=result)
% ErrorM  = sum(yt ~= result) / length(yt);

%%Question e--adaboost

% load data_x.mat
% x = a;
% load data_y.mat
% y = labels;
% for i = 1:100
%     if y(i,:)==2
%         y(i,:)=0;
%     end
% end

load optdigitsubset.mat

x1 = ex1([1:50],:);
x2 = ex1([555:604],:);
x  = [x1;x2];
y  = [ones(50,1).*(-1);ones(50,1)];

N = 100; % X training labels
w = 1/N * ones(N,1); %Weights initialization
M = 100; % Number of boosting iterations 

for m=1:M
    p = w ./ sum(w);
    [stump,h] = build_stump(x,y,p);
    error = stump.werr;
    beta = error/(1-error);
    beta_1 = ones(size(w)) * beta;
   w = w.*(beta.^(ones(100,1)-abs(h-y)));
end


