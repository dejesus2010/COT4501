%% Exercise 4.1
% (a) Prove that 5 is an eigenvalue of the matrix
A = [6 3 3 1; 0 7 4 5; 0 0 5 4; 0 0 0 8];
result = eig(A);
disp('5 is in the following vector containing the real eigenvalues of matrix A:');
disp(result);
%%
% (b) Exhibit an eigenvector of A corresponding to the eigenvalue 5
% To answer this problem, we must solve Ax = 5*x = (A-5*eye(4))x = 0
[A,B] = eig(A)
AL = A - 5*eye(4);
result = null(AL);
disp('Eigenvector corresponding to eigenvector 5:');
disp(result);
%% Exercise 4.2
% 
% What are the eigenvalues and corresponding eigenvectors of the following
% matrix?
A = [ 1 2 -4; 0 2 1; 0 0 3];
disp('Eigen Values:');
eig(A)
disp('Eigen Vectors are the columns of vector V:');
[V,D] = eig(A);
disp(V);
%% Exercise 4.3
%
%%
% $(a)\ det(A- \lambda I) = (1- \lambda )(1- \lambda )-4 = 0$

% = (1-$\lambda$)^2 - 4 = 0
%
%%
% (b) $\lambda$ = -1,3
%
%%
% (c) What are the eigenvalues of A?
A = [1 4; 1 1];
eig(A)
%%
% (d) What are the eigenvectors of A?
[v,~] = eig(A)
disp( 'Eigen Vectors of A are the column of the following matrix: ' )
disp(v)
%%
% (e) Perform one iteration of power iteration on A using $x_0$ = [1 1]'
%
x0 = [1 1]';

% The following is used for normalized power iteration:
x1 = A*x0;
LAMBDA = norm(x1);
x1 = x1 / LAMBDA;
disp(x1);

%%
% (f) To what eigenvector of A will power iteration ultimately converge?
[v,d] = eig(A);

%%
% The power iteration will converge to the eigenvector corresponding to the
% dominant eigenvalue (3) which is the eigenvector below.

disp(v(1:end,1));

%%
% (h) To what eigenvector of A would inverse iteration ultimately converge?
%
% The inverse iteration converges to the eigenvector corresponding to the 
% smallest eigenvalue of A (-1). [see p.166, last sentence.]

disp(v(1:end,2));
%%
% (i) What eigen value of A would be obtained if inverse iteration were used with shift $\sigma = 2$?
%
% Inverse iteration with a shift of 2 will eventually converge on the
% eigenvalue of 3 because the process approaches the eigenvalue closest to
% the shift.

%% Exercise 4.5
%
% (a) The eigenvalues can theoretically be calculated by solving
% the characteristic equation produced from det(A-$\lambda$I) = 0
% as long as the degree of the characteristic equation be no larger than
% 4. Otherwise, other steps must be taken...
% The characteristic equation will be in the form:
%
% $p(\lambda) = c_0 + c_1\lambda + ... + c_n\lambda^n$
%
%

%% Exercise 4.8
%
A = [0 0 1 4 ; 0 2 -2 2 ; 1 -2 1 3; 1 -2 1 3 ]
eig(A)

%% Computer Prob 4.2
%
% (a) Implement power iteration to compute the dominant eigenvalue and a
% corresponding eigenvector of the matrix A:
%
% function [ x, LAMBDA] = Power_it( A,x )
%
%    [m,n] = size(A);
%    %x = rand(m,1);
%    for i = 1:500
%        x = A*x;
%        LAMBDA = norm(x);
%        x = x/LAMBDA;
%    end%for
%    
%    x;
%    LAMBDA;
% end
A = [2 3 2; 10 3 4; 3 6 1];
x0 = [0 0 1]'
[first_eig_vec_answer, first_eig_val_answer ] = Power_it(A,x0);
disp('The dominant eigenvalue:');
disp(first_eig_val_answer);
disp('The eigenvector corresponding to the dom eigenvalue:');
disp(first_eig_vec_answer);

%%
%
%
% (b) Using any of the method for deflation given in Section 4.5.4, deflate out the eigenvalue found in part a

H = house_matrix(first_eig_vec_answer)
H*first_eig_vec_answer
Eig_Diag_Matrx = H*A*H'
temp_Diag_Matrix = H*A*H';
%% 
% Applying power iteration again to compute the second largest eigenvalue of the same matrix
% Refer to page 179 for help

Eig_Diag_Matrx = Eig_Diag_Matrx(2:end,2:end)
x0 = rand(2,1)
[second_eig_vec_answer, second_eig_val_answer] = Power_it(Eig_Diag_Matrx,x0)

disp('The second largest absolute eigenvalue is:');
disp(second_eig_val_answer);

bT = temp_Diag_Matrix(1,2:end)

alpha_num = bT*second_eig_vec_answer;
alpha_den = second_eig_val_answer - first_eig_val_answer;

alpha = alpha_num/alpha_den;
right_matrix = [alpha; second_eig_vec_answer]
x2 = inv(H)*right_matrix
%%
% (c) Use a general real eigensystem library routin to compute all of the
% eigenvalues and eigenvectors of the matrix, and compare the results with
% those obtained in parts a and b
[eig_vectors eig_values] = eig(A)

disp('First largest absolute eigenvalue produced from eig(A):');
disp(eig_values(1,1));
disp('First dominant eigenvalue produced from our calculations:');
disp(first_eig_val_answer);

disp('Vector corresponding to second largest absolute eigenvalue produced from eig(A):');
disp(eig_vectors(1:end,1));
disp('Vector corresponding to second dominant eigenvalue produced from our calculations:');
disp(first_eig_vec_answer);

disp('Second largest absolute eigenvalue produced from eig(A):');
disp(abs(eig_values(3,3)));
disp('Second dominant eigenvalue produced from our calculations:');
disp(second_eig_val_answer);

disp('Vector corresponding to second largest absolute eigenvalue produced from eig(A):');
disp(eig_vectors(1:end,3));
disp('Vector corresponding to second dominant eigenvalue produced from our calculations:');
disp(x2);


