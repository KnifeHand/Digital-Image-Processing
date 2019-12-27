%Control image placement
% -Place the image so that it lies between 5 and 8 on the x-axis and between
% 3 and 6 on the y-axis.
% -Notice that the pixel corresponding to C(1,1) is centered over the point
% (5,3).  The pixel corresponding to C(3,4) is centered over the point
% (8,6).  imgesc positions and orients the rest of the image between those
% two points
x = [5 8];
y = [3 6];
C = [0 2 4 6; 8 10 12 14; 16 18 20 22];
figure,
  subplot(2,1,1)
imagesc(x,y,C)

% Display image of matrix data
% -By default, imagesc scales the color limits so that image uses the full 
% range of the colormap, where the smalles value is C maps to the first
% color in the colormap and the larges value maps to the last color.
% -Create matrix C. 
C = [0 2 4 6; 8 10 12 14; 16 18 20 22];
colorbar
figure,
  subplot(2,1,1)
% -display and image of data in C.  
imagesc(C)
  