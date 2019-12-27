clc
clear all
close all
%% test image
 im=[0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0;
     0 0 0 1 1 1 0 0 0 0;
     0 0 0 1 1 1 0 0 0 0;
     0 0 0 1 1 1 1 1 0 0;
     0 0 1 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0; 
     ];
 
  im=imresize(im,[100,100]);
    [r,c]=size(im);
  figure,imshow(im>0.5*max(max(im)));
%% convexhull of inputs
IN=[];
xt=[];
yt=[];
[xt,yt]=find(im>0.5*max(max(im))); %%find input points of convexhull