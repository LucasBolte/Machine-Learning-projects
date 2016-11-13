function f = model( x,u )

if (x<=5 && x>=2)
    f = x+u;
else
    f = x;
end

end

