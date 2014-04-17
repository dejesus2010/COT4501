function [root, convergence, convergence_rate] = Newton( f, df, x_guess, tol, maxIterations )

  if nargin == 3
    tol = 1e-5;
    maxIterations = 1e1;
  elseif nargin == 4
    maxIterations = 1e1;
  end

  %f = inline(f);
  %df = inline(df);
  root = x_guess;
  
  
  root = [root;x_guess - (f(x_guess)/df(x_guess))];
  convergence = abs(root(2,1) - x_guess );
  x_guess = root(2,1);
  rel_change = abs( root(2,1) - root(1,1) ) / root(1,1);
  k = 3;
  while ( rel_change >= tol ) && (k <= maxIterations)
    root = [root;x_guess - (f(x_guess)/df(x_guess))];
    convergence = [convergence; abs(root(k,1)-x_guess)];
    rel_change = abs( root(k,1) - root(k-1,1) );
    x_guess = root(k,1);
    k = k+1;
  end

  [m,n] = size(convergence);
  sum_of_errors = sum(convergence);
  convergence_rate = sum_of_errors/convergence(1,1);
  root = root(k-1,1);
  
  

end %function%
