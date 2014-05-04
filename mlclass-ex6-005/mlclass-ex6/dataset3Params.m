function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
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

%Remove the comment block markers to unleash the power of code
%that selects best values for C and Sigma from a given set.
%{
error=0;
lowestError=1000000000000; %Basically, a large value (for the first step)
bestC=0;
bestSigma=0;
set=[0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
for i=1:size(set,2)
	for j=1:size(set,2)
		C=set(i);
		sigma=set(j);
		model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
		predictions = svmPredict(model, Xval);
		error=mean(double(predictions ~= yval));
		if (error<lowestError)
			bestC=C;
			bestSigma=sigma;
			lowestError=error;
			end
		end
	end

sigma=bestSigma
C=bestC
%}

%Best values found by running the code above
sigma=0.1;
C=1;









% =========================================================================

end
