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

% Cost (regularization is not applied to theta(1))
j_logistic_reg = (1/m) * sum(-y'*log(sigmoid(X*theta)) - (1 - y')*log(1 - sigmoid(X*theta)));
regularization = lambda / (2 * m) * theta(2:end)' * theta(2:end);

J = j_logistic_reg + regularization;

% Gradient
grad_logis_reg = (1/m) * (sigmoid(X * theta) - y)' * X;
grad_regulariz = zeros(size(theta))';
grad_regulariz(2:end) = (lambda / m) * theta(2:end)'; 

grad = grad_logis_reg + grad_regulariz;

% =============================================================

end
