function r = reward(x,u)

if(x==5 && u==1)
    r=5;
elseif(x==2 && u==-1)
    r=1;
else
    r=0;
end
end

