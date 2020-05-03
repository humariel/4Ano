function [confidence] = confidence_interval(X, alpha, numIter)
%returns the [(1 -alpha)*100]% confidence interval for values in X given
%numIter iterations
confidence = norminv(1-alpha/2)*sqrt(var(X)/numIter);
end

