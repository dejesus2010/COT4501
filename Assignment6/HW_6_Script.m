%% Homework 6
%  Daniel Gollahon
%  Ryan Dejesus
%  Ron Quan

%% Review 5.2
%
% True. We can view Newton's method as a systematic way of transforming a nonlinear equation f(x) = 0 into a fixed-point problem x = g(x) where g(x) = x - f(x)/f'(x). (p. 230)


%% Review 5.3
%
% False. This would still be a linear convergence rate because the solution would be gaining a *constant* number of digits of accuracy per iteration. (p. 223)

%% Review 5.4
%
% False. If the number of digits of accurate information we obtain per iteration in a linear scheme is relatively large and the number of digits of accuracy we're eventually trying to obtain is relatively small, we may compute the necessary digits faster through a linear method as compared to a superlinear method. I.e. if we want 4 digits of accuracy and we can gain 4 digits per iteration with  a linear solution method, it is probably faster just to use one iteration of that function.

%% Review 5.5
%
% For an ill-conditioned problem, |f(xk)| can be small without xk being close to the true solution, x*. We want the distance between |xk - x*| to be small so we would be better off choosing |xk - xk-1|. 

%% Review 5.7
%
% We must use an absolute rather than a relative condition number in assessing sensitivity, 
% because the function value at the solution is zero by definition. 

%% Review 5.8(a)
%
% The convergence rate r of an iterative method tells us that we will have r times as many correct digits after each iteration as it had the previous iteration. (p. 223)

%% Review 5.9
%
%  (a) Quadratic
%  (b) Linear
%  (p. 223)

%% Review 5.13
%
% A quadratically convergent method doubles the number of correct digits with each iteration. (p. 223)

%% Review 5.14
%
% In this case, r would be sqrt(2). (We would multiply r times itself over the course of two iterations and since sqrt(2)*sqrt(2) = 2, we have our answer).

%% Review 5.15
%
%  (a) A solution is a multiple root if it solves f(x) = 0 as well as one or more of it's derivatives f'(x) = f''(x) = ... = 0. (p. 220)
%  (b) The convergence rate remains unchanged. This is because interval bisection does not take into account the derivative and has a constant rate of convergence of log2( (b-a) / tol ) regardless of the nature of the function. (p. 226)
%  (c) It causes the convergence rate to move from quadratic to linear. (p. 231)

%% Review 5.16
%
%  All (a), (b), and (c) may occur. (p. 231)

%% Review 5.17
%
% (a) The root has a multiplicity of two. Since this is a multiple root, Newton's method will have a linear convergence rate of C = 1 - (1/2) = 1/2.
%  
% (b) In this case, there is not a multiple root so Newton's method will have quadratic convergence.

%% Review 5.20
%
%  (a) If x* = g(x*) and |g'(x*)| < 1, the iterative scheme is locally convergent. (p. 227)
%  (b) The asymptotic vonvergence rate is linear, with C = |g'(x*)| (p. 228[end])
%  (c) The rate is at least quadratic when g'(x*) = 0. (p. 229)
%  (d) Yes. g(x) = x - f(x)/f'(x) (p. 230)

%% Review 5.23
%
%  Advantage: The secant method is superlinearly convergent instead of only linearly convergent. (p. 233)
%  Disadvantage: It is not guaranteed that the secant method will converge if the initial guess is not good. (p. 233)  The bisection method will converge so long as the initial interval contains the solution. (p. 224)

%% Review 5.24
%
%  Advantage: The secant method requires only one new function evaluation per iteration (can be computed faster). (p. 233)
%  Disadvantage: It requires two starting geusses and converges somewhat more slowly. (Though this is often offset by the cheaper computation cost) (p. 233)

%% Review 5.25
%
%  (a)
%     1. ?
%     2. ?
%     3. ?
%  (b)  ?

%% Review 5.27
%
%  1. Bisection (slowest)
%  2. Secant (faster) [or is it the fastest? consider p. 233 offset]
%  3. Newton's method (fastest) [verify, as above]

%% Review 5.28
%
%  (a) Bisection: 1 bit per iteration. (p. 226)
%  (b) Newton's method: The number of correct digits is doubled at each iteration. (p. 231)

%% Refer to images for the answers to the exercises

%% Computer Problem 5.3
a = @(x)x^3-2*x-5;
da = @(x)3*x^2-2;
b = @(x)exp(-x)-x;
db = @(x)-1*exp(-x);
c = @(x)x*sin(x)-1;
dc = @(x)x*cos(x)+sin(x);
d = @(x)x^3-3*x^2+3*x-1;
dd = @(x)3*x^2-6*x+3;
tol = 1e-8;
maxIterations = 500;
%% Computer Problem 5.3(a)
% (a)
disp('Bisection (a)');
[root,convergence] = Bisection(2,4,a)
disp('Newton (a)');
[root,convergence,convergence_rate] = Newton(a,da,2,tol,maxIterations)
disp('Secant (a)');
[root,hx] = Secant(a,2,4,tol,maxIterations)
disp('Library function (a)');
[x,fval,exitflag] = fsolve(a,2)
%% Computer Problem 5.3(b)
% (b)
disp('Bisection (b)');
[root,convergence] = Bisection(0.2,1,b)
disp('Newton (b)');
[root,convergence,convergence_rate] = Newton(b,db,0.53,tol,maxIterations)
disp('Secant (b)');
[root,hx] = Secant(b,0.87,1,tol,maxIterations)
disp('Library function (b)');
[x,fval,exitflag] = fsolve(b,2)
%% Computer Problem 5.3(c)
% (c)
disp('Bisection (c)');
[root,convergence] = Bisection(2,3,c)
disp('Newton (c)');
[root,convergence,convergence_rate] = Newton(c,dc,3.1,tol,maxIterations)
disp('Secant (c)');
[root,hx] = Secant(c,1.8,3,tol,maxIterations)
disp('Library function (c)');
[x,fval,exitflag] = fsolve(c,3)
%% Computer Problem 5.3(d)

disp('Bisection (d)');
[root,convergence] = Bisection(-6,7,d)
disp('Newton (d)');
[root,convergence,convergence_rate] = Newton(d,dd,1.03,tol,maxIterations)
disp('Secant (d)');
[root,hx] = Secant(d,2.3,1.03,tol,maxIterations)
disp('Library function (d)');
[x,fval,exitflag] = fsolve(d,223)





