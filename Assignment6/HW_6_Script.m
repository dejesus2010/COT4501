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
% False. If the number of digits of accuracy is relatively small and the fixed number of digits you gain by linear convergence is considerably more than the initial accuracy gained by a superlinearly convergent method, it is possible that the method of linear convergence could be faster.  (p. ???)

%% Review 5.5
%
% It would be better to use |f(xk)| small than |xk-xk-1| small as a termination criteria. Finding when |f(xk)| (the residual)  is small gives us an idea as to whether or not the problem has actually been solved. |xk+1-xk|/|xk| gives us a good diea of when the approximate solution has stopped changing significantly. The |xk-xk-1| is not as good because it's not relative to |xk-1|. (Conjecture... [???] p. 223)

%% Review 5.7
%
% We cannot use a relative condition number because the function value of the solution will be zero. [div by zero??] (p. 221) 

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
% In this case, r would be sqrt(2). (We would multiply r times itself over the course of two iterations and since sqrt(2)*sqrt(2) = 2, we have our answer). [no page number--verify logic?]

%% Review 5.15
%
%  (a) A solution is a multiple root if it solves f(x) = 0 as well as a number of it's derivatives f'(x) = f''(x) = ... = 0. (p. 220)
%  (b) No effect... or can't solve? [guessing. keeps bisecting--not dependent??] [???]
%  (c) It causes the convergence rate to move from quadratic to linear. (p. 231)

%% Review 5.16
%
%  All (a), (b), and (c) may occur. (p. 231)

%% Review 5.17
%
% ? not sure how to solve...

%% Review 5.20
%
%  (a) If x* = g(x*) and |g'(x*)| < 1, the iterative scheme is locally convergent. (p. 227)
%  (b) The asymptotic vonvergence rate is linear, with C = |g'(x*)| (p. 228[end])
%  (c) The rate is at least quadratic when g'(x*) = 0. (p. 229)
%  (d) Yes(?) [what is the function g in this case? if not, why not?]

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

%% Exercise 5.1
%
%

%% Exercise 5.2
%
%

%% Exercise 5.3
%
%

%% Exercise 5.4
%
%

%% Exercise 5.9
%
%

%% Exercise 5.10
%
%

%% Exercise 5.13
%
%

%% Computer Problem 5.3
