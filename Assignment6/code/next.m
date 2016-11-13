function [next_state,next_reward] = next(s,a)

    if(s<=4 && s>=1)
        next_state = s+a+normrnd(0,0.1);
    else
        next_state = s;
    end

    if(s>=5.5 && a==1)
        next_reward = 5;
    elseif(s<1.5 && a==-1)
        next_reward = 1;
    else
        next_reward = 0;
    end
    
end

