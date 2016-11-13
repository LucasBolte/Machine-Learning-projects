%%Question a
% data = load('data.txt');
% X = data;
% col1 = ones(1125,1);
% class0 = ones(554,1).*(-1);
% class1 = ones(571,1);
% X = [col1 X];
% Y = [class0;class1];
% lambda = 1;
% 
% theta0 = zeros(size(X,2),1);
% 
% for i = 1:65
% [grad] = gradientdescent(X,Y,lambda,theta0);
% 
% a = 1;
% theta1 = theta0 - a*grad;
% end
% 
% options = optimset('GradObj','on','MaxIter',400);
% [theta, J] = fminunc(@(t)(costFunctionReg(t,X,Y,lambda)),theta0,options);
tic
data = load('data.txt');
dim = 64;
num = 20;
X1 = data(1:20,:);
X2 = data(571:590,:);
X  = [X1;X2];
X  = [ones(40,1) X];
Y  = [ones(20,1).*(-1);ones(20,1)];
lambda = 10^6;
theta0 = zeros(size(X,2),1);
options = optimset('GradObj','on','MaxIter',400);
for i = 1:10
[theta, J] = costFunction(theta0,X,Y,lambda);
a = sum(J);
theta0 = theta;
end
[theta, J] = fminunc(@(t)(costFunction(t,X,Y)),theta0,options);
theta = theta(2:end);
% plot(theta);
img = reshape(theta,[8,8]); %resize the images
img = mat2gray(img);
figure
imshow(img,'InitialMagnification','fit'); %fit the screen
toc