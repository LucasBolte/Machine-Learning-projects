
data = load('data.txt'); 
X = data;
temp = ones(1125,1);
X = [temp X];%???1
class1 = ones(554,1).*(-1)
class2 = ones(571,1)
Y = [class1;class2];

initial_theta = zeros(size(X, 2), 1);
lambda = 10^(-3);

%---Costfunction---
[cost, grad] = costFunctionReg(initial_theta, X, Y, lambda);


options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
[theta, J, exit_flag] = fminunc(@(t)(costFunctionReg(t, X, Y, lambda)), initial_theta, options);
