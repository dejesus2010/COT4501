function [ x, LAMBDA] = Power_it( A,x )

    [m,n] = size(A);
    %x = rand(m,1);
    for i = 1:5000
        x = A*x;
        LAMBDA = norm(x);
        x = x/LAMBDA;
    end%for
    
    x;
    LAMBDA;
end

