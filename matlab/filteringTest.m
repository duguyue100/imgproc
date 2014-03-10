% This file contains main test for filtering tests

%% init

clc;
clear;
close all;

%% configuration

% Lenna is standard input
X=imread('Lenna.png');

% turn image to gray scale
X_gray=rgb2gray(X); % will write a function on this

% turn image to double image form to perform more flexible operation

X_double=im2double(X_gray);


%% smoothing by averaging

averaging_k=4; % control boundary size 
averagingK=2*averaging_k+1;
averagingMask=ones(averagingK,averagingK)/(averagingK*averagingK);

Y_averaging=convolution(X_double, averagingMask);
averagingKernalImage=kernalImage(averagingMask);

%% smoothing by Gaussian kernal

gaussian_k=20;
gaussianK=2*gaussian_k+1;
Sigma=5;
gaussianMask=gaussianKernal(gaussianK, Sigma);

Y_gaussian=convolution(X_double, gaussianMask);

% the visualization is not so good for large standard deviation
gaussianKernalImage=kernalImage(gaussianMask);

%% sharpening filter

sharp_k=5;
sharpK=2*sharp_k+1;

temp=zeros(sharpK, sharpK);
temp(sharp_k+1, sharp_k+1)=2;
sharpMask=temp-ones(sharpK, sharpK)/(sharpK^2);

Y_sharp=convolution(X_double, sharpMask);

%% Gabor filter

gabor_k=5;
sigma=5;
lambda=8;
theta=0;
psi=0;
gamma=0.5;

gaborMask=gabor_fn(gabor_k, sigma, theta, lambda, psi, gamma);

Y_gabor=convolution(X_double, gaborMask);
Y_gabor=Y_gabor/max(max(Y_gabor));

%% vertical Sobel filter

verticalsobelMask=[1,0,-1; 2,0,-2; 1,0,-1];

Y_vertical_sobel=convolution(X_double, verticalsobelMask);

%% horizontal Sobel filter

horizontalsobelMask=[1,2,1;0,0,0;-1,-2,-1];

Y_horizontal_sobel=convolution(X_double, horizontalsobelMask);

%% Show result

noInRows=4;
noInCols=4;
subplot(noInRows,noInCols,1), imshow(X), title('original image'),
subplot(noInRows,noInCols,2), imshow(X_gray), title('gray-scale image'),
subplot(noInRows,noInCols,3), imshow(Y_averaging), title('smoothing by averaging'),
subplot(noInRows,noInCols,4), imshow(averagingKernalImage), title('averaging kernal'),
subplot(noInRows,noInCols,5), imshow(Y_gaussian), title('smoothing by Gaussian'),
subplot(noInRows,noInCols,6), surf(gaussianMask), title('gaussian kernal'),
subplot(noInRows,noInCols,7), imshow(Y_sharp), title('sharpen by sharpening filter'),
subplot(noInRows,noInCols,8), surf(sharpMask), title('sharpening filter'),
subplot(noInRows,noInCols,9), imshow(Y_gabor), title('gabor filtering'),
subplot(noInRows,noInCols,11), imshow(Y_vertical_sobel), title('vertical sobel filtering'),
subplot(noInRows,noInCols,13), imshow(Y_horizontal_sobel), title('horizontal sobel filtering');