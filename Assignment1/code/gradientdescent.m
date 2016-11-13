function [cost]=gradientdescent(X,Y,lambda,theta)

num = length(Y);
w = zeros(size(theta));

h = X*theta;

for i = 1:num
    w = w + (h(i)-Y(i))*X(i,:)';
end

r = lambda*[0;theta(2:end)];
grad = (1/num)*(w+r);

a = 1;
theta