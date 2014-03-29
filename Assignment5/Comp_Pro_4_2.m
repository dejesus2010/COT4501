function [ x, lambda ] = power_meth ( A, x, it_num )

    for i = 1:it_num
        x = A*x;
        lambda = norm(x);
        x = x / lambda;
    end%for

end %function%
