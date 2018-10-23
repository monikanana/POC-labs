clear;
close all;

gray = imread('resources/lena_gray.bmp');

ind = gray2ind(gray, 256);

% zad 4

figure(1)
imshow(ind);

% zad 5

map = colormap(summer);
figure(2)
imshow(ind, map);