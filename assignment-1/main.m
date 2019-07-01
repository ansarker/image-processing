% Anis Sarker
% Date: 23 Oct 2017

clear;
clc;
clear all;
close all;

[file, path] = uigetfile('*.*');
img = imread(fullfile(path, file));

%% resize function run 
array_scale = [0.25 0.7 2];

figure;
subplot(2,2,1);
imshow(img);
title('Original Image');

for i = 1:length(array_scale)
    subplot(2,2,(i+1));
    imshow(resize(img, array_scale(i)));
	title(sprintf('Output %.0f%%', (array_scale(i)*100)));
end

%% quantize function run
bits = [3 8 6];

figure;
subplot(2,2,1);
imshow(img);
title('Original Image');

for i = 1:length(bits)
    subplot(2,2,(i+1));
    imshow(quantize(img, bits(i)));
	title(sprintf('Bit %d', bits(i)));
end
