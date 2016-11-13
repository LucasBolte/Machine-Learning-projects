clear all
question=9;
%% 
load x_sample_50.mat
% x = normrnd(0,2,[50,1]);
if (question==1)
    N = 50;
    w = 2;
    cost1 = [];
    alpha = 0.001;

    %%Gradient Descent
    for epoch = 1:200
        y = w.^4-2*w.^2+2*w;
        cost1 = [cost1;y];
        grad = 4*w.^3-4*w+2 + x;
        w_new = w - (alpha/N)*sum(grad);
        w = w_new;
        epoch = epoch+1;
    end
    figure(2);
%     a = plot(cost1);legend('Gradient Descent');hold all

    w = 2;
    cost2 = [];
    %%Stotastic Gradient Descent
    
    for epoch = 1:200
    h = randi([1,N],[N,1]);
    for t = 1:50
        
        grad = 4*w.^3-4*w+2 + x;
        if (t==1)
            w_new = w - (alpha)*sum(grad(h(t)));
        else
            w_new = w - (alpha)*sum(grad(h(t)))+(alpha)*sum(grad(h(t-1)));
        end
%         w_new = w - (alpha)*sum(grad(h(t)));
        w = w_new;
        t = t+1;
    end
    y = w.^4-2*w.^2+2*w;
    cost2 = [cost2;y];
    epoch = epoch+1;
    end
    figure(2);
    b = plot(cost2);hold on

    w = 2;
    cost3 = [];
    n = 5;
    
    %%mini-batch Stotastic Gradient Descent
    
    for epoch = 1:1000
    batch = randi([1,N],[N,1]);
    mini_batch = reshape(batch,[10,5]);
    for t = 1:10
        grad = 4*w.^3-4*w+2 + x;
        w_new = w - (alpha/n)*sum(grad(mini_batch(t,:)));
        w = w_new;
        t = t+1; 
    end
    y = w.^4-2*w.^2+2*w;
    cost3 = [cost3;y];
    epoch = epoch+1;
    end
    figure(2);
%     c = plot(cost3);legend('Mini-batch');hold on
%     hold off
% 
%     legend = legend([a,b,c],'Gradient Descent','Stotastic Gradient Descent','mini-batch');
%     set(legend,'FontSize',14);
end

%% Question b
if (question==2)
    f = @(x) x.^4-2*x.^2+2*x;
    figure(3);ezplot(f,[-2,2]);axis([-2 2 -4 12]);hold on

    N = 500;
    w = 2;
    alpha = 0.1;
    mini_batch = randi([1,N],[1,1]);

    for i = 0:4
        grad = [4*w.^3-4*w+2]+x;
        w_new = w - (alpha/N)*sum(grad);
        y = w.^4 - 2*w.^2 + 2*w;
        y_new = w_new.^4 - 2*w_new.^2 + 2*w_new;
        plot([w w_new],[y y_new],'--ko')
        w = w_new;
    end
    
    figure(4);ezplot(f,[-2,2]);axis([-2 2 -4 12]);hold on
    w = 2;
    
    for i = 0:4
        t = randi([1,N],[1,1]);
        grad = [4*w.^3-4*w+2]+x;
        w_new = w - (alpha)*sum(grad(t));
        y = w.^4 - 2*w.^2 + 2*w;
        y_new = w_new.^4 - 2*w_new.^2 + 2*w_new;
        plot([w w_new],[y y_new],'--ro')
        w = w_new;
    end
    
    figure(5);ezplot(f,[-2,2]);axis([-2 2 -4 12]);hold on
    w = 2;
    n = 20;
    
    for i = 0:4
        mini_batch = randi([1,N],[n,1]);
        grad = 4*w.^3-4*w+2 + x;
        w_new = w - (alpha/n)*sum(grad(mini_batch));
        y = w.^4 - 2*w.^2 + 2*w;
        y_new = w_new.^4 - 2*w_new.^2 + 2*w_new;
        plot([w w_new],[y y_new],'--bo')
        w = w_new;
    end
    
    hold off
