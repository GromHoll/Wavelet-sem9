function f = myFunction(x)
    if or(x > 0, x < 1)
        f = 1/sqrt(sin(x));
    else 
        f = 0; 
    end
    
    if isnan(f)
        f = 0;
    end 
    if isinf(f)
        f = 0;
    end 
end