clear all;
clear;
clc;

% original image = f(x,y)
img = imread('img.jpg');

% noisy image = g(x,y) after adding salt and pepper noise n(x,)
nimg = imnoise(img, 'salt & pepper', 0.15);

% output image after image averaging g'(x,y)
output = zeros(size(img));
nimg = double(nimg);

% kernel
kernel = zeros(5);
[rows, cols, channel] = size(img);

for i = 2:rows-1
    for j = 2:cols-1
        for k = 1:channel
        average = 0;
            pixel = (nimg(i-1,j-1,k) + nimg(i-1,j,k) + ...
               nimg(i-1,j+1,k) + nimg(i,j-1,k) + ...
               nimg(i,j,k) + nimg(i,j+1,k) + ...
               nimg(i+1,j-1,k) + nimg(i+1,j,k) + ...
               nimg(i+1,j+1,k)) / 9;
            average = average + pixel;
            output(i,j,k) = average;
        end
    end
end

nimg = uint8(nimg);
output = uint8(output);

figure;
subplot(2,2,1); imshow(img); title('Original Image f(x,y)');
subplot(2,2,2); imshow(nimg); title('Noisy Image g(x,y)');
subplot(2,2,3); imshow(output); title('Output Image');
subplot(2,2,4); imshow(img); title('Original Image');