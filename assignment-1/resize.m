% Anis Sarker
% Date: 23 Oct 2017
% -----------------------
% Take a 3 channel image and scale between (0.0 to any)
% return the bilinear re-sampled image as output

function [output] = resize(img, scale)
    %% input img size
    rows = size(img, 1);
    cols = size(img, 2);

    %% output img
    out_rows = floor(rows * scale);
    out_cols = floor(cols * scale);

    %% output will be later converted to uint8
    output = double(zeros(out_rows, out_cols, size(img, 3)));

    %% bilinear
    sr = rows/out_rows;
    sc = cols/out_cols;

    rf = zeros(out_rows);
    cf = zeros(out_cols);

    for r = 1:out_rows
        for c = 1:out_cols
            rf(r, c) = r * sr;
            cf(r, c) = c * sc;
        end
    end

    %% same as above from rf = zeros(out_rows)
    % [cf_, rf_] = meshgrid(1:out_cols, 1:out_rows);
    % 
    % rf_ = rf_ * sr;
    % cf_ = cf_ * sc;

    %% floor of rf and cf
    r = floor(rf);
    c = floor(cf);

    %% check if any values out of range
    r(r < 1) = 1;
    c(c < 1) = 1;
    r(r > rows - 1) = rows - 1;
    c(c > cols - 1) = cols - 1;

    %% distance between rf - r0 and cf - c0
    delta_r = rf - r;
    delta_c = cf - c;

    %% 4 corner positions
    ind_1 = sub2ind([rows, cols], r, c);
    ind_2 = sub2ind([rows, cols], r+1, c);
    ind_3 = sub2ind([rows, cols], r, c+1);
    ind_4 = sub2ind([rows, cols], r+1, c+1);

    output = cast(output, class(img));

    for idx = 1 : size(img, 3)
        channel = double(img(:, :, idx));
        temp = channel(ind_1) .* (1 - delta_r) .* (1 - delta_c) + channel(ind_2) .* (delta_r) .* (1 - delta_c) + channel(ind_3) .* (1 - delta_r) .* (delta_c) + channel(ind_4) .* (delta_r) .* (delta_c);
        output(:,:, idx) = cast(temp, class(img));
    end
end