% Reinforcement Learning
% X.GAO

clear;clc


% for epsilon=0.3:0.3:1
gamma = 0.5;
alpha = 0.7;
epsilon = 0.5;

% state
state = [0,1,2,3,4,5];
% action
action = [-1,1];
% initial Q matrix
Q = zeros(length(state),length(action));
state_idx = 1;
Q_true = [0,0;1,0.625;0.5,1.25;0.625,2.5;1.25,5;0,0];

error_plot = [];
for i=1:500
    r = rand;
    x = sum(r>=cumsum([0,1-epsilon,epsilon])); %0,0.1,1
    
    if x==1 
        [~,umax] = max(Q(state_idx,:));
        current_action = action(umax);
    else 
        current_action = datasample(action,1);   
    end
    
    action_idx = find(action==current_action);
    [next_state,next_reward] = next(state(state_idx),action(action_idx));
    
    next_state_idx = find(state==next_state);
    Q(state_idx,action_idx) = Q(state_idx,action_idx) + alpha * (next_reward + gamma* max(Q(next_state_idx,:)) - Q(state_idx,action_idx));
    
    if(next_state_idx == 6 || next_state_idx == 1)
        state_idx = datasample(2:length(state)-1,1);
    else
        state_idx = next_state_idx;
    end
    
    error = sum(sum((Q_true - Q).^2));
    error_plot = [error_plot;error];
end

disp(Q)
% plot(error_plot);hold on 
% title('epsilon vs error');
% end
% legend('epsilon=0.3','epsilon=0.6','epsilon=0.9');

