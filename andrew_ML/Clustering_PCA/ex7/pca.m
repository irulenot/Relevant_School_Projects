function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%

% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.
U = zeros(n);
S = zeros(n);

% ====================== YOUR CODE HERE ======================
% Instructions: You should first compute the covariance matrix. Then, you
%               should use the "svd" function to compute the eigenvectors
%               and eigenvalues of the covariance matrix. 
%
% Note: When computing the covariance matrix, remember to divide by m (the
%       number of examples).
%

%    Attr Name        Size                     Bytes  Class
%    ==== ====        ====                     =====  =====
%     f   S           2x2                         32  double
%     f   U           2x2                         32  double
%     f   X          50x2                        800  double
%   a     argn        1x6                          6  char
%         m           1x1                          8  double
%         n           1x1                          8  double

Sigma = (1/m) .* (X'*X); # aka covarience
[U, S, V] = svd(Sigma);

% =========================================================================

end
