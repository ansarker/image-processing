%% Anis Sarker
%  Date: 10/08/2017

%  Input: 3-channel or 1-channel image
%  Value: increases intensity
%  Output: return the new image


%% increase brightness
function [output] = increase(img, value)
    output = uint8(zeros(size(img)));
    for idx = 1:size(img,3)
        intensity = img(:,:,idx) + value;
        if intensity > 255
            output(:,:,idx) = 255;
        else
            output(:,:,idx) = intensity;
        end
    end
end