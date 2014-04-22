%% Numerical Analysis Homework Assignment 8
%  Ryan Dejesus
%  Daniel Gollahon
%  Ron Quan

%% Review 7.11
%  a)
%     Interpolation is generally not a good way of smoothing out noisy data. [p. 311]
%  
%  b)
%     A least squares approximation is usually a much superior tool for dealing 
%     with noisy data. [p. 311] These techniques, however, can sometimes work together.
%     For example, least squares fitting by cubic splines is a good method for smoothing
%     noisy data. [p. 334]

%% Review 7.12
%  a)
%     1. Lagrange [p. 317]
%     2. Newton [p. 318]
%     3. Monomial [p. 317]
%  
%  b)
%     Lagrange [p. 317]
%  
%  c)
%     Lagrange [p. 317]

%% Review 7.13
%  a)
%     A Vandermonde matrix is a matrix in which each column holds the successive 
%     powers of a particular constant. [p. 314]
%  
%     i.e.
%  
%     [ 1 t1 t1^2 t1^3 ... t1^n-1 ]
%     [ 1 t2 t2^2 t2^3 ... t2^n-1 ]
%     [... ... ... ... ... ... ...]
%     [ 1 tm tm^2 tm^3 ... tm^n-1 ]
%  
%  b)
%     The Vandermonde matrix is useful for computing polynomial interpolation
%     with a monomial basis. [p. 314]

%%
%  c)
%     Even though the Vandermonde matrix is neccesarily non-singular for distinct values
%     of t, it becomes ill-conditioned with high-degree polynomials. This occurs because
%     the functions become progressively less distinguishable as the degree increases. 
%     This causes the columns of the matrix to become very nearly linearly dependent. The
%     matrix becomes highly singular as the matrix grows at least exponentially with the 
%     number of data points and the resulting coefficients can become singular to within
%     working precision. [p. 315]

%% Review 7.24
%  a)
%     Hermite interpolation differs from other forms of interpolation in a few ways.
%     First, it is piecewise, meaning that the interpolation is not one continuous 
%     function, but rather cubic functions that describe the pathway between two data
%     points. Additionally, it holds the requirement that the derivatives of these
%     functions when they meet must be continuous. The other main difference is that
%     the Hermite cubic interpolant is not unique--free parameters (i.e. the derivative)
%     can be chosen to conform to desired characteristics such as monotonicity or
%     convexity. [p. 327]
%  
%  b)
%     A cubic spline is also a piecewise polynomial, but it requires that (like the
%     Hermite interpolation) the derivative of the polynomials are continuous, but
%     additionally the second derivative is required to be continuous. In the general 
%     case, a spline of degree k must be continuously differentiable k-1 times. [p. 327]

%% Review 7.25
%  a)
%     Cubic spline interpolation should be chosen if maximum smoothness is desired. [p. 329]
%  b)
%     To preserve monotonicity, a Hermite cubic interpolation should be chosen. [p. 329]

%% Review 7.26
%  a)
%     Once. [p. 327]
%  b)
%     Twice [p. 327]

%% Review 7.27
%  Two Possible constraints:
%  
%  1. Forcing the second derivative to be zero at the endpoints, which would create a 
%  natural spline. [p. 327]
%  
%  2. Forcing equality of the first derivatives as well as equality of the second derivatives
%  at the  endpoints t1 and tn (if the spline is going to be periodic). [p. 327]

%% Exercise 7.1 (skip part c)
%input data
t_data = [-1 0 1]';
y = [1 0 1]';

%a)
disp('a) Monomial Basis');
A = [ones(3,1) t_data(:) t_data(:).^2]; %vandermonde matrix
x = A \ y; %compute coefficients
disp(['P2(t) = ' num2str(x(3)) '*t^2 + ' num2str(x(2)) '*t + ' num2str(x(1))]);

%b)
disp(' ');
disp('b) Lagrange Basis');

%calculate lagrange
syms t;
L = 0;
n = 3;
for i=1:n
  l=1;
  for j = 1:n
    if i~=j
      l=l*(t-t_data(j))/(t_data(i)-t_data(j));
    end
  end
  L = L + y(i)*l;
