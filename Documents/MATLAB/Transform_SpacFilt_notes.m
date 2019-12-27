clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear all;

image = imread('standard_test_images/face_dark.bmp');

%im1 = imunit(image, stretchlim(image), [ ]);

g = mat2gray(image);
histeq(g);
[rows, columns, numberOfColorChannels] = size(g)


subplot(2,2,2), imagesc(g)

subplot(2,2,1), imagesc(image)
%imshow(g);

%im2 = imadjust(image, stretchlim(im1), [1 0]);

%im3 = im2uint16(mat2gray(im2));

%im4 = im2unit16(mat2gray(log(1+ double(im1))));

%subplot(2,2,1),imagesc(image);
%subplot(2,2,2),imagesc(im1);
%subplot(2,2,3),imagesc(im2);
%subplot(2,2,4),imagesc(im3);
%subplot(2,2,5),imagesc(im4);


