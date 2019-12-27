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
 
 k = convhull(xt,yt); %% output hull
 
 %% show selected hull points
 showim=zeros(r,c);
 for i=1:length(k)       
 showim(xt(k(i)),yt(k(i)))=1;    
 end
 figure,imshow(showim);hold on 
 plot(yt(k),xt(k)); axis on
 
 %%  test points 
 test_x=rand(200,1)*r;
 test_y=rand(200,1)*c;
 
 %% check if the points are within or on the polygon
in=inpolygon(test_x,test_y,xt(k),yt(k));
figure,h1=plot(yt(k),xt(k),test_y(in),test_x(in),'.r',test_y(~in),test_x(~in),'.b')
 
 
 













i=i;
