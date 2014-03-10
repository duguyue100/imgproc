function Y=kernalImage(X)
% this function will draw specific kernal X to a kernal image for
% visualization. (single channel)
%
% %%%Input%%%
% X: kernal
%
% %%%Output%%%
% Y: kernal image in uint8 image format


% currently, we just simply show kernal image by convert it to uint8 format
Y=im2uint8(X);

end