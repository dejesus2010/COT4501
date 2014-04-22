%% Numerical Analysis Homework Assignment 8
%  Ryan Dejesus
%  Daniel Gollahon
%  Ron Quan

%% Review 7.11
%  a)
% Interpolation is generally not a good way of smoothing out noisy data. [p. 311]
%  b)
% A least squares approximation is usually a much superior tool for dealing with noisy data. [p. 311] These techniques, however, can sometimes work together. For example, least squares fitting by cubic splines is a good method for smoothing noisy data. [p. 334]


%% Review 7.12
%  a)
%  1. Lagrange [p. 317]
%  2. Newton [p. 318]
%  3. Monomial [p. 317]
%  
%  b)
%  Lagrange [p. 317]
%  
%  c)
%  Lagrange [p. 317]

%% Review 7.13
%  a)
% A Vandermonde matrix is a matrix in which each column holds the successive powers of a particular constant. [p. 314] i.e.
%  1 t1 t1^2 t1^3 ... t1^n-1
%  1 t2 t2^2 t2^3 ... t2^n-1
%  ...
%  1 tm tm^2 tm^3 ... tm^n-1
%  
%  b)
%  The Vandermonde matrix is useful for computing polynomial interpolation with a monomial basis. [p. 314]
%  
%  c)
% Even though the Vandermonde matrix is neccesarily non-singular for distinct values of t, it becomes ill-conditioned with high-degree polynomials. This occurs because the functions become progressively less distinguishable as the degree increases. This causes the columns of the matrix to become very nearly linearly dependent. The matrix becomes highly singular as the matrix grows at least exponentially with the number of data points and the resulting coefficients can become singular to within working precision. [p. 315]

%% Review 7.24
%  a)
% Hermite interpolation differs from other forms of interpolation in a few ways. First, it is piecewise, meaning that the interpolation is not one continuous function, but rather cubic functions that describe the pathway between two data points. Additionally, it holds the requirement that the derivatives of these functions when they meet must be continuous. The other main difference is that the Hermite cubic interpolant is not unique--free parameters (i.e. the derivative) can be chosen to conform to desired characteristics such as monotonicity or convexity. [p. 327]
%  
%  b)
% A cubic spline is also a piecewise polynomial, but it requires that (like the Hermite interpolation) the derivative of the polynomials are continuous, but additionally the second derivative is required to be continuous. In the general case, a spline of degree k must be continuously differentiable k-1 times. [p. 327]

%% Review 7.25
%  a)
% Cubic spline interpolation should be chosen if maximum smoothness is desired. [p. 329]
%  b)
% To preserve monotonicity, a Hermite cubic interpolation should be chosen. [p. 329]

%% Review 7.26
%  a)
%  Once. [p. 327]
%  b)
%  Twice [p. 327]

%% Review 7.27
%  Possible constraints:
%  1. Forcing the second derivative to be zero at the endpoints, which would create a natural spline. [p. 327]
%  2. Forcing equality of the first derivatives as well as equality of the second derivatives at the  endpoints t1 and tn (if the spline is going to be periodic). [p. 327]

%% Exercise 7.1 (skip part c)

%% Exercise 7.4 (skip part c)

%% Exercise 7.5 (skip part c)

%% Computer Problem 7.4

%% Computer Problem 7.5
