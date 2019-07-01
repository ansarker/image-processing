clc;
clear;
clear all;
close all;

% img = imread('ocr.jpeg');
img = imread('object.bmp');
% threshold = graythresh(img);
% img = im2bw(img,threshold);
img = 1-img;
imshow(img);
[row, col] = size(img);

linked = [];
% all vertices are not visited
label = zeros(size(img));
next_label = 1

for i = 1:row
    for j = 1:col
        if img(i,j) ~= 0
            if img(i,j) == img(i,j-1)
                neighbour = img(i,j);
            elseif img(i,j) == img(i-1,j)
                neighbour = img(i,j);
            else
                neighbour = -1;
            end
            
            if neighbour == -1
                linked(next_label) = next_label;
                label(i,j) = next_label;
                next_label = next_label + 1;
            else
                smallest_label = min(label);
                L = [];
                if img(i,j-1) == smallest_label
                    L = [L, img(i,j-1)];
                elseif img(i-1,j) == smallest_label
                    L = [L, img(i-1,j)];
                end
                label = min(L);
                for l = 1:L
                    linked(l) = union(linked(l), L);
                end
            end
        end
    end
end

% for i = 1:row
%     for j = 1:col
%         if img(i,j) ~= 0
%                label(i,j) = find(label);
%         end
%     end
% end