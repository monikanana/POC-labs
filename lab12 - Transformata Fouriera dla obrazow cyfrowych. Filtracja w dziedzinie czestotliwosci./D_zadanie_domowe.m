clearvars;
close all;
clc;

literki = imread('resources/literki.bmp');
wzor = imread('resources/wzorA.bmp');

figure; imshow(literki);
figure; imshow(wzor);

F_literki = fft2(literki, 256, 256);
F_wzor = fft2(rot90(rot90(wzor)), 256, 256);

figure; imshow(F_literki);
figure; imshow(F_wzor);

pomnozone = ifft2(F_literki .* F_wzor);
figure; imshow(pomnozone);
