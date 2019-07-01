%% Anis Sarker
%  Date: 10/08/2017

%  Input: 3-channel or 1-channel image
%  Value: decreases intensity
%  Output: return the new image

%% decrease brightness
function [output] = decrease(img, value)
    output = uint8(zeros(size(img)));
    for idx = 1:size(img,3)
        intensity = img(:,:,idx) - value;
        if intensity < 0
            output(:,:,idx) = 0;
        else
            output(:,:,idx) = intensity;
        end
    end
end