function sim = gaussianKernel(x1, x2, sigma)
%RBFKERNEL returns a radial basis function kernel between x1 and x2
%   sim = gaussianKernel(x1, x2) returns a gaussian kernel between x1 and x2
%   and returns the value in sim

% Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

% You need to return the following variables correctly.
sim = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the similarity between x1
%               and x2 computed using a Gaussian kernel with bandwidth
%               sigma
%
%

%    Attr Name        Size                     Bytes  Class
%    ==== ====        ====                     =====  =====
%   a     argn        3x5                         15  char
%     f   sigma       1x1                          8  double
%     f   sim         1x1                          8  double
%     f   x1          3x1                         24  double
%     f   x2          3x1                         24  double

x = sum((x1-x2).^2);
a = -(x / (2 * sigma^2));
sim = exp(a);

% =============================================================
    
end
