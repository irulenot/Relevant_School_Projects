function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

%    Attr Name           Size                     Bytes  Class
%    ==== ====           ====                     =====  =====
%         K              1x1                          8  double
%     f   X            300x2                       4800  double
%   a     argn           2x17                        34  char
%     f   centroids      3x2                         48  double
%     f   idx          300x1                       2400  double

x_size = size(X,1);
for i = 1:x_size
    x_origin = X(i,:);
    x_temp = x_origin;
    for i2 = 1:(K-1)
        x_temp = [x_temp; x_origin];
    end
    [distance, k] = min(sqrt(sum((x_temp - centroids).**2, 2)));
    idx(i) = k;
end

% =============================================================

end

