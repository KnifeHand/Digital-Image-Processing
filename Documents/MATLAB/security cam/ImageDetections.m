%% Read in Images
img1 = imread('TestImage1');
img2 = imread('TestImage2');

%% Display Color Images
figure
imshow(img1)
figure
imshow(img2)

%% Convert Images to Black and White
img1BW = rgb2gray(img1);
img2BW = rgb2gray(img2);

%% Display Black and White images
img2BW = rgb2gray(img1);
img2BW = rgb2gray(img2);

%% Display Black and White Images
figure
imshow(img1BW)
figure
imshow(img2BW)

%% Subtract Images
imgDiff = abs(img1BW - img2BW);
% imDiff = imsubtract(img1BW - img2BW);
figure
imshow(imgDiff)

%% Find Max Location of Difference
maxDiff = max(max(imgDiff));
[iRow,iCol] = find(imgDiff == maxDiff);
[m,n] = size(imgDiff);

imshow(imgDiff)
hold on
plot(iCol,iRow,'r*')

%% Use imtool to Determine Threshold and Length
imtool(imgDiff)

%% Threshhold Image
imgThresh = imgDiff > 8;
figure
imshow(imgThresh)
hold on
plot(iCol,iRow,'r*')
hold off

%% Fill in Regions
imgFilled = bwareaopen(imgThresh, 15);
figure
imshow(imgThresh)
hold on
plot(iCol,iRow,'r*')
hold off

%% Fill in Regions
imgFilled = bwareaopen(imgThresh, 15);
figure
imshow(imgFilled)

%% Overlay Onto original Image
% Utility from the File Exchange

imgBoth = imoverlay(img1,imgFilled,[1 0 0]);
figure
imshow(imgBoth)

%% Only Care About Things Larger Than 80

imageStats = regionprops(imgFilled, 'MajorAxisLength');

imgLengths = [imageStats.MajorAxisLenth];
idx = imgLengths > 80;
imageStatsFinal = imageStats(idx);
disp(imageStatsFinal)

%% Determine if change is significant

if isempty(imageStatsFinal)
    disp('Nothing Different Here')
else 
    disp('Something is Here!')
end