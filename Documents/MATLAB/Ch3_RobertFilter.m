clear all;
%close all;
im = im2double(imread('./standard_test_images/me.jpg'));
im = double(im);

R1 = [-1 0
      0 1];

R2 = [0 -1
      1 0];
 
% im2 = filter2(R1, im,'same');
% im3 = filter2(R2, im, 'same');

im2=imfilter(im,R1);
im3=imfilter(im,R2);
im4 = sqrt((im2.^2+im3.^2)/2);

figure,
subplot(2,2,1),image(im);
colormap(gray(256));
axis image;
axis off;
title('original image');

subplot(2,2,2),image(im2);
colormap(gray(256));
axis image;
axis off;
title('After Robert Filter 1');

subplot(2,2,3),image(im3);
colormap(gray(256));
axis image;
axis off;
title('After Robert Filter 2');

subplot(2,2,4),image(im4);
colormap(gray(256));
axis image;
axis off;
title('After Robert Filters 1&2');