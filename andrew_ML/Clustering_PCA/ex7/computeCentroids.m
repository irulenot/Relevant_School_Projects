function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

%    Attr Name           Size                     Bytes  Class
%    ==== ====           ====                     =====  =====
%     f   K              1x1                          8  double
%     f   X            300x2                       4800  double
%   a     argn           3x3                          9  char
%     f   centroids      3x2                         48  double
%     f   idx          300x1                       2400  double
%         m              1x1                          8  double
%         n              1x1                          8  double

for i = 1:K
    if(size(X(idx==i),1) > 1 && n > 1)
        centroids(i,:) = sum(X(idx==i,:)) / size(idx(idx==i), 1);
    else
        centroids(i,:) = X(idx(idx==i),:);
    endif
end

% =============================================================


end

