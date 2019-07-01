%% Anis Sarker
%  Date: 10/08/2017

%  Input: 3-channel or 1-channel image
%  Alpha: must be positive
%  Output: contrast changed image


%% contrast
function [output] = contrast(img, alpha)
    output = uint8(zeros(size(img)));
    if alpha < 0
        fprintf('alpha value must not lower than 0\n');
    elseif alpha == 1.0
        output = img;
    else
        for idx = 1:size(img,3)
            t = (alpha.*(img(:,:,idx)-127))+127;
            if t < 0
                output(:,:,idx) = 0;
            elseif t > 255
                output(:,:,idx) = 255;
            else
                output(:,:,idx) = t;
            end
        end
    end
end

