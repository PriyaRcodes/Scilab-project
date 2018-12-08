clear all;
clc;
//Project on image compression 
//Using PCA-Principal Component Analysis technique

//Implementing the maths behind PCA
img= imread('C:\Users\dell\Pictures\Camera Roll\wallpaper.jpg');
gray_img = rgb2gray(img);
gray_imgdouble = im2double(gray_img);
meancol=mean(gray_imgdouble,'r');
[a b]= size(gray_img);
disp("Rows:"+string(a));
disp("Columns:"+string(b));
mean_matrix = repmat(meancol,a,1);
data_adjust = gray_imgdouble - mean_matrix;
cov_adjust = cov(data_adjust);
[EV,E]=spec(cov_adjust);
EVtrans = EV';
data_adjustTrans = data_adjust';
FinalData = EVtrans*data_adjustTrans;


//Inverse PCA
originalimgtrans = inv(EVtrans)* FinalData;
originalimg = originalimgtrans'+ mean_matrix;           // Image reconstructed


//Image compression
cols = input("Enter the new size percentage :");
cols = floor( (cols/100) * b );
[Esorted,index]= gsort(diag(E),'g','d');
EVselect=EV(:,index(1:cols));
X=EVselect' * data_adjustTrans;
compressed_data = EVselect * X;
compressed_img = compressed_data' + mean_matrix ;
imshow(compressed_img );                                                      //Displaying the final result
 
 // Thus the image is compressed retaining maximum clarity for the given percentage

//*********************PROJECT DONE BY******************************
//PRIYA R
//APARNA S
//AKSHAT AGARWAL












