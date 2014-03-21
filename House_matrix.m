function [ H ] = house_matrix( x )

    v = house_reflector(x)

    [n,m] = size(v);
    I = eye(n);
    tempNum = v*v';
    tempDen = v'*v;
    
    H = I - 2*(tempNum/tempDen);

end
