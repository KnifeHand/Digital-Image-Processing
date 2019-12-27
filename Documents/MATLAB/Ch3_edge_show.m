clc
clear all
close all

% im=imread('./test/sem.jpg');
im = im2double(rgb2gray(imread('standard_test_images/Me.jpg')));
subplot(3,1,1),imagesc(im);
colormap(gray(256));
axis image;
axis off;

 
  eim1=edge(im,'sobel');
%   eim1=edge(im,'sobel');
subplot(3,1,2),imagesc(eim1);
colormap(gray(256));
axis image;
axis off;
title('Sobel');


T=0.4;
  eim2=edge(im,'canny',T);
% eim2=edge(im,'canny');
subplot(3,1,3),imagesc(eim2);
colormap(gray(256));
axis image;
axis off;
title('Canny');

i=i;