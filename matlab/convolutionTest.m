% This file contains the test for convoluation using Matlab build-in
% toolbox.
% Author: Hu Yuhuang
% Date: 2014-03-19

%% init

clc;
clear;
close all;

%% load image & 1d signal (using sine wave as example)

I=imread('Lenna.png');
grayI=rgb2gray(I);
X=0:0.01:10*pi;
Y=sin(X);

%% filter design

% 1-d Gaussian filter

FX=-2:0.1:2;
FY=gaussianFunction(FX, 0, 5);

% 2-d Gaussian filter

kernel_height=21;
kernel_width=21;
FY2=fspecial('gaussian', [kernel_height, kernel_width], 10);

%% filtering

filteredY=conv(Y, FY);
filteredI=conv2(double(grayI), FY2);
filteredI=uint8(filteredI);

%% display result

result_rows=2;
result_cols=3;

subplot(result_rows, result_cols, 1), plot(Y), title('1-d signal'),
subplot(result_rows, result_cols, 2), plot(FY), title('1-d Gaussian filter'),
subplot(result_rows, result_cols, 3), plot(filteredY), title('filtered signal');
subplot(result_rows, result_cols, 4), imshow(grayI), title('Lenna in gray');
subplot(result_rows, result_cols, 5), imshow(im2uint8(FY2*100)), title('2-d Gaussian filter');
subplot(result_rows, result_cols, 6), imshow(filteredI), title('filtered Lenna');

