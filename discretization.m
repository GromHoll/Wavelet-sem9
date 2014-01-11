% Create discretization for targetFunction
% from "start" (include) to "finish" (exclude)
% with "n" points 
function d = discretization(start, finish, n, targetFunction)
    d = zeros(1,n);
    step = (finish - start)/n;
    for i = 1:n
       d(i) = targetFunction(start + (i - 1)*step); 
    end
end
