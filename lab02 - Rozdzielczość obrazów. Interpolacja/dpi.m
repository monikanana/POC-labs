clearvars;
close all;
clc;

% dpi excercise

I = imread('lena.bmp');

figure(1); imshow(I);
figure(2); imshow(imresize(I, [200,200]));
figure(3); imshow(I, 'InitialMagnification',600);


% adjust exercise -> fix this

I = imresize(I,[128,128]);
I = imadjust(I,0,31);

figure(4); imshow(I);