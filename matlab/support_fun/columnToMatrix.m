function I=columnToMatrix(O, noRow, noCol)
% This function converts column to matrix, typically we receive a column
% vector, number of row and number of columns of original image. And then
% turn it to a gray-scale image.
%
% INPUT
% O     : matrix in column form
% noRow : number of rows
% noCol : number of columns
%
% OUTPUT
% I     : original image

I=reshape(O, noRow, noCol);

end