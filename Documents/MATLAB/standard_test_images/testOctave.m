clc
clear all
close all
%% gray
im = imread('./lena_gray_256.tif');
im2 = fftshift(fft2(im));
im3 = log(abs(im2)+1);


SH = [-1 -2 -1
      0 0 0
      1 2 1];
imf=imfilter(im,SH,'same');


 a=zeros(100,100);
 a(40:60,40:60)=1;
 figure,imshow(a);
SE = strel('square',4);
imd=imdilate(a,SE);
imo=bwareaopen(a,50); %% 
 
%% color
 imc=imread('./lena_color_256.tif');
 figure,imshow(imc); 
 imluv = colorspace('Luv<-rgb',imc);
 
 
 
