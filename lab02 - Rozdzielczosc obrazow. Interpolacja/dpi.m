clearvars;
close all;
clc;

% dpi excercise

I = imread('resources/lena.bmp');

figure(1); imshow(I);
figure(2); imshow(imresize(I, [256,256]));
figure(3); imshow(imresize(I, [128,128]));
figure(4); imshow(imresize(I, [64,64]));

figure(5); imshow(I, 'InitialMagnification',1000);
figure(6); imshow(imresize(I, [256,256]), 'InitialMagnification',200);
figure(7); imshow(imresize(I, [128,128]), 'InitialMagnification',200);
figure(8); imshow(imresize(I, [64,64]), 'InitialMagnification',200);