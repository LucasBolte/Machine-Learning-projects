function[theta,costHistory,s] = costFunction(x,y,theta,alpha,iteration,batch,lambda)

    m = length(y);
    n = length(theta);
    
    costHistory = zeros(iteration,1);
    theta_temp = zeros(n,1);
%     batch = 10;
    k = 1;
    s = [];
    for t = 1:iteration
      
        h = (x*theta - y)';
        idx = randi([1,1125],[batch,1]);
        for i = 1:n
%             theta_temp(i) = theta(i) - (alpha/m)*h*x(:,i);

          
            theta_temp(i) = theta(i) - (alpha/batch)*h(idx)*x(idx,i);
        end 
        gradientRegularizationTerm = lambda/batch* [0; theta(2:end)]; 
        theta = theta_temp + gradientRegularizationTerm; 
        costRegularizationTerm = lambda/(2*batch) * sum( theta(2:end).^2 );
        costHistory(t) = (x*theta-y)'*(x*theta-y)/(2*length(y)) + costRegularizationTerm;
        
        if(t>1)
            a = costHistory(t)-costHistory(t-1);
            if(abs(a)<1e-5)
%                 fprintf('%d',t);
                s = [s;t];
            end
        end
    end
end
