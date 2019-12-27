%%
clear all;
clc;


rgb = imread('coins.jpeg');
size(rgb)
imhist(rgb, 25)
bar(horz, z, width);
%imtool(rgb);
%zeros(rgb);
% [P,Q] = size(rgb);
% F = fft2(rgb, P, Q);
% S = abs(F);
% imshow(S, []);


% [centers, radii] = imfindcircles(rgb); 
% 
% centerStrong5 = centers(1:1);
% radiiStrong5 = radii(1:1);
% metricStrong5 = metric(1:1);
% 
% viscircles(centers, radii, 'edgeColor', 'b');
% 
% %rgb = imread('coins2.jpeg');
% imshow(rgb)

%d = imdistline;

%delete(d)

%gray_image = rgb2gray(rgb);
%imshow(gray_image)

%length(centers)

%h= viscircles(centers, radii);
%delete(h)
%imshow(rgb)