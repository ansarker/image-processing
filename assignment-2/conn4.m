%% Anis Sarker
%  Date: 03/08/2017

%  Input: bitwise image [0 to 1]
%  Output: connected components labeled image

clear all;
clear;
clc;

img = imread('object.bmp');
img = 1-img;
[rows,cols] = size(img);

%% Padding 
I = zeros(rows+2,cols+2,'double');
I(2:rows+1,2:cols+1) = img;
A = [];

%% 1st Pass.
value = 1;
for row =1:1:rows+1
    for col = 1:1:cols+1
        if(I(row,col) ==1)
            if(I(row,col-1) == 0 && I(row-1,col) == 0)
                I(row,col) = value;
                value = value+1;
            elseif(I(row,col-1) ~= 0  && I(row-1,col) ~=  0)
                    I(row,col) = max(I(row,col-1),I(row-1,col));
                    if ~(I(row,col-1) == I(row-1,col))
                         A = [A,[I(row,col-1);I(row-1,col)]];
                    end
            elseif(I(row,col-1) ~= 0  || I(row-1,col) ~=  0)
                    I(row,col) = max(I(row,col-1),I(row-1,col));
            end                
        end
    end
end
   % 2nd pass
A = unique(A.','rows').';
[x,y] = size(A);
for i = 1:y
    c1 = min(A(1,i),A(2,i));
    c = max(A(1,i),A(2,i));
    for j =1:y
        if(i ~= j)
            if(A(1,j) == c)
                A(1,j) = c1;
            elseif(A(2,j) == c)
                A(2,j) = c1;
            end
        end
    end
end
% 
[u,v] = size(I);

 for i =1:u
     for j=1:v
         for k=1:y
             if(I(i,j) == max(A(1,k),A(2,k)))
                 I(i,j) = min(A(1,k),A(2,k));
             end
         end
     end
 end
p = label2rgb(I);
figure;
subplot(1,2,1); imshow(img); title('Input');
subplot(1,2,2); imshow(p); title('Connected Components');
% imwrite(p,'out_tur_cc4.jpg');