end
disp(simplify(L));

%result
disp(' ');
disp('As shown above, both methods produce the same interpolating polynomial.');

%% Exercise 7.4 (skip part c)
%  a)
%     Using Horner's method, evaluating the polynomial represented in the monomial 
%     basis requires only O(n) multiplications to be performed. [p. 316]
%  b)
%     Evaluating the Lagrange polynomial requires O(n^2) multiplications. [p. 317]

%% Exercise 7.5 (skip part c)
%input data
t_data = [1 2 3 4]';
y = [11 29 65 125]';

%a)
disp('a) Monomial Basis');
A = [ones(4,1) t_data(:) t_data(:).^2 t_data(:).^3]; %vandermonde matrix
x = A \ y; %compute coefficients
disp(['P2(t) = ' num2str(x(4)) '*t^3 + ' num2str(x(3)) '*t^2 + ' num2str(x(2)) '*t + ' num2str(x(1))]);

%b)
disp(' ');
disp('b) Lagrange Basis');

%calculate lagrange
syms t;
L = 0;
n = 4;
for i=1:n
  l=1;
  for j = 1:n
    if i~=j
      l=l*(t-t_data(j))/(t_data(i)-t_data(j));
    end
  end
  L = L + y(i)*l;
end
disp(simplify(L));

%result
disp(' ');
disp('As shown above, both methods produce the same interpolating polynomial.');

%% Computer Problem 7.4
runge = @(t)(1./(1+25*t.^2));
t11 = -1:.2:1;%n=11
t21 = -1:.1:1;%n=21
xplot = -1:.001:1;% plot helper

%%
%  Polynomial interpolant: n=11
fig1 = figure(1);

p = polyfit(t11,runge(t11),10);%polynomial of degree n-1
plot(xplot,polyval(p,xplot),'b-',t11,runge(t11),'ro');

%%
%  Cubic spline: n=11
fig2 = figure(2);

yy = spline(t11,runge(t11),xplot);
plot(xplot,yy,'b-',t11,runge(t11),'ro');

%%
%  Polynomial interpolant: n=21
fig3 = figure(3);

p = polyfit(t21,runge(t21),20);%polynomial of degree n-1
plot(xplot,polyval(p,xplot),'b-',t21,runge(t21),'ro');

%%
%  Cubic spline: n=21
fig4=figure(4);

yy = spline(t21,runge(t21),xplot);
plot(xplot,yy,'b-',t21,runge(t21),'ro');


%% Computer Problem 7.5
%input data
t_data = [0 0.5 1 6  7  9];
y = [0 1.6 2 2 1.5 0];

xplot = 0:.001:9;%plot helper

%%
%  a) Polynomial Fit of Degree 5
fig5=figure(5);

p = polyfit(t_data,y,5);
plot(xplot,polyval(p,xplot),'b-',t_data,y,'ro');

%%
%  b) Cubic Spline Fit
fig6=figure(6);

yy = spline(t_data,y,xplot);
plot(xplot,yy,'b-',t_data,y,'ro');

%%
%  c)
%     The spline seems to give the more reasonable values between data points.
%     This is because the spline considers a continuous derivative and
%     curvature across the points which smooths out the connecting curves, but
%     the polyfit method only ensures that all the points are passed through 
%     and does not attempt to moderate the derivatve at each point. More
%     importantly, since the polyfit function is a continuous polynomial, it
%     is required to have a dip either up or down between the two center
%     points which share a y value and this introduces undesirable "wiggle".

%% 
%  d) Piecewise Linear Interpolation
%     Yes, in this case a direct line fit would be more desirable. This is
%     true because it tends to fit this particular set of data--especially
%     since there are two consecutive points whose y values are the same...
%     causing a straight line to be the most logical interpolation here. See
%     the plot below. This however does come at the cost of jagged edges and a
%     discontinuous derivative so the ideality of this approach would depend
%     on the desired smoothness and the application the data is required for.

fig7=figure(7);
plot(t_data,y,'b-',t_data,y,'ro');