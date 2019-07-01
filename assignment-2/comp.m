clc;
clear;
close all;

img = imread('object.bmp');
img = 1-img;

[rows, cols] = size(img);
conn = 8;
num_of_object = [];
pixel_dist = [];
cc = struct('Connectivity', conn, ... 
            'Size', [rows, cols], ...
            'NumberOfObject', num_of_object, ...
            'PixelDistribution', pixel_dist);

fprintf('%d\n', cc.Connectivity);
count = 0;
cor = {};
% for i = 1:rows
%     for j = 1:cols
%         if img(i,j) == 1
% %             cor = [cor, [i,j]];
% %             count = count + 1;
% %         end
% %         if count == 1
% %             break;
%             if img(i,j) == img(i-1,j-1) || img(i,j) == img(i-1,j) || ...
%                img(i,j) == img(i-1,j+1) || img(i,j) == img(i,j+1) || ...
%                img(i,j) == img(i+1,j-1) || img(i,j) == img(i+1,j) || ...
%                img(i,j) == img(i+1,j+1) || img(i,j) == img(i,j-1) ...
%                count = count + 1;
%                cor = [cor, [i,j]];
%             else
%                 break;
%                 cc.NumberOfObject = [cc.NumberOfObject, 1];
%             end
%         end
%     end
% end
out = ones(size(img));
co = 0;
for i = 1:rows
    for j = 1:cols
        if img(i,j) == 1
            if img(i,j) == img(i-1,j-1)
                cor = [cor, [i,j]];
                out(i-1,j-1) = 0;
            elseif img(i,j) == img(i-1,j)
                cor = [cor, [i,j]];
                out(i-1,j) = 0;
            elseif img(i,j) == img(i-1,j+1)
                cor = [cor, [i,j]];
                out(i-1,j+1) = 0;
            elseif img(i,j) == img(i,j-1)
                cor = [cor, [i,j]];
                out(i,j-1) = 0;
            elseif img(i,j) == img(i,j+1)
                cor = [cor, [i,j]];
                out(i,j+1) = 0;
            elseif img(i,g) == img(i+1,j-1)
                cor = [cor, [i,j]];
                out(i+1,j-1) = 0;
            elseif img(i,j) == img(i+1,j)
                cor = [cor, [i,j]];
                out(i+1,j) = 0;
            elseif img(i,j) == img(i+1,j+1)
                cor = [cor, [i,j]];
                out(i+1,j+1) = 0;
            else
                co = co + 1;
            end
        end
    end
end

figure;
subplot(1,2,1); imshow(img);
subplot(1,2,2); imshow(out);