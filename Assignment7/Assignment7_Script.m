%% Numerical Analysis: Assignment 7
% Ryan Dejesus
% Daniel Gollahon
% Ron Quan

%% Review 6.1

%% Review 6.2

%% Review 6.8

%% Review 6.9

%% Review 6.10

%% Review 6.14

%% Exercise 6.3

%% Exercise 6.4

%% Computer Problem 6.3

%% 
%  (a)
fa = @(x) (x.^4 - 14*x.^3 + 60*x.^2 - 70*x);
a_min = fminbnd(fa,0,3)
figure(1)
plot(0:.05:3,fa(0:.05:3))

%%
%  (b)
fb = @(x) (0.5*x.^2 - sin(x));
b_min = fminbnd(fb,0,3)
figure(2)
plot(0:.05:3,fb(0:.05:3))

%%
%  (c)
fc = @(x) (x.^2 + 4*cos(x));
c_min = fminbnd(fc,0,3)
figure(3)
plot(0:.05:3,fc(0:.05:3))

%% 
%  (d)
fd = @(x) (gamma(x));
d_min = fminbnd(fd,0,3)
figure(4)
plot(0:.05:3,fd(0:.05:3))

%%
% The plots demonstrate that the functions are unimodal because there is only
% one possible minimum over the specified interval.