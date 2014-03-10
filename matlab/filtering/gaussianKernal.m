function Y=gaussianKernal(K, Sigma)
% This function produce a singal channel gaussian kernal
%
% %%%Input%%%
% K: side length
% Sigma: standard deviation
%
% %%%Output%%%
% Y: Gaussian Kernal

%% calculating Gaussian distribution

% create Y
Y=zeros(K,K);
k=(K-1)/2;

for i=1:K
    for j=1:K
        x=(i-k-1)^2;
        y=(j-k-1)^2;
        Y(i,j)=(1/2*pi*Sigma)*exp(-1*(x+y)/(2*Sigma^2));
    end
end

%% normalize Y
sumY=sum(sum(Y));
Y=Y./sumY;

end