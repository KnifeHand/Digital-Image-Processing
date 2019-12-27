%Please note that if the original image contains values
%0 and 256 then this program will have no effect on the image

original_image = imread('seeds.jpg');
[m, n] = size(original_image);
contrast_stretched_image=original_image;

absolute_max = 255;
absolute_min = 0;
relative_max = 0;
relative_min = 255;

%Finding lowest and highest values in original image
for i=1:m
    for j=1:n
       if(original_image(i, j) > relative_max)
           relative_max = original_image(i, j);
       end
       if(original_image(i, j) < relative_min)
           relative_min = original_image(i, j);
       end
    end
end

for i=1:m
    for j=1:n
       %Formula for contrast stretching
       contrast_stretched_image(i, j) = (original_image(i, j)-relative_min)*((absolute_max-absolute_min)/(relative_max-relative_min));
    end
end

disp("Minimum Value in original Image:" + relative_min);
disp("Minimum Value in original Image:" + relative_max);

disp('Original Image');
image(original_image);
colormap(gray(256));

disp('Image After Contrast Stretching');
image(contrast_stretched_image);
colormap(gray(256));