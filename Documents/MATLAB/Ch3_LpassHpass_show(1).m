%Applying low-pass filter in the frequency domain to woman image
clear all;
close all;

im = double(imread('./test/jf5.jpg'));
 im =(im(:,:,1)+im(:,:,2)+im(:,:,3))/3;
nim = LPass(im,100,2);
nim2 = LPass(im,50,2);


figure,subplot(3,1,1),imagesc(im);
colormap(gray(256));
axis image;
axis off;
title('original image');

subplot(3,1,2),image(nim);
colormap(gray(256));
axis image;
axis off;
title('after lowpass d0 = 100');

subplot(3,1,3),image(nim2);
colormap(gray(256));
axis image;
axis off;
title('after lowpass d0 = 50');


 
nim = HPass(im,5,2);
nim2 = HPass(im,15,2);


figure, subplot(3,1,1),image(im);
colormap(gray(256));
axis image;
axis off;
title('original image');

subplot(3,1,2),image(nim);
colormap(gray(256));
axis image;
axis off;
title('after highpass d0 = 5');

subplot(3,1,3),image(nim2);
colormap(gray(256));
axis image;
axis off;
title('after highpass d0 = 15');