clearvars;
close all;
clc;

% adjust exercise

I = imread('resources/lena.bmp');
I = imresize(I,[128,128]);

figure(9);

subplot(2,3,1);
I_1 = imadjust(I,[0 1],[0 1/(256/32)]);
imshow(I_1,[]);

subplot(2,3,2);
I_2 = imadjust(I,[0 1],[0 1/(256/16)]);
imshow(I_2,[]);

subplot(2,3,3);
I_3 = imadjust(I,[0 1],[0 1/(256/8)]);
imshow(I_3,[]);

subplot(2,3,4);
I_4 = imadjust(I,[0 1],[0 1/(256/4)]);
imshow(I_4,[]);

subplot(2,3,5);
I_5 = imadjust(I,[0 1],[0 1/(256/2)]);
imshow(I_5,[]);