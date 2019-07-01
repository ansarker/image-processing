im = [0 0 0 0 0 0; 0 1 1 0 0 0; 0 1 1 0 0 0; 0 0 0 0 0 0; 0 0 1 0 0 0; 0 1 1 1 0 0; 0 0 1 0 0 0; 0 0 0 0 0 0];
img = im2bw(im);

% initialized visited as zero
label = zeros(size(img));
% current label
curr_label = 1;


for i = 2:size(img,1)
    for j = 2:size(img,2)
        if img(i,j) ~= 0
            if img(i,j) == img(i-1,j) || img(i,j) == img(i,j-1) || ...
               img(i,j) == img(i,j+1) || img(i,j) == img(i+1,j)
                label(i,j) = curr_label;
            elseif img(i,j) ~= img(i-1,j) || img(i,j) ~= img(i,j-1) || ...
                   img(i,j) ~= img(i,j+1) || img(i,j) ~= img(i+1,j)
                curr_label = curr_label+1;
            end
            
        end
    end
end

figure;
imshow(img);