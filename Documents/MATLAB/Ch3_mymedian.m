%For median
clear all;
close all;

im = imread('./standard_test_images/circuit2.jpg');
im = double(im);
im3=im;
im4=im;
figure,
imagesc(im);
colormap(gray(256));
axis image;
axis off;

L = [1 1  1
     1 1 1
     1 1  1]/9;
 
for i=2:size(im,1)-1
    for j=2:size(im,2)-1
tp=im(i-1:i+1,j-1:j+1);
im3(i,j)=median(tp(:));
    end
end
% im2 = filter2(L,im,'same');
im2 = imfilter(im,L,'same');
% im3 = im2+im;

% figure,
% % subplot(3,1,1)
% imagesc(im2);
% colormap(gray(256));
% title('average');
% axis image;
% axis off;

% subplot(3,1,2)
figure,
imagesc(abs(im3));
colormap(gray(256));
title('median');
axis image;
axis off;

im4=im;

for i=2:size(im,1)-1
    for j=2:size(im,2)-1
tp=im3(i-1:i+1,j-1:j+1);
im4(i,j)=median(tp(:));
    end
end
figure,
imagesc(abs(im4));
colormap(gray(256));
title('median x 2');
axis image;
axis off;

 i=i;