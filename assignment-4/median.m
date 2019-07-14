clear all;
clear;
clc;

%% original image = f(x,y)
img = imread('nasa.jpg');
img = rgb2gray(img);

%% kernel median filter
kernel = ones(3);

output = medianfilter(img, kernel);

%% plotting
figure;
subplot(1,3,1); imshow(img); title('Original');
subplot(1,3,2); imshow(output); title('Median Filtered');
subplot(1,3,3); imshow(output./img); title('Median times Original');