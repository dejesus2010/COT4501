function [root, convergence] = Bisection(a,b,f)
  tol = 10e-10;
  while((b - a) > tol)
    m = a + (b - a)/2;
    if sign(f(a)) == sign(f(m))
      a = m;
    else
      b = m;
    end
  end
  root = m;
  convergence = -11;
end
