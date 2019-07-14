function [output] = medianfilter(input, kernel)
    [rows, cols, channel] = size(input);
    [kr, kc] = size(kernel);

    edgex = floor(kr/2);
    edgey = floor(kc/2);
    
    input = double(input);
    output = zeros(size(input));

    for row = edgex:rows-edgex
        for col = edgey:cols-edgey
            i = 1;
            for fx = 1:kr-1
                for fy = 1:kc-1
                    kernel(i) = input(row + fx - edgex, col + fy - edgey);
                    i = i + 1;
                end
            end
            kernel = sort(kernel(:));
            output(row, col) = kernel(floor(size(kernel,1)/2));
        end
    end
    output = uint8(output);
end

