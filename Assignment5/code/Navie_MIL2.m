clear
clc

load apple_cell.mat
load banana_cell.mat

bags = [apple_cell;banana_cell];
baglab = [2*ones(length(apple_cell),1);ones(length(banana_cell),1)];

dataset = bags2dataset(bags,baglab);

ins = dataset.data;
labels = dataset.nlab;
fishclf = fitcdiscr(ins,labels);
% svmclf = fitcsvm(ins,labels);
% ins_pre = predict(svmclf,ins);
LABELS = labeld(ins,fishclf);
% ins_pre = predict(fishclf,ins);

% plot
% a = ins(:,2:3);
% figure(1)
% scatter(a(1:328,1),a(1:328,2),'filled')
% hold on
% scatter(a(329:662,1),a(329:662,2))

s = 1;
result = [];
for i=1:length(bags)
    ins_len = size(bags{i},1);
    ins_set = ins_pre(s:s+ins_len-1);
    s = s+ins_len;
    %% original 
    label_out = combineinstlabels(ins_set);

    %% navie - Standard ML Assumption
%     unique(ins_set)
%     if(length(unique(ins_set))==1 && unique(ins_set)==2)
%         label_out = 2;
%     else
%         label_out = 1;
%     end
%     
    result = [result;label_out];
end

% error = sum(abs(result-baglab))
error = sum((result~=baglab))
