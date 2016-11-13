% function [cost] = costFunction(theta,X,Y,lambda)
% 
% %%------costFunction------
% number = length(Y);
% J = 0;
% z = (theta'*X')';
% J = sum((z-Y).^2);
% R = lambda*sum(theta(2:end).^2);
% cost = (1/(2*number))*(J + R);
% 
% %%------gradient--------
% grad1  = zeros(size(theta));
% for i = number
%     grad1 = grad1 + (z(i)-Y(i))*X(i,:)'; 
% end
% 
% % grad2 = lambda * grad1 + [0;theta(2:end)];
% % 
% % grad = (1/number)*(grad1 + grad2);
% end

function[cost,grad] = costFunction(theta,X,Y,lamdba)
% function[cost]=costFunction(theta,X,Y)
    num = length(Y);
    h = X*theta;
%     cost = (1/(2*num))*(sum((h-Y).^2)+lamdba*sum(theta(2:end).^2));
    cost = (1/(2*num))*(sum((h-Y).^2));
    w = zeros(size(theta));
    for i = 1:num
        w = w + (h(i)-Y(i))*X(i,:)';
    end
    p = 2;

    r = lamdba*(p/2)*sign([0;theta(2:end)]).*[0;theta(2:end)].^(p-1);
    grad = (1/num)*(w+r);
end