clear all
alpha = 0.1;
question = 13;
% load x_sample.mat;
x_sample = normrnd(0,1,[500000,1]);
%%Questiona.1--BGD
if(question==11)
%     f = @(x) x.^4-2*x.^2+2*x;
%     figure(1);ezplot(f,[-2,2]);
%     axis([-2 2 -4 12])
%     hold on
    
    t = 0;
    t_max = 500;
    err = inf;
    err_min = 1e-6;
    err_result = [];
    xnew_result = [];
    loss_result = [];
    w = 2;
    while(t<=t_max && err>=err_min) 
  
        grad = [4*w.^3-4*w+2]+x_sample;
        a = sum(grad);
        w_new = w - (alpha/5000) * sum(grad);
        y = w.^4 - 2*w.^2 + 2*w;
        loss_result = [loss_result;y];
        y_new = w_new.^4 - 2*w_new.^2 + 2*w_new;
%         plot([w w_new],[y y_new],'ko-')
        err = abs(w_new - w);
        w = w_new;
        err_result = [err_result;err];

    end
    figure(2);
    plot(loss_result);
    xlabel('t');
    ylabel('loss');
    hold on
end
%%Questiona.2--SGD
% if(question==22)
%     f = @(x) x.^4-2*x.^2+2*x;
%     figure(1);ezplot(f,[-2,2]);
%     axis([-2 2 -4 12])
%     hold on
%     
%     t = 0;
%     t_max = 500;
%     err = inf;
%     err_min = 1e-6;
%     x0 = 2;
%     x = x0;
%     err_result = [];
%     xnew_result = [];
%     loss_result = [];
%     x1 = normrnd(0,1,[50,1]);
%     a = sum(x1(1:50,:))/50;
% %     temp = x1(14,1);
%     while(t<=t_max && err>=err_min) 
%                
%         grd = [4*x.^3-4*x+2];
%         xnew = x - alpha*grd;
%         y = x.^4-2*x.^2+2*x;
%         loss_result = [loss_result;y];
%         ynew = xnew.^4-2*xnew.^2+2*xnew;
%         plot([x xnew],[y ynew],'ko-')
%         xnew_result = [xnew_result;xnew];
%         t = t+1;
%         err = abs(xnew - x);
%         x = xnew;
%         err_result = [err_result;err];
%   
%     end
% 
% 
% end

if(question==12)
%     f = @(x) x.^4-2*x.^2+2*x;
%     figure(1);ezplot(f,[-2,2]);
%     axis([-2 2 -4 12])
%     hold on
    
    t = 0;
    t_max = 500;
    err = inf;
    err_min = 1e-6;
    err_result = [];
    xnew_result = [];
    loss_result = [];
    w = 2;
    while(t<=t_max && err>=err_min) 
  
        grad = [4*w.^3-4*w+2]+x_sample;
        a = randi([1,50],1);
        w_new = w - alpha* grad(10,1);
        y = w.^4 - 2*w.^2 + 2*w;
        loss_result = [loss_result;y];
        y_new = w_new.^4 - 2*w_new.^2 + 2*w_new;
%         plot([w w_new],[y y_new],'ko-')
        err = abs(w_new - w);
        w = w_new;
        err_result = [err_result;err];

    end
    figure(2);
    plot(loss_result);
    hold on
end

%%Questiona.3--MBGD
if(question==13)
    f = @(x) x.^4-2*x.^2+2*x;
    figure(1);ezplot(f,[-2,2]);
    axis([-2 2 -4 12])
    hold on
    tic
    t = 0;
    t_max = 500;
    err = inf;
    err_min = 1e-6;
    err_result = [];
    xnew_result = [];
    loss_result = [];
    w = -2;
    small_sample = randi([1,50],[50000,1]);
    while(t<=t_max && err>=err_min) 
  
        grad = [4*w.^3-4*w+2]+x_sample;
        a = sum(grad);
        w_new = w - (alpha/50000) * sum(grad(small_sample));
        y = w.^4 - 2*w.^2 + 2*w;
        loss_result = [loss_result;y];
        y_new = w_new.^4 - 2*w_new.^2 + 2*w_new;
       plot([w w_new],[y y_new],'ko-')
        err = abs(w_new - w);
        w = w_new;
        err_result = [err_result;err];

    end
    toc
    figure(2);
    plot(loss_result);
end