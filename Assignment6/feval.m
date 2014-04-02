function out = feval(c,x)
  out = c(end)
  for i = 1:size(c)
    out += c(i)*x;
    x = x*x;
  end
end
