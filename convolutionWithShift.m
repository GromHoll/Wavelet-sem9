% Make convolution F (array) to F (array) with shift
function C = convolutionWithShift(F, shift, start, finish)
    f = length(F);
    FF = zeros(1, f);
    
    for i = 1:f/2
        FF(i) = F(i)*F(i);
    end
    
    E = shiftExt(f, shift, start, finish);    
    FE = arrayfun(@(ff, e) (ff*e), FF, E);
    
    C = real(ifft(FE))/(f);
    C = verticalShift(C, shift, f);     
end

function A = verticalShift(B, shift, count) 
    vShift = B(ceil(mod(1 + shift*count/2, count)));
    A = arrayfun(@(x) (x - vShift), B);    
end

function E = shiftExt(count, shift, start, finish) 
    a = 1i*(-2*pi*shift*count)/((finish - start)*count);    
    E = zeros(1,count);
    for k = 1:count
        E(k) = exp(a*(k-1));       
    end
end