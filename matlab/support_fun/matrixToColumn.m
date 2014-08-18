function O=matrixToColumn(I)
% This function alter a matrix in column form, typically this function
% receives a image. If it's a grayscale image, then the conversion is
% conducted straight away. If it's a color image, then the function would
% change to grayscale image first.
%
% INPUT
% I : original image
%
% OUTPUT
% O : image in column form

if (size(I,3)==1) % gray-scale
    O=I(:);
elseif (size(I,3==3)) % color image
    temp=rgb2gray(I);
    O=temp(:);
end   

end