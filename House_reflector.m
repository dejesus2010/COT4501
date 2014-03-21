function v = house_reflector( x )

    [m,n] = size(x);
    x_norm = norm(x);
    %v = x - (-1*sign(x(1))*x_norm*eye(m,n));
    v = x - (-sign(x(1)))*x_norm*eye(m,n);
    
end%function%
