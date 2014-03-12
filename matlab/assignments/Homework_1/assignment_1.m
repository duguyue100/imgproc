% WAES3106 Image Processing Assignment 1
% Author: Hu Yuhuang (WEK110709)

%% Initialization
clc;
clear;
close all;

%% Question 1 (a)

% %%%%%%Read image%%%%%%

I1=imread('lena.jpg');
I2=imread('peppers.jpg');

% %%%%%%Show image%%%%%%
% show lena.jpg
figure, imshow(I1);
title('lena.jpg');
% show 
figure, imshow(I2);
title('peppers.jpg');

%% Question 1 (b)

% %%%%%%Construct image A%%%%%%
A=[I1(:,1:122,:), I2(:, 123:end, :)];

% %%%%%%Show image A%%%%%%
figure, imshow(A);
title('lena and peppers');

%% Question 2 (a)

% %%%%%%Read image%%%%%%

A1=imread('lena512colour.jpg');

% %%%%%%Show image%%%%%%
figure, imshow(A1)
title('lena512colour.jpg');

%% Question 2 (b)

% %%%%%%Duplicate image%%%%%%
A2=A1;

% %%%%%%Change colour band of A2%%%%%%
A2(:,:,1)=A1(:,:,3);
A2(:,:,2)=A1(:,:,1);
A2(:,:,3)=A1(:,:,2);


%% Question 2 (c)

% %%%%%%Show and save image%%%%%%
figure, imshow(A2);
title('modified lena512colour');

imwrite(A2, 'newlena512colour.jpeg', 'jpeg');