%% Anis Sarker
%  Date: 17/08/2017

%% Assignment 3
%% Contrast stretching function
%  Input: 3-channel or 1-channel image
%  Output: return contrast stretched image


%% contrast stretching
function [output] = contrast_stretch(img)
    img = double(img);
    output = zeros(size(img));

    min_i = min(img(:));
    max_i = max(img(:));
    min_j = 0;
    max_j = 255;

    for i = 1:size(img,3)
        pixel = img(:,:,i);
        intensity = (pixel - min_i) * ((max_j - min_j) / (max_i - min_i)) + min_j;
        output(:,:,i) = intensity;
    end
    %% change output image to uint8
    output = uint8(output);
end

