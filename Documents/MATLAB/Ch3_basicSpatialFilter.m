clc
clear all
close all
%im = imread('./test/house.bmp');
im = imread('standard_test_images/Me.jpg');
im = double(im);
figure,imagesc(im);
colormap(gray(256));
axis image;
axis off;
w=fspecial('average', 5); % good for uniform noise

% w=[1 1 1; 1 1 1; 1 1 1]/9;
% 
% im2=imfilter(im,w,'same'); % AVR
% figure,imagesc(im2);
% colormap(gray(256));


w=[0 1 0; 1 -4 1; 0 1 0]; % laplacian n center
im3=imfilter(im,w,'same');
figure,imagesc(im3);
colormap(gray(256));
imo=im+im3;
figure,imagesc(imo);
axis image;
axis off; 
colormap(gray(256));

w=[0 -1 0; -1 4 -1; 0 -1 0]; % laplacian p center
im4=imfilter(im,w,'same');
figure,imagesc(im4);
axis image;
axis off;
colormap(gray(256));
imo=im+im4;
figure,imagesc(imo);
colormap(gray(256));
axis image;
axis off;

  


i=i;