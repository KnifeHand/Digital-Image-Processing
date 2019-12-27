%% Assignment 5 by Matt Hurt
% The purpose of this program is to measure the image quality with
% different distortions using different quality metrics.  I am using an
% imput image that I took of my dog and used a maker tool in preview to
% distort the images from the original.  The quality of the distortion
% images is measured with the MSE, PSNR, SSIM functions that were provided
% in hint code.  Then, I obtained a quality metric that I obtained from
% mathworks.com by the author Athi Narayanan for a quality metric.  

clc
clear all
close all

%% Read in the file image and set variables
origImg=imread('kona.jpg');
distImg1 = imread('konaDist1.jpg');
rgb2gray(origImg);
rgb2gray(distImg1);
imshow(origImg); title('Original image');
imshow(distImg1); title('Distorted image');


%% Split pixels into rows and columns
[r,c]=size(origImg);

%% Calculate the means square error
% if the MSE decreases to zero, the pixel-by-pixel matching of the images
% becomes perfect.  If the calculation is small then this will correspond
% to a high quality deompressed image. The value increases as the
% compression ratio increases. 
err = immse(origImg,distImg1);
fprintf('\n The mean-squared error is %0.4f\n', err);

%% Structure Similarity Index
% Computes the value for image im using distImg1 as the reference image.  This
% method is for measuring the similarity between two images where the value
% lies between [0 1].  SSIM is is designed to improve on traditional
% metrics like PSNR and MSE, which have proved be inconsistant with human
% eye perception.
[ssimval, ssimmap] = ssim(origImg, distImg1);
% Scale the display based on the range of pixel values and display minimum
% value as black and the maximum value as white.
imshow(ssimmap, []); title('Structural Similarity Map');

%% Map gamma intensity values
% Gamma specifies the shape of the curve describing the 
% relationship between the values
im3=imadjust(distImg1,[],[],0.5);
figure,imshow(im3); title('Gamma Correction');

%% blurred
H = fspecial('motion',10,15);
im4 = imfilter(im3,H,'same');
figure,imshow(im4); title('Blurred');

%% Average Difference Calculation
origImgtest = double(origImg);
distImg = double(distImg1);

[M, N] = size(origImgtest);
error = origImgtest - distImg;

AD = sum(sum(error)) / (M*N);

fprintf('\n Average difference Calculation is %0.2f\n', AD);

%% Maximum Difference Calculation
MD = max(max(error));

fprintf('\n Maximum difference Calculation is %0.2f\n', MD);

%% Normalized absolute Error Calculation

NAE = sum(sum(abs(error)))/sub(sum(origImgtest));

%% Values
V_psnr1=psnr(origImg,distImg1);  % PSNR(im,im1)
V_psnr2=psnr(origImg,im3);
V_psnr3=psnr(origImg,im4);

fprintf('\n Peak Signal Noise Ratio of origImg and distImg1 is %0.2f\n', V_psnr1);
fprintf('\n Peak Signal Noise Ratio of origImg and im3 is %0.2f\n', V_psnr2);
fprintf('\n Peak Signal Noise Ratio of origImg and im4 is %0.2f\n', V_psnr3);

V_ssim1=ssim(origImg,distImg1);
V_ssim2=ssim(origImg,im3);
V_ssim3=ssim(origImg,im4);

fprintf('\n Structural Simularity Index Measurement 1 is %0.2f\n', V_ssim1);
fprintf('\n Structural Simularity Index Measurement 2 is %0.2f\n', V_ssim2);
fprintf('\n Structural Simularity Index Measurement 3 is %0.2f\n', V_ssim3);
 
i=i;

