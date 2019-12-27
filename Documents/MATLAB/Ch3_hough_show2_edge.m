%demo for line detection using Hough transform
clear all;
close all;
  im = im2double(rgb2gray(imread('standard_test_images/Me.jpg')));
% im = imread('./test/hough2.jpg');
im = double(im);
T = 15;
eim=im;
eim1 = edge(im,'sobel',T);
eim3 = bwmorph(eim1,'clean'); %using binary morphology to clean the independent dots

%   [eim_h,nim] = line_hough2(eim);
eim_h = line_hough2(eim3);

figure,subplot(3,1,1),image(im);
colormap(gray(256));
title('Original Image');
axis image;
axis off;

subplot(3,1,2),imagesc(eim);
colormap(gray(256));
title('After Edge Detetction');
axis image;
axis off;

subplot(3,1,3),
imagesc(eim_h);
colormap(gray(256));
title('After Hough Transform');
axis image;
axis off;
figure,image(eim_h)
