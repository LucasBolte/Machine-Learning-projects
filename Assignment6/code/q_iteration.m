% Q-iteration
% X.GAO

state = [1,2,3,4,5,6];
action = [-1,1];
Q = zeros(length(state),length(action));
Q_old = Q;

gamma = 0.5;
epsilon = 0.001;

for i = 1:30
    for j = 1:length(state)
        for z = 1:length(action)
%             Q(j,z) = reward(state(j),action(z)) + gamma * max(Q_old(model(state(j),action(z)),:));
            Q(j,z) = 0.7*(reward(state(j),action(z)) + gamma * max(Q_old(model(state(j),action(z)),:)))...
                +0.3*(0 + gamma * max(Q_old(j,:)));
        end
    end
    if abs(sum(sum(Q - Q_old))) < epsilon
        break;
        i
    else
        Q_old = Q;
    end
    

end
disp(Q);
