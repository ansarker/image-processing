clc;
clear;
clear all;

a = 2;
x = 0:255;
LUT = 255 ./ (1+exp(-a*(x-127)/32));

grid on;
plot(x,LUT);
xlim([0,255]);
ylim([0,255]);