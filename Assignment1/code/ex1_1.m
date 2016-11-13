tic
data = load('data.txt');
dim = 64;
num = 1125;
X = data;
X = [ones(num,1) X];
Y = [ones(554,1).*(-1);ones(571,1)];
lambda = 10^10;
l = eye(dim);
ll = zeros(dim,1);
lll= [ll l];
llll=[zeros(1,65);lll];
[zeros(1,dim+1);[zeros(dim,1) eye(dim)]];
w = (X'*X+lambda*llll)^(-1)*X'*Y;
w = w(2:end);
img2 = reshape(w,[8,8]); %resize the images
img2 = mat2gray(img2);
figure
imshow(img2,'InitialMagnification','fit'); %fit the screen
toc