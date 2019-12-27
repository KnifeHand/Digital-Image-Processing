clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.
workspace;  % Make sure the workspace panel is showing.
format longg;
format compact;
fontSize = 20;
% Read in a standard MATLAB color demo image.
%folder = fullfile(matlabroot, '\toolbox\images\imdemos');
%baseFileName = 'peppers.png';
% Get the full filename, with path prepended.
%fullFileName = fullfile(folder, baseFileName);
%if ~exist(fullFileName, 'file')
  % Didn't find it there.  Check the search path for it.
%  fullFileName = baseFileName; % No path this time.
%  if ~exist(fullFileName, 'file')
    % Still didn't find it.  Alert user.
%    errorMessage = sprintf('Error: %s does not exist.', fullFileName);
%    uiwait(warndlg(errorMessage));
%    return;
%  end
%end
%rgbImage = imread(fullFileName);
% Display the original image.
%subplot(2, 2, 1);
im = uint8(zeros(256));
imshow(im);
title('Original Color Image', 'FontSize', fontSize);
[rows, columns, numberOfColorChannels] = size(im);
% Enlarge figure to full screen.
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
% Create a logical image of a circle with specified
% diameter, center, and image size.
% First create the image.
[columnsInImage, rowsInImage] = meshgrid(1:columns, 1:rows);
% Next create the circle in the center of the image.
centerX = columns/2;
centerY = rows/2;
radius = min([rows columns]) / 2;
circlePixels = (rowsInImage - centerY).^2 ...
    + (columnsInImage - centerX).^2 <= radius.^2;
% circlePixels is a 2D "logical" array.
% Now, display it.
subplot(2, 2, 2);
imshow(circlePixels, []);
colormap([0 0 0; 1 1 1]);
title('Binary image of a circle', 'FontSize', fontSize);
% Mask the image.
maskedRgbImage = bsxfun(@times, im, cast(circlePixels, class(im)));
% Now, display it.
subplot(2, 2, 3);
imshow(maskedRgbImage);
title('Image Masked by the Circle', 'FontSize', fontSize);
% Mask the image the other way.
maskedRgbImage = bsxfun(@times, im, cast(~circlePixels, class(im)));
% Now, display it.
subplot(2, 2, 4);
imshow(maskedRgbImage);
title('Image Masked by the Circle', 'FontSize', fontSize);