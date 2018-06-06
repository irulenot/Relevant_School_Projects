function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%    Attr Name        Size                     Bytes  Class
%    ==== ====        ====                     =====  =====
%     f   C           1x1                          8  double
%     f   X         211x2                       3376  double
%     f   Xval      200x2                       3200  double
%   a     argn        4x4                         16  char
%     f   sigma       1x1                          8  double
%     f   y         211x1                       1688  double
%     f   yval      200x1                       1600  double 

it = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
best_error = inf;
best_C = C;
best_sigma = sigma;
for i = 1:8
    for b = 1:8
        C = it(i);
        sigma = it(b);

        model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
        predictions = svmPredict(model, Xval);
        if (mean(double(predictions ~= yval)) < best_error)
            best_error = mean(double(predictions ~= yval));
            best_C = it(i);
            best_sigma = it(b);
        endif

    end
end

C = best_C;
sigma = best_sigma;

% =========================================================================

end
