% Author: Hu Yuhuang
% Date  : 2014-08-28

%% init

clc;
clear;
close all;

%% read data

% load data
load('BW.mat');

% number videos
noVideos=length(BW_im);

%% play single video

% let's try to play first video

V=BW_im{1};

noFrames=size(V,3);

for i=1:noFrames
    imshow(V(:,:,i));
    pause(0.05); % just for display usage
end

disp('video is played');

% so each element of this cell is a 3-dimension matrix
% the first 2 dimensions define spatial relationship and
% the third dimension defines temporal dimension

%% create this kind of 3-d matrix

%%%%% following code just for generating a video in cell format just ignore it

A=cell(1, noFrames);
for i=1:noFrames
    A{i}=V(:,:,i);
end

%%%%% above code just for generating a video in cell format just ignore it

% suppose we have a video which is store in cell
% and each cell contains a 2d matrix

% first, we need to identify how many frames and dimension of video frame

noFrame=length(A);
noRow=size(A{1}, 1); % height
noCol=size(A{1}, 2); % width

% create a 3d matrix

V_new=zeros(noRow, noCol, noFrame);

% assign matrix

for i=1:noFrame;
    V_new(:,:,i)=A{i};
end

disp('new video matrix is generated');
% and now V_new is your 3-d matrix which represents a video
% don't believe? ok, let's play it.

figure,
for i=1:noFrame
    imshow(V_new(:,:,i));
    pause(0.05); % just for display usage
end


% you can turn every video to 3d matrix in this way.
% and then put them in to a cell

% but there should be a more direct way right?
% and yes, there is
% 1. read a video object, from this object, you can know number of frames,
% width and height of each frame.
%
% 2. init a empty 3-d matrix for this video, something like
% V=zeros(height, width, noFrames);
%
% 3. read video frame by frame, process the frame (judge by the given data
% set, you probably need to turn to logical image [contains only 1 and 0]
% instead of gray scale), but it depends on what you need. I don't judge.
%
% 4. assign the video to the matrix, like the example above
%
% 5. by the end of the loop, you should get a video in 3d matrix
%
% 6. put it into the cell. (of course, you need to have this cell first)
% and in order to read all videos at once, you probably need a double loop
% inside your code, something like

% %create a cell
% for i=1 to noVideos
%     % read the ith video
%     % create empty 3d matrix
%     for j=1 to noFrames of video i
%         % some code here to process video
%     end
%     % put it into cell in the index i
% end











