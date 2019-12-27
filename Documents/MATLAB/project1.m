clc;
clear all;
close all;
%% Load date-base path to PCA_FRS
TrainPath = 'MATLAB\testing';
TestPath = 'MATLAB\testing';
%% Taking test image from user using input dialog box
prompt = {'Enter test image name (a number between 11 to 16):'};
dlg_title = 'Input image of PCA-FRS';
num_lines = 1;
    def = {'11'};
TestImage = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestPath,'/',char(TestImage),'.png');
TestImage = imread('/Users/matthewhurt/MATLAB/testing/person01_01a.png');
%% Number of all images in the training Tdbbase
TrainFiles = dir(TrainPath);
Train_Number = 0;
    for i = 1:size(TrainFiles, 1)
        if not(strcmp(TrainFiles(i).name,'.')|strcmp(TrainFiles(i).name,'..'))
        Train_Number = Train_Number + 1;
        end
    end
%% 1) Data-base construction
    Tdb = [];
    for i = 1 : Train_Number
        str = int2str(i);
        str = strcat('\',str,'.jpg');
        str = strcat(TrainPath,str);
        
        img = imread(str);
        img = rgb2gray(img);
        
        [row, col] = size(img);
        
        tmp = reshape(img', row*col,1);
        Tdb = [Tdb tmp];
    end
    Train_Number = size(Tdb,2);
%% 2) Finding mean-image
    m = mean(Tdb,2);
%% 3) Subtracting mean-image from Train-Database
    A = [];
        for i = 1 : Train_Number
            templ = double(Tdb(:,i)) - m;
            A = [A templ];
        end
        
%% 4) Finding co-variance matrix
    covr = A'*A;
%% 5) Finding eigen values and eigen vectors
    [evec, eval] = eig(covr);
    
%% 6) Selecting eigen-values w.r.t eigen-vectors
    covr_eig_vec = [];
    for i = 1 : size(evec,2)
        if(eval(i,i)>0)
            covr_eig_vec = [covr_eig_vec evec(:,i)];
        end
    end
%% 7) Projection image matrix (PCA-output)
    projmatrix = A * covr_eig_vec;
%% 8) Mini-ature databse
    ProjectedImages = [];
    Train_Number = size(projmatrix,2);
    
    for i = 1 : Train_Number
    temp = projmatrix'*A(:,i);
    ProjectedImages = [ ProjectedImages temp2];
    end
%% Testing:
%% 9) Finding test image projection
    temp = TestImage(:,:,1);
    [irow, icol] = size(temp);
    InImage = reshape(temp',irow*icol,1);
    Difference = double(InImage)-m;
    ProjectedTestImage = projmatrix'*Difference;
    
%% 10) Finding euclidean distance    
    Euc_dist = [];
        for i = 1 : Train_number
            q = ProjectedImages(:,i);
            temp = (norm(ProjectedTestImage - q))^2;
    Euc_dist = [Euc_dist, temp];
        end
%% 11) Finding equivalent image path
    [Euc_dist_min, Recognized_index] = min(Euc_dist);
    OutputName = strcat(int2str(Recognized_index),'.jpg');
    SelectedImage = strcat(TrainPath,'\',OutputName);
    SelectedImage = imread(SelectedImage);
%% 12) Displaying result
    subplot(2,1,1);
    imshow(TestImage);
    title('Test Image');
    subplot(2,1,2);
    imshow(SelectedImage);
    title('Equivalent Image');
    str = strcat('Matched image is : ', OutputName);
    disp(str)