end

%% Question c
if(question==3)
    J = [];
    time = [];
    w = -2;
    N = 500;
%     x = normrnd(0,2,[N,1]);
    alpha = 0.1;
    for n = 1:500
    mini_batch = randi([1,N],[n,1]);
    tic
    for i = 0:50
        grad = 4*w.^3-4*w+2 + x;
        w_new = w - (alpha/n)*sum(grad(mini_batch));
        w = w_new;
    end
    time = [time;toc];
    y = w.^4 - 2*w.^2 + 2*w;
    J = [J;y];
    end
% plot(time);
xlabel('mini-batch size');ylabel('computation time');title('mini-batch size vs time');

[sorted_time,idx] = sort(time);
sorted_J = [];
for k = 1:500
    sorted_J = [sorted_J;J(idx(k))];
end
plot(sorted_time,sorted_J)
xlabel('computation time');ylabel('cost');title('time vs cost');
end

%% Question d
if (question==4)

    
    N = 50;
    w = 2;
    cost3 = [];
    alpha = 0.001;
   
%     r = [];
%     hold on
%      for n = [2,5,10,50]
    n = 50;
    for epoch = 1:400
    batch = randi([1,N],[N,1]);
    mini_batch = reshape(batch,[50/n,n]);
    for t = 1:50/n
        grad = 4*w.^3-4*w+2 + x;
        w_new = w - (alpha/n)*sum(grad(mini_batch(t,:)));
        w = w_new;
        t = t+1; 
    end
    y = w.^4-2*w.^2+2*w;
    cost3 = [cost3;y];
    epoch = epoch+1;
    end
%     figure(5);hold on
%     plot(cost3);hold on
    legend = legend('bathc=2','batch=5','batch=10','batch=50');
    title('mini-batch-size vs convergence');
    set(legend,'FontSize',14);
    xlabel('epoch');ylabel('cost');
    
%      end
%     
%  hold off


    
    
    
    
    
    
end
%% Question f

if(question==5)
     
    N = 50;
    w = 2;
    cost3 = [];
    alpha = 0.0003;
   
%     r = [];
%     hold on
%      for n = [2,5,10,50]
    n = 50;
    for epoch = 1:400
    batch = randi([1,N],[N,1]);
    mini_batch = reshape(batch,[50/n,n]);
    for t = 1:50/n
        grad = 4*w.^3-4*w+2 + x;
        w_new = w - (alpha/n)*sum(grad(mini_batch(t,:)));
        w = w_new;
        t = t+1; 
    end
    y = w.^4-2*w.^2+2*w;
    cost3 = [cost3;y];
    epoch = epoch+1;
    end
    figure(5);hold on
    plot(cost3);hold on
    legend = legend('alpha=10^-4','alpha=2*10^-4','alpha=3*10^-4');
    title('learning rate of GD vs convergence');
    set(legend,'FontSize',14);
    xlabel('epoch');ylabel('cost');
    
%      end
%     
%  hold off


    
    
    
    
    
    
end

%% Question g

if(question==6)
    
    clear all
    load optdigitsubset.mat
    n = size(ex1,2);
    x = ex1/255;
    y = [ones(554,1).*(-1);ones(571,1)*(1)];
    x = [ones(length(x), 1) x];
    
    theta = zeros(n+1, 1);
    learningRate = 0.1;
    iteration = 100;
    a = zeros(iteration,1);
    
    batch1 = 5;
    [theta_out, costHistory1,s] = costFunction(x, y, theta, learningRate, iteration,batch1);
    a = plot(costHistory1);hold on

    
    batch2 = 10;
    [theta_out, costHistory2,s] = costFunction(x, y, theta, learningRate, iteration,batch2);
    b = plot(costHistory2);hold on

    
    batch3 = 100;
    [theta_out, costHistory3,s] = costFunction(x, y, theta, learningRate, iteration,batch3);
    c = plot(costHistory3);hold on
    
    hold off
  
    
    legend = legend([a,b,c],'batch=5','batch=10','batch=100');
    set(legend,'FontSize',14);
    xlabel('iteration');
    ylabel('Cost');
    title('Mini-batch-size vs convergence');
