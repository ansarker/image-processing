clc;
clear;
clear all;

img = imread('pencil.jpg');
img = rgb2gray(img);
bit = [5 8 2];
% output = zeros(size(img));

for i = 1:length(bit)
    d = 2^bit(i);
    fprintf('%d -> %d\n', i, d);
    z = round(img/d);
    output = z * d;
    figure;
    imshow(output);
    title(sprintf('%d', i));
    
end