function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

total=0;
gradtotal=0;
for iter = 1:size(X,1)
	Hx=sigmoid(theta'*X(iter,:)');	
	total=total+(-y(iter)*log(Hx)-(1-y(iter))*log(1-Hx));
	for iter2 = 1:size(theta)
		grad(iter2)=grad(iter2)+(Hx-y(iter))*X(iter,iter2);
		end
	end

grad=grad./m;
sumThetaJSq=0;
for iter=2:size(theta)
	sumThetaJSq=sumThetaJSq+theta(iter)^2;
	grad(iter)=grad(iter)+lambda/m*theta(iter);
	end

J=total/m+(lambda*sumThetaJSq)/(2*m);




% =============================================================

end
