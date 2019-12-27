%% Matt Hurt Project 1 report
% In this report I managed to successfully compute the eigan values to
% obtain a portion of the full algorithm for face recognition.  My approach
% to accomplishing this task was to read in in each image and set each one
% to an N by N matrix.  I did this individually for each one, which is why
% there is double code.  My initial approach led me to testing each input
% image one-by-one just to make sure the intended effect of correct images
% being read.  I then store the images in memory by its index.  I could
% have run in a second application but I figured it would be faster to save
% time by having everything read inside one file.  I sourced this code from
% https://www.mathworks.com/matlabcentral/fileexchange/45915-eigenfaces-algorithm

%% Clear workspace variables
clear all, close all;

%% Resize all M faces to N*N
% I assumed that I could read individual images and then resize them for
% an NxN matrix. However, I learned about the larger data set late and only
% had the smaller dataset that I was testing.  
N=50  ; % image size
M=4  ;% number faces
% Input image 1
img1 = imread('testing/person01_01a.png');
img1=mat2gray(img1);
img1=imresize(img1,[N N] );
figure(1),imshow(img1,'Initialmagnification','fit');title('img1')
% Input image 2
img2 = imread('testing/person01_01d.png');
img2=mat2gray(img2);
img2=imresize(img2,[N N] );
figure(2),imshow(img2,'Initialmagnification','fit');title('img2')
% Input image 3
img3 = imread('testing/person02_01b.png');
img3=mat2gray(img3);
img3=imresize(img3,[N N] );
figure(3),imshow(img3,'Initialmagnification','fit');title('img3')
% Input image 4
img4=imread('testing/person03_01c.png');
img4=mat2gray(img4);
img4=imresize(img4,[N N] );
figure(4),imshow(img4,'Initialmagnification','fit');title('img4')

%% store
% I found this resource on Ma
st.names = {'img1', 'img2', 'img3', 'img4'};%'exface1','exface2'
st.data{1} = img1;
st.data{2} = img2;
st.data{3} = img3;
st.data{4} = img4;
%st.data{5} = extraface1;
%st.data{6} = extraface2;

z  = [img1 img2 img3 img4]; % extraface1 extraface2
figure(6),imshow(z,'Initialmagnification','fit');title('z')

%save classFile st;
%clear all, close all;
%load classFile;

%% Calculate average face
M=4;N=50;
avImg=zeros(N);
z  = [ st.data{1} st.data{2} st.data{3} st.data{4} ]; 
figure(1),imshow(z,'Initialmagnification','fit');title('z org')
%% compute mean
for k=1:M
    st.data{k} = im2single(st.data{k});
    avImg   = avImg  + (1/M)*st.data{k};
end

figure(2),imshow(avImg,'Initialmagnification','fit');title('average')

%% normalize (remove mean)
for k=1:M
    st.dataAvg{k}  = st.data{k} -avImg;
end

z  = [ st.dataAvg{1}  st.dataAvg{2} st.dataAvg{3} st.dataAvg{4}];
figure(3),imshow(z,'Initialmagnification','fit');title('z average')


%% Create matrix A of face each row --> generate A = [ img1(:) img2(:)...imgM(:) ];
A = zeros(N*N,M);% (N*N)*M   2500*4
for k=1:M
    A(:,k) = st.dataAvg{k}(:);
end
% covariance matrix small dimension (transposed)
C = A'*A;
figure(4),imagesc(C);title('covariance')

%% Compute the eigen values and vecters 
% Calculate small dimension to compute the faces needed to go back to higher 
% dimension. 
[Veigvec, Deigval]  = eig(C);% v M*M e M*M only diagonal 4 eigen values
% eigan face in large dimension  A*veigvec is eigen vector of Clarge
Vlarge = A*Veigvec;% 2500*M*M*M  =2500 *M
% reshape to eigen face
eigenfaces=[];
for k=1:M
    c  = Vlarge(:,k);
    eigenfaces{k} = reshape(c,N,N);
end
x=diag(Deigval);
[xc,xci]=sort(x,'descend');% largest eigenval
z  = [eigenfaces{xci(1)} eigenfaces{xci(2)} 
    eigenfaces{xci(3)} eigenfaces{xci(4)}]; 
figure(5),imshow(z,'Initialmagnification','fit');title('eigenfaces')
%figure(99),plot(z);
% weights
nsel = 4; % select  eigen faces
for mi =1:M  % image number
  for k=1:nsel   % eigen face for coeff number
    wi(mi,k) =   sum(A(:,mi).* eigenfaces{xci(k)}(:)) ;
    %figure, plot(wi(mi,k));title('weight plots');
  end
end
figure(001),plot(mi),plot(k),plot(wi);

%% Facial Recognition
% This task is performed exclusively on the faces from the original smaller
% dataset given with the assignment.  I wanted to be able to determine if 
% the tests were being performed on the correct images from the enrolled set of
% images.  The program was able to match all of the face images with their
% hosts.  I have been unable to determine if the program was able to make
% any wrond detections because of the accuracy model I gave it to
% calculate.

