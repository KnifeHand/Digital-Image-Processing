clc
clear all
close all
 a=zeros(100,100);
%          a(40:60,40)=1;
         
         
 a(40:60,40:60)=1;
 figure,imshow(a)
SE = strel('square',5);
 % SE = strel('square',4);
%   SE=strel('disk',5);
imd=imdilate(a,SE);
figure,imshow(imd)
figure,imshow(imd-a)
i=i;