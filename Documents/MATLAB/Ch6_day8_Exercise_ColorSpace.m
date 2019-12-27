 close all
 clear all
 %%%%%%%%%%%%%%%%%%%%%%%%% part 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 im1= imread('standard_test_images/face_good.bmp');
 X1=(im1(:,:,1)+im1(:,:,2)+im1(:,:,3))/3;
 im2 = imread('standard_test_images/face_good.bmp');
 X2 =(im2(:,:,1)+im2(:,:,2)+im2(:,:,3))/3;
 im3 = imread('standard_test_images/face_good.bmp');
 X3 =(im3(:,:,1)+im3(:,:,2)+im3(:,:,3))/3;
 im4(:,:,1)=X1;
 im4(:,:,2)=X2;
 im4(:,:,3)=X3;
 
  %figure,
 %subplot(2,1,1),imagesc(im1); axis image;axis off; title('IM1');
 %subplot(2,1,2),imagesc(X1); colormap(gray(256)); axis image;axis off; title('X1');
 % figure,
 %subplot(2,1,1),imagesc(im2); axis image;axis off; title('IM2');
 %subplot(2,1,2),imagesc(X2); colormap(gray(256)); axis image;axis off; title('X2');
  %figure,
  %subplot(2,1,1),imagesc(im3); axis image;axis off; title('IM3');
 %subplot(2,1,2),imagesc(X3); colormap(gray(256)); axis image;axis off; title('X3');
%  figure,imagesc(im4./255); colormap(gray(256)); axis image;axis off; title('IM4');
 %figure,imagesc(im4); colormap(gray(256)); axis image;axis off; title('IM4');
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%% part 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 Y1=histeq(X1);
 Y2=histeq(X2);
 Y3=histeq(X3);
 
 %figure, imagesc(Y3);

 im5(:,:,1)=Y1;
 im5(:,:,2)=Y2;
 im5(:,:,3)=Y3;
 
 %figure, imagesc(im5);
 
 %figure,imagesc(Y1);colormap(gray(256)); axis image;axis off; title('Y1');
 %figure,imagesc(Y2); colormap(gray(256)); axis image;axis off; title('Y2');
 %figure,imagesc(Y3); colormap(gray(256)); axis image;axis off; title('Y3');
 figure,imagesc(im5); colormap(gray(256)); axis image;axis off; title('IM5');
 
 
 
