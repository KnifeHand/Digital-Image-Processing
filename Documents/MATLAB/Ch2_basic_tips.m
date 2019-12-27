clc
clear all
close all

im=imread('standard_test_images/me.jpg');
%imwrite();
figure,imshow(im) 
title 'Test' 
axis on %off
 
im_double=double(im);
figure,imshow(im_double)

im_show=uint8(im_double);
figure,imshow(im_show)
figure,imshow(im_double./255)
%imd_show=im_double./255;
%figure,imshow(im_show)