end

%% Question h 

if(question==7)
    
    clear all
    load optdigitsubset.mat
    n = size(ex1,2);
    x = ex1/255;
    y = [ones(554,1).*(-1);ones(571,1)*(1)];
    x = [ones(length(x), 1) x];
    
    theta = zeros(n+1, 1);
%     learningRate = 0.1;
    iteration = 100;
    a = zeros(iteration,1);
    
    learningrate1 = 0.04;
    batch1 = 1;
    [theta_out, costHistory1,s] = costFunction(x, y, theta, learningrate1, iteration,batch1);
    a = plot(costHistory1);hold on

    
    learningrate2 = 0.08;
    batch2 = 1;
    [theta_out, costHistory2,s] = costFunction(x, y, theta, learningrate2, iteration,batch2);
    b = plot(costHistory2);hold on

    
    learningrate3 = 0.12;
    batch3 = 1;
    [theta_out, costHistory3,s] = costFunction(x, y, theta, learningrate3, iteration,batch3);
    c = plot(costHistory3);hold on
    
    hold off
  
    
    legend = legend([a,b,c],'alpha=0.04','alpha=0.08','alpha=0.12');
    set(legend,'FontSize',14);
    xlabel('iteration');
    ylabel('Cost');
    title('SGD-alpha vs convergence');
end

%% Question i

if(question==8)
    
    clear all
    load optdigitsubset.mat
    n = size(ex1,2);
    x = ex1/255;
    y = [ones(554,1).*(-1);ones(571,1)*(1)];
    x = [ones(length(x), 1) x];
    
    theta = zeros(n+1, 1);
%     learningRate = 0.1;
    iteration = 400;
    a = zeros(iteration,1);
    
    lambda1 = 1;
    
    learningrate1 = 0.04;
    batch1 = 1125;
    [theta_out, costHistory1,s] = costFunction(x, y, theta, learningrate1, iteration,batch1,lambda1);
    a = plot(costHistory1);hold on

    
    learningrate2 = 0.04;
    batch2 = 1125;
    lambda2 = 0;
    [theta_out, costHistory2,s] = costFunction(x, y, theta, learningrate2, iteration,batch2,lambda2);
    b = plot(costHistory2);hold on 

    
%     learningrate3 = 0.12;
%     batch3 = 1;
%     lambda3 = 1125;
%     [theta_out, costHistory3,s] = costFunction(x, y, theta, learningrate3, iteration,batch3,lambda3);
%     c = plot(costHistory3);hold on
%     
%     hold off
%   
    
    legend = legend([a,b],'lamdba=0.01','lambda=0');
    set(legend,'FontSize',14);
    xlabel('iteration');
    ylabel('Cost');
    title('SGD-lamdba vs convergence');
end

%% Question j
if(question==9)
    N = 50;
    w = 2;
    cost2 = [];
    alpha = 0.001;
    lambda = 0.9;
    w_new = 0;
    for epoch = 1:1000
        h = randi([1,N],[N,1]);
        for t = 1:50   
            grad = 4*w.^3-4*w+2 + x;
            temp = (alpha)*sum(grad(h(t)))+lambda*
                w_new = w - (alpha)*sum(grad(h(t))) + w_new;
  
            w = w_new;
            t = t+1;
        end
        y = w.^4-2*w.^2+2*w;
        cost2 = [cost2;y];
        epoch = epoch+1;
    end
    figure(2);
    b = plot(cost2);hold on
end

%% Question j
if(question==10)
    p = [-1 -1 2 2; 0 5 0 5];
t = [-1 -1 1 1];
net = feedforwardnet(3,'traingdm');
net.trainParam.lr = 0.05;
net.trainParam.mc = 0.9;
net = train(net,p,t);
y = net(p)
end
    
