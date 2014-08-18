% this file contains tutorail 4-5: Frequency Domain
% Author: Hu Yuhuang
% Date: 2014-03-27

%% init

clc;
clear;
close all;

%% 1-d signal example

M=1000;
f=zeros(1,M);
l=20;
f(M/2-l:M/2+l)=1;
F=fft(f);
Fc=fftshift(F);
rFc=real(Fc);
iFc=imag(Fc);

figure, 
subplot(2,1,1), plot(abs(Fc)), title('spectrum');
subplot(2,1,2), plot(atan(iFc./rFc)), title('phase angle');

%% fourier transform of a synthetic image

f=ones(10,20);
F=fft2(f, 500, 500);
f1=zeros(500, 500);
f1(240:260, 230:270)=1;

figure, 
subplot(2,2,1), imshow(f1, []), title('f1');
S=abs(F);
subplot(2,2,2), imshow(S, []), title('S');
Fc=fftshift(F);
S1=abs(Fc);
subplot(2,2,3), imshow(S1, []), title('S1');
S2=log(1+S1);
subplot(2,2,4), imshow(S2, []), title('S2');

%% fourier transform of natrual images

f=imread('Lenna.png');

figure,
subplot(1,2,1), imshow(f), title('lenna');

f=double(f);
F=fft2(f);
Fc=fftshift(F);
S=log(1+abs(Fc));
S=S./max(max(max(S)));
S=im2uint8(S);
subplot(1,2,2), imshow(S, []), title('frequency');

%% move origin of FT to the center of the period

f=zeros(500,500);
f(240:260, 230:270)=1;

figure,
subplot(2,2,1), imshow(f, []), title('f');

F=fftshift(fft2(f));
S=log(1+abs(F));

subplot(2,2,2), imshow(S, []), title('s');

f1=shift(f);
subplot(2,2,3), imshow(f1, []), title('f1');

F=fft2(f1);
S=log(1+abs(F));
subplot(2,2,4), imshow(S, []), title('S');


%% low-pass filter desisn

f=imread('Lenna.png');
f=rgb2gray(f);
f=double(f);

F=fftshift(fft2(f));
[m, n]=size(f);
sig=10;
%H=fspecial('gaussian', [m, n], 10);
H=Gaussian(m, n, sig);
G=H.*F;
g=abs(ifft2(G));

figure, 
imshow(g, []);

