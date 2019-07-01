%% Anis Sarker
%  Date: 17/08/2017

%% Assignment 3
%% Contrast stretching main
%  Input: 3-channel or 1-channel image
%  Output: Plot the images

%% clear workspace
clear all;
clear;
clc;

%% image read and initialize output
[file, path] = uigetfile('*.*');
img = imread(fullfile(path, file));
% img = rgb2gray(img);
output = contrast_stretch(img);

%% plot the figures 
figure;
subplot(2,2,1); imshow(img); title('Input');
subplot(2,2,2); imhist(img); title('Input histogram');
subplot(2,2,3); imshow(output); title('Contrast stretched');
subplot(2,2,4); imhist(output); title('Output histogram');
% imwrite(output, sprintf(file), 'jpg');