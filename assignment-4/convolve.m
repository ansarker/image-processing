%% Anis Sarker
%  Date: 1/08/2017

%% Assignment 4
%% Convolution operation


function [output] = convolve(input,kernel)
    
    %% convert image into double
    input = double(input);
    output = zeros(size(input));
    [rows, cols, channel] = size(input);
    
    %% kernel row, col size
    kr = size(kernel,1);
    kc = size(kernel,2);
    
    %% for zero padding
    pad = floor(kr/2);
    image_padded = zeros(size(input) + (kr-1));
    image_padded(pad+1:size(image_padded, 1) - pad, pad+1:size(image_padded, 2) - pad) = input;
    
    %% convolution loop
    for row = 1:cols
        for col = 1:rows
            output(col, row) = sum(sum(kernel .* image_padded(col:col+kr-1, row:row+kc-1)));
        end
    end

    output = uint8(output);
end

