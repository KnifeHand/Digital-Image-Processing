clear all;
close all;
im = imread('./test/jf.jpg');
im = double(im);
%% %%%%%%%%%%%%%%%% first step skin detection %%%%%%%%%%%%%%%%%%%%%%%%%
ims1 = (im(:,:,1)>95) & (im(:,:,2)>40) & (im(:,:,3)>20);
ims2 = (im(:,:,1)-im(:,:,2)>15) | (im(:,:,1)-im(:,:,3)>15);
ims3 = (im(:,:,1)-im(:,:,2)>15) & (im(:,:,1)>im(:,:,3));
ims = ims1 & ims2 & ims3;

figure,imshow(im./255);
figure,imshow(ims);
%% %%%%%%%%%%%%%%%% second step %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% morphorlogy %%%%%%%%%%%%%%%%%%%%%%%%%
[c,r]=size(ims); %%get pic size

for x= floor(c*0.4):c  %%%% delete the lower half part
    ims(x,:,:)=0;
end

figure,imshow(ims); %%%%%%% delete the small black holes
imf=imfill(ims,'holes');
figure,imshow(imf);

imo=bwareaopen(imf,50); %%%%%%% area open to delete small lines small objects
figure,imshow(imo); 


SE = strel('square',10);%%%%%%% dilate and erode 
imde=imdilate(imo,SE);
%figure,imshow(imde);
imde=imerode(imde,SE);
figure,imshow(imde);

 for i=1:3
imdt(:,:,i)=imde.*im(:,:,i);
end

figure,imagesc(imdt./255); axis image;axis off; title('Detected Face Image','fontsize',10);

i=i;
 