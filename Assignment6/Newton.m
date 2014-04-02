function [root, convergence] = Newton( f, df, x_guess, tol, maxIterations )

  if nargin == 3
    tol = 1e-5;
    maxIterations = 1e1;
  elseif nargin == 4
    maxIterations = 1e1;
  elseif nargin == 5
    error('newton: invalid input parameters');
  end

  %f = inline(f);
  %df = inline(df);
  root(1) = x_guess - (f(x_guess)/df(x_guess));
  convergence(1) = abs(root(1) - x_guess );
  k = 2;
  while ( convergence(k-1) >= tol ) && (k <= maxIterations)
    root(k) = root(k-1) - (f(root(k-1))/df(x(k-1)));
    convergence(k) = abs(root(k)-root(k-1));
    k = k+1;
  end


end %function%
