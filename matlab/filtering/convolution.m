function Y=convolution(X, mask)
% this function perform convolution for single channel image
%
% %%%Input%%%
% X: input image
% mask: specific convolution mask in 2k+1*2k+1
%
% %%%Output%%%
% Y: output image

%% parameters & variables

% mask
maskLength=size(mask, 1);
boundary=(maskLength-1)/2;

% image
noRows=size(X, 1);
noCols=size(X, 2);

X_temp=zeros(noRows+boundary*2, noCols+boundary*2);
X_temp(boundary+1:noRows+boundary, boundary+1:noCols+boundary)=X;

%% calculating convoution

Y=zeros(size(X));

for i=1:noRows
    for j=1:noCols
        % calculating corresponding axis
        center_i=i+boundary;
        center_j=j+boundary;
        
        Y(i,j)=sum(sum(X_temp(center_i-boundary:center_i+boundary, center_j-boundary:center_j+boundary).*mask));
    end
end

end