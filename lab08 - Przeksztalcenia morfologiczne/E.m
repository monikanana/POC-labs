clearvars;
close all;
clc;

I = imread('resources/szkielet.bmp');

subplot(1,2,1); imshow(I); title('oryginalny');
lut = makelut(@funE, 3);
subplot(1,2,2); imshow(applylut(I, lut)); title('punkty koncowe');