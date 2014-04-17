%% Numerical Analysis: Assignment 7
%  Ryan Dejesus
%  Daniel Gollahon
%  Ron Quan

%% Review 6.1
%  False.  [?]

%% Review 6.2
%  True. [p. 270]

%% Review 6.8
%  (a)
%      The two points evaluated are x = 0.618 and x = 0.382. [p. 271]
%
%  (b)
%      In order to make consistent progress in reducing the size of the
%      interval which contains the minimum, each new pair of points must
%      have the same relative positions. This is accomplished by having the
%      current interval set to t and 1-t, where t^2 = 1 - t. The solution
%      to this gives us t = 0.618 and 1-t = 0.382. [p. 271]

%% Review 6.9
%  The golden section search always converges. [p. 273] In this case, it
%  will converge to the minimum value in the interval which will be at one
%  end of the interval (this must occur by definition of a monotonic function)
%  --either x = a or x = b.

%% Review 6.10
%  (a)
%      We know the minimum must reside in the interval [a,x2]. [p. 271]
%  (b)
%      Since there is only one minimum, if f(x1) == f(x2) the minimum must lie
%      within [x1,x2] because if it were outside the interval the function
%      would not be unimodal. This is because the only way we can have x1 <
%      x2 and f(x1) == f(x2) is if we are dealing with a straight line or
%      if there is a dip or hump between x1 and x2. If the former is true,
%      the minimum is within the interval, if the latter is true we would
%      have a non-unimodal function which we've been told is not the case
%      already so we can rule that case out.

%% Review 6.14

%%
% 
% Newton's method involves setting $$\nabla $$ f(x) = 0
% Since the equation is quadratic, $$\nabla $$ f(x)'s x terms will all be linear
% and linear equations can be solved in one step, Newton's method can find a
% minimum in one iteration. Solving the equation itself involves quadratic 
% terms and therefore cannot be immediately solved for, thus requiring multiple
% iterations. [p. 279]

%% Exercise 6.3
%	a.) f'(x) = 2x
%		f''(x) = 2
%		f'(0) = 0
%		f''(0) = 2
%		0 is minimum
%	b.) f'(x) = 3x^2
%		f''(x) = 6x
%		f'(0) = 0
%		f''(0) = 0
%		0 is critical point, 2nd order optimally condition is inconclusive
%		0 is inflection point
%	c.) f'(x) = 4x^3
%		f''(x) = 12x^2
%		f'(0) = 0
%		f''(0) = 0
%		0 is critical point, 2nd order optimally condition is inconclusive
%%		0 is minimum
%	d.) f'(x) = -4x^3
%		f''(x) = -12x^2
%		f'(0) = 0
%		f''(0) = 0
%		0 is critical point and maximum, 2nd order optimally is inconclusive
 
%% Exercise 6.4
%	a.) f'(x) = 3x^2 + 12x - 15 = 0
%		f''(x) = 6x + 12
%		x1 = 1, x2 = -5
%		f''(x1) = 18 x1 -> local min.
%		f''(x2) = -18 x2 -> local max.
%		no global min or max
%		
%	b.) f'(x) = 6x^2 -50x - 12 = 0
%		f''(x) = 12x - 50
%
%		x1 = (25 + sqrt(697)) / 6
%		x2 = (25 - sqrt(697)) / 6
%
%		f''(x1) = 2 * sqrt(697) x1 -> local min
%		f''(x2) = -2 * sqrt(697) x2 -> local max
%		no global min or max
%
%	c.) f'(x) = 9x^2 + 14x - 15 = 0
%		f''(x) = 18x + 14
%		x1 = (-7 + sqrt(184)) / 9
%		x2 = (-7 - sqrt(184)) / 9
%
%		f''(x1) = 2 * sqrt(184) x1 -> local min
%		f''(x2) = 2 * sqrt(184) x2 -> local max
%
%	d.) f'(x) = 2x*e^x + x^2e^x = e^x(2x + x^2)
%		f''(x) = e^x(x^2 + 4x + 2)
%
%		x1 = 0
%		x2 = -2
%
%		f''(x1) = 2 x1 -> local min
%		f''(x2) = -2e - 2 x2 -> local max
%		no global max, but x1 = 0 is global min
 
%% Computer Problem 6.2
%  (a) Use l'Hopital's rule to show that f is continuous at x = 0

f = @(x)(0.5);
g = @(x)((1-cos(x))/x^2);

gnum = @(x)(1-cos(x));
gden = @(x)(x^2);

%%
%   function L = LHopitals( gnum, gden )
%   
%   syms x; 
%   
%   while( limit( gnum, x, 0 ) == 0 && limit( gden, x, 0 ) == 0 )
%       gnum = sym(gnum);
%       gnum = matlabFunction( diff(gnum) );
%       gden = sym(gden);
%       gden = matlabFunction( diff(gden) );
%   end%while
%   
%   L = limit(fnum, x, 0 ) / ( limit( gnum, x, 0 ) / gden );
%   
%   L = limit( gnum, x, 0 ) / limit( gden, x , 0 );
%  
%   end%function

disp( LHopitals( gnum, gden ) );
syms x;
disp( limit( f, x, 0) );

disp( 'Because the limit f=0.5 and the limit of g = (1-cos(x))/x^2 are both 1/2, f is continuous at 0');


%%
%  (b)
%     At x = 0, f(x) = 0.5. We can verify this is a critical point by
%     solving for f'(x) = 0. Since f'(x) = 0 everywhere and x = 0 is the
%     only point we're checking, we know x = 0 is a critical point. The
%     second derivitive test is inconclusive because f''(x) = 0. But, we can
%     check values very near to x = 0 and see that f(eps) and f(-eps) are 
%     less than 0.5 and "see" that the function is a maximum.


%% Computer Problem 6.3

plotf = @(f)plot(0:.01:3,f(0:0.01:3));

%% 
%  (a)
fa = @(x) (x.^4 - 14*x.^3 + 60*x.^2 - 70*x);
a_min = fminbnd(fa,0,3)
figure(1)
plotf(fa)

%%
%  (b)
fb = @(x) (0.5*x.^2 - sin(x));
b_min = fminbnd(fb,0,3)
figure(2)
plotf(fb)

%%
%  (c)
fc = @(x) (x.^2 + 4*cos(x));
c_min = fminbnd(fc,0,3)
figure(3)
plotf(fc)

%% 
%  (d)
fd = @(x) (gamma(x));
d_min = fminbnd(fd,0,3)
figure(4)
plotf(fd)

%%
% The plots demonstrate that the functions are unimodal because there is only
% one possible minimum over the specified interval.