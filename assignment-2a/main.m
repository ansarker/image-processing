%% Anis Sarker
%  Date: 10/08/2017

%% Assignment 2a
%% Increasing decreasing brightness, contrast main
%  Input: 3-channel or 1-channel image
%  Value: prompt value to increase or decrease intensity
%  Output: Plot the images

clc;
clear;
clear all;

[file, path] = uigetfile('*.*');
img = imread(fullfile(path, file));
% img = imread('03.jpg');
img = rgb2gray(img);
% value = input('Value to increase or decrease? ');
value = 58;
alpha_de = 0.65;
alpha_in = 1.65;

inc_bright = uint8(zeros(size(img)));
dec_bright = uint8(zeros(size(img)));
inc_cntrst = uint8(zeros(size(img)));
dec_cntrst = uint8(zeros(size(img)));

inc_bright = increase(img, value);
dec_bright = decrease(img, value);
inc_cntrst = contrast(img, alpha_in);
dec_cntrst = contrast(img, alpha_de);


%% plot the figures 
figure;
subplot(2,3,1); imshow(img); title('Input');
subplot(2,3,2); imshow(dec_bright); title('Decrease brightness');
subplot(2,3,3); imshow(inc_bright); title('Increase brightness');
subplot(2,3,4); imshow(dec_cntrst); title('Decrease contrast');
subplot(2,3,5); imshow(inc_cntrst); title('Increase contrast');
