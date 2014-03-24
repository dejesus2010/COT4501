function [ eigenvector, lambda ] = Inv_power_it( A,x, shift )

[m,n] = size(A);
for k = 1:100
    x = (A - eye(m,n)*shift) \ x; %compute the next iteration of the vector
    x = x / norm(x); %normalizing
end
eigenvector = x;
lambda = norm(A*x) / norm(x);

end