%% Classify image 1
%There wasn't much suprise to the results here.  The matching was obvious
%and didn't tell me much after the application completed itself.  However,
%This might change after I use a second image to see the results.

% folder work C:\Users\michaels.DSI\Desktop\faces\class\
imlist = dir('./enroll/*.png'); % List folders contents and returns attributes about enroll
%im = imread(['./enroll/',imlist(1).name]);
testFaceim1 = imread(['./enroll/',imlist(1).name]);
testFaceim1  = mat2gray(testFaceim1);
testFaceim1 = imresize(testFaceim1,[N N]);
testFaceim1   =  im2single(testFaceim1);
%testFaceim1 =  st.data{1}; test
figure(6), imshow(testFaceim1,'Initialmagnification','fit'); 
title('new test face img1')
Aface = testFaceim1(:)-avImg(:); % normilized face
for(tt=1:nsel)
  wface(tt)  =  sum(Aface.* eigenfaces{xci(tt)}(:)) ;
end
figure, plot(wface); title('Weight of image 1');

% compute distance
diffWeight = zeros(M);
for mi=1:M  
    fsumcur=0;
    for(tt=1:nsel)
        fsumcur = fsumcur + (wface(tt)^2 - wi(mi,tt)^2);
    end
    diffWeight(mi) =   sqrt( fsumcur); 
end
num_imt = length(imlist);

% Calculation for CMC curve
for tt = (1:M)
    cmc(tt) = sum(diffWeight(1:tt))/num_imt;
end
    figure(98),plot(cmc); title('CMC CURVE img1') 
    %plot(diffWeights(:,2));

%% Classify image 2
% This portion of the code is awesome to me.  It tells me that I achieved
% face recognition in some respect.  The algorithm was still able to locate
% this gentlemans face even though the original image was distorted.
% Unfortunately I did not perform the affect of comparing the images with
% the CMC curve to test for accuracy of the images.  Despite my results, I
% thouroughly enjoyed the sucess of some aspect of face recognition
% occuring.

imlist2 = dir('./enroll/*.png'); % List folders contents and returns attributes about enroll
%im = imread(['./enroll/',imlist(1).name]);
testFaceim2 = imread(['./enroll/',imlist2(2).name]);
%testFaceim2 = imread('100_2120.jpg','jpg');
testFaceim2 = mat2gray(testFaceim2);
testFaceim2 = imresize(testFaceim2,[N N]);
testFaceim2 = im2single(testFaceim2);
figure(7), imshow(testFaceim2,'Initialmagnification','fit'); 
title('test face img2')
Aface = testFaceim2(:)-avImg(:);
for(tt=1:nsel)
  wface(tt)  =  sum(Aface.* eigenfaces{xci(tt)}(:)) ;
end
figure(999),plot(wface); title('Wieght of img 2');

% compute distance
for mi=1:M  
    fsumcur=0;
    for(tt=1:nsel)
        fsumcur = fsumcur + (wface(tt) - wi(mi,tt)).^2;
    end
    diffWeight(mi) = sqrt(fsumcur);
end

num_imt = length(imlist2);

% Calculation for CMC curve
for tt = 1:10
    cmc2(tt) = sum(diffWeight(1:tt))/num_imt;
end
    figure(97),plot(cmc2); title('CMC CURVE img2')


%% Classify image 3
% Like image 2, the algorithm matched up the appropriate faces.  Couldn't
% be more ectatic.
% folder work C:\Users\michaels.DSI\Desktop\faces\class\
imlist3 = dir('./enroll/*.png'); % List folders contents and returns attributes about enroll
%im = imread(['./enroll/',imlist(1).name]);
testFaceim3 = imread(['./enroll/',imlist(3).name]);
testFaceim3  = mat2gray(testFaceim3);
testFaceim3 = imresize(testFaceim3,[N N]);
testFaceim3   =  im2single(testFaceim3);
%testFaceim1 =  st.data{1}; test
Aface = testFaceim1(:)-avImg(:); % normilized face
figure(9), imshow(testFaceim3,'Initialmagnification','fit'); 
title('test face testFaceim3')
Aface = testFaceim3(:)-avImg(:);
wface=[];
for(tt=1:nsel)
  wface(tt)  =  sum(Aface.* eigenfaces{xci(tt)}(:)) ;
end
figure(8), plot(wface); title('Weight of image 3');

% compute distance
for mi=1:M  
    fsumcur=0;
    for(tt=1:nsel)
        fsumcur = fsumcur + (wface(tt) -wi(mi,tt)).^2;
    end
    diffWeights(mi) = sqrt( fsumcur);
end
diffWeights = diffWeights.';

num_imt = length(imlist3);

% Calculation for CMC curve
for tt = 1:M
    cmc3(tt) = sum(diffWeights(1:tt))/num_imt;
end
    figure(970),plot(cmc3); title('CMC CURVE img3')