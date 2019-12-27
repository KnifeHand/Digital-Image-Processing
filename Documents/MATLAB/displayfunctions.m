 
%path='./standard_test_images/'; % this is your working path
%impath=[path,'lena_color_256.tif']; % path of the image
im=imread('standard_test_images/cameraman.tif');
figure,imshow(im); % you could also try image() imagesc() other image display functions 

im_resized=imresize(im,[128,128]);
figure,imshow(im_resized);

%% ** Note ** This function is particularly useful in programming to determine 
%  automatically the size of a 2-D image
[r,c,ch]=size(im);  % FIXME: what do the variables mean and what are they doing?
img=zeros(r,c);% The subimage is of size m-by-n , and the coordinates of its top, left corner are (rx,cy).
%img=rgb2gray(im); % change color image to grayscale image 
img=mat2gray(im); % change color image to grayscale image 

figure,imshow(img);

%% Intro to M-Function Programming p.62
%f u n c t io n s = s u b im ( f , m , n , r x , c y )
%SUBIM Ext racts a subimag e , s , f rom a g i v e n imag e , f .
% The su bimage is of size m - by - n , and t h e coordinates of its t o p ,
% left c o r n e r are ( rx , c y ) .
%s = zeros ( m , n ) ;
%for r = 1 : m
%for c = 1 : n
%s ( r , c ) f ( r + rx - 1 , c + cy - 1 ) ;
%end
%end

%% Suppose that we want to write a function that computes the average intensity of an image. 
% -A two-dimensional array f can
%- be converted to a column vector, v, by Jetting v = f ( : ) . Therefore, we want our
%- function to be able to work with both vector and image inputs.
%fun c t ion av = average ( A )
%AVERAGE Computes t h e average value o f an a r ray .
% AV = AVERAGE ( A ) computes t h e average value of input A ,
% which must be a 1 -D or 2-D a r ray .
% Check t h e validity of t h e input .
%if ndims ( A ) > 2

% ** Note ** that the input is converted to a 1 -D array by using A ( : ) . In general,
%length ( A ) returns the size of the longest dimension of an array, A. In this example,
%because A ( : ) is a vector, l e n g t h ( A ) gives the number of elements of A.
%This eliminates the need for a separate test to determine whether the input is
%a vector or a 2-D array. Another way to obtain the number of elements in an
%array directly is to use function numel, whose syntax is
%n = nume l ( A )
%Thus, i f A i s a n image, numel ( A ) gives its number o f pixels. Using this function,
%the last line of the previous program becomes
%av = sum ( A ( : ) } / n umel ( A ) ;
%Finally, note that the e r ro r function terminates execution of the program and
%outputs the message contained within the parentheses (the quotes shown are
%required).Note that the input is converted to a 1 -D array by using A ( : ) . In general,
%length ( A ) returns the size of the longest dimension of an array, A. In this example,
%because A ( : ) is a vector, l e n g t h ( A ) gives the number of elements of A.
%This eliminates the need for a separate test to determine whether the input is
%a vector or a 2-D array. Another way to obtain the number of elements in an
%array directly is to use function numel, whose syntax is
%n = nume l ( A )
%Thus, i f A i s a n image, numel ( A ) gives its number o f pixels. Using this function,
%the last line of the previous program becomes
%av = sum ( A ( : ) } / n umel ( A ) ;
%Finally, note that the e r ro r function terminates execution of the program and
%outputs the message contained within the parentheses (the quotes shown are
%required).
%error ( ' The dimensions of the input c a n n ot exceed 2 . ' )
%end
% Compute t h e average
%av = sum ( A ( : ) ) / leng t h ( A ( : ) ) ;