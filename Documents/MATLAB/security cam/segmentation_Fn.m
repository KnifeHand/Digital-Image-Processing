function [highlighted_img] = segmentation_Fn(img1, img2)
%% Convert Images to Black and White
img1BW = rgb2gray(img1);
img2BW = rgb2gray(img2);

%% Display Black and White Images
%figure
%imshow(img1BW)
%figure
%imshow(im2bw)

%%  Subtract Images
imgDiff = abs(img2BW - img1BW);
%figure
%imshow(imgDiff)