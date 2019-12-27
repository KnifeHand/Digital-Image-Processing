% Sobel filter inhances virtical edges
clear all;
close all;
pic = rgb2gray(imread('./standard_test_images/Me.jpg'));
%pic = imread('./standard_test_images/iris.bmp');
pic = double(pic);

% Horizontal sharpening enhancements for spatial domain Sobel mask to preserve gray tonality.
horizontal = [0 1 0; 1 -4 1; 0 1 0];

% Virtical spatial domain for Sobel mask.
virtical = [-1 0 1; -1 0 1; -1 0 1];

% The imfilter compare the result of filtering f in the spatial 
% domain with the Sobel mask against the result obtained by performing 
% the equivalent process in the frequency domain
pic2 = imfilter(pic, horizontal,'corr');

% Generate the filtered image
pic3 = filter2(virtical, pic);

%All the mean vectors are organized as rows of a matrix and determines the
%membership fo the pattern vectors.
pic4 = sqrt((pic2.^2+pic3.^2)/2);
 
% Image preview 1
figure,subplot(2,2,1),image(pic);
colormap(gray(256));
axis image;
axis off;
title('Original');

% Image preview 2
subplot(2,2,2),image(abs(pic2));
colormap(gray(256));
axis image;
axis off;
title('Horizontal Sobel Filter');

% Image preview 3
subplot(2,2,3),image(abs(pic3));
colormap(gray(256));
axis image;
axis off;
title('Verticle Sobel Filter');

% Image preview 4
subplot(2,2,4),image(pic4);
colormap(gray(256));
axis image;
axis off;
title('Horizontal & Verticle Sobel Filter');