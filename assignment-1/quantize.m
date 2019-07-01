function [output] = quantize(img, bit)
    d = 2^bit;
    z = round(img/d);
    output = z*d;
end

