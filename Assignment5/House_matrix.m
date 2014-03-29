function [ H ] = House_matrix( x )

    v = House_reflector(x);

    [n,m] = size(v);
    I = eye(n);
    tempNum = v*v';
    tempDen = v'*v;
    
    H = I - 2*(tempNum/tempDen);

end
