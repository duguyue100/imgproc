% Author: Hu Yuhuang
% Date  : 2014-08-18

%% init

clc;
clear;
close all;

%% testing on functions

I=imread('lena.jpg'); % please change this to a image you have in path

O=matrixToColumn(I);

I_convert=columnToMatrix(O, size(I,1), size(I,2));

figure, imshow(I_convert);

%% preparing data in a list

% I don't have a video available, so here I sketch a conceptual idea.
% You need few paramters to get this work:
% 1. number of rows and number of columns in each frame
% 2. number of frames

% here I make some assumptions:
noFrame=100; % number of frames
noRows=300; % number of rows
noCol=200; % number of columns

D=zeros(noRows*noCol, noFrame); % to speedup the process

% assume you have all frames in cell structure
% you can convert to to any format as long as you can index the image
% here is just a dummy example of frame;
% do not use it!!!
% In principle, you should have a error here!!!
% Just a sample
frame=cell(1,100);

for i=1:noFrame
    D(i,:)=matrixToColumn(frame{i});
end