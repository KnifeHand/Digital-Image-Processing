clc 
clear all
close all

%% day 2 EX 1
% Generates random noise
im=uint8(zeros(256));
for i=1:256
    for j=1:256
         
        im(i,j)=im(i,j)+randi([0,255],1);
         
    end
end
figure,imshow(im) % figure 1

%% day 2 EX 2

im=uint8(zeros(256));%Extracts a subimage, im, from the given image,
for i=1:256
    for j=1:256
         
        im(i,j)=255-i+1;
         
    end
end
figure,imshow(im) % figure 2

%% day 2 EX 2-1
% Makes a circle
R=80;
im=uint8(zeros(256));
for i=1:256
    for j=1:256
        if sqrt((i-128)^2+(j-128)^2)<R
        im(i,j)=round(sqrt((i-255)^2+(j-225)^2) );
        end
    end
end
figure,imshow(im) % figure 3

%% day 2 EX 2-2
im=uint8(zeros(256));
for i=1:256
    for j=1:256
        if round(sqrt((i-128)^2+(j-128)^2))==80
        im(i,j)=255;
        end
    end
end
figure,imshow(im)