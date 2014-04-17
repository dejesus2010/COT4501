function [root,hx] = Secant( f, x0, x1, tol, maxIterations )

    root = x0;
    root = [root; x1];
    root = [root; x1 - ( ( f(x1)*(x1 - x0) )/ ( f(x1)-f(x0) ) )];
    
    hx = [0; root(3,1) - root(2,1)];
    
    k = 3;
    
    while( abs(f(root(k,1))) >= tol )
        x1 = root(k,1);
        x0 = root(k-1,1);
        root = [root;x1 - ( ( f(x1)*( x1 - x0 ) ) / ( f(x1)-f(x0) ) )];
        hx= [hx; root(k+1) - x1];
        k = k+1;
    end%while
   

    
end %function
