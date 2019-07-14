clear all;
clear;
clc;

%% original image = f(x,y)
img = imread('sharpen.jpg');
img = rgb2gray(img);

%% kernel image averaging
avg_kernel = ones(9)/81.0;

%% kernel sharpen image
sharpen_kernel = [0,-1, 0;
                 -1, 5,-1;
                  0,-1, 0];
%% edge kernel
edge_kernel = [-1,-1,-1;
               -1, 8,-1;
               -1,-1,-1];

output_avg = convolve(img, avg_kernel);
output_sharpen = convolve(img, sharpen_kernel);
output_edge = convolve(img, edge_kernel);

figure;
subplot(2,2,1); imshow(img); title('Original');
subplot(2,2,2); imshow(output_avg); title('Image Average');
subplot(2,2,3); imshow(output_sharpen); title('Image Sharpen');
subplot(2,2,4); imshow(output_edge); title('Image Edge');