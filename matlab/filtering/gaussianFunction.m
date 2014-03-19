function Y=gaussianFunction(X, mu, sigma)
% this function implements gaussian function.
%
% ---Input---
% X: sample in x-axis
% mu: mean
% sigma: variance
% ---Output---
% Y: output

Y=1/sqrt(2*pi*sigma).*exp(-1*(X-mu).^2/(2*sigma));

end