function out = funceval(c,x)
  [~,n] = size(c);
  out = c(n);
  curx = x;
  for i = (n-1):-1:1
    out = out + c(i)*curx
    curx = curx*x
  end
end
