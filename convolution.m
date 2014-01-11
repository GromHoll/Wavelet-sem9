% Make convolution F (array) to F (array)
function C = convolution(F)
    f = length(F);
    FF = zeros(1, f);
    
    for i = 1:f/2
        FF(i) = F(i)*F(i);
    end
    
    C = real(ifft(FF))/(f);
    C = verticalShift(C);     
end

function A = verticalShift(B) 
    vShift = B(1);
    A = arrayfun(@(x) (x - vShift), B);    
end