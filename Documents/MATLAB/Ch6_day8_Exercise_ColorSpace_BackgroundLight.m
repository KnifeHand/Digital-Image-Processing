 close all
 clear all

 
 imf=imread('standard_test_images/face_dark.bmp');
 figure,imshow(imf);title('dark face');
 imluv = colorspace('Luv<-rgb',imf);
 L=imluv(:,:,1);
 U=imluv(:,:,2);
 V=imluv(:,:,3);
 
 range=max(max(L));
 L=L./range;
 L2=imadjust(L,[],[],0.6);
 L2=L2.*range;
 L=L.*range;
 
%%%%%%%%%% finish the correction %%%%

ims1 = (im(:,:,1)>95) & (im(:,:,2)>40) & (im(:,:,3)>20);
ims2 = (im(:,:,1)-im(:,:,2)>15) | (im(:,:,1)-im(:,:,3)>15);
ims3 = (im(:,:,1)-im(:,:,2)>15) & (im(:,:,1)>im(:,:,3));
ims = ims1 & ims2 & ims3;


imluv2(:,:,1)=L2;
imluv2(:,:,2)=U;
imluv2(:,:,3)=V;
im7 = colorspace('rgb<-Luv',imluv2); 
 

  
% figure,imagesc(L); axis image;axis off; title('L','fontsize',14);
% figure,imagesc(U); axis image;axis off; title('U','fontsize',14);
% figure,imagesc(V); axis image;axis off; title('V','fontsize',14);
% figure,imagesc(L2);axis image;axis off; title('L2','fontsize',14);
 figure,imagesc(im7);colormap(gray(256));axis image;axis off; title('IM7=RGB < L2UV (after gamma correction)','fontsize',14);
 
i=i;
 

 
 
 
 