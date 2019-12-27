close all;
clear all;
inImage = imread('coins.jpeg');
[numrows, numcols] = size(inImage);
resizeIm = imresize(inImage, [255 255]);
im = imadjust(resizeIm); %,[0.3 0.7],[]); 
im = double(im);
mx = max(max(im));
mn = min(min(im));
im2  = (im-mn)/(mx-mn)*510;
 
figure(1),image(im);
colormap(gray(256));
axis image;
axis off;

figure(2),image(im2);
colormap(gray(256));
axis image;
axis off;

%Show histogram 
figure(3),imhist(uint8(im));
title('Histogram for original image');

figure(4),imhist(uint8(im2));
title('Histogram for the contrast streched version');