clearvars;
close all;
clc;

%% zad 1 - filtracja medianowa
I = imread('resources/lenaSzum.bmp');

figure(1);
subplot(3,1,1); imshow(I);
subplot(3,1,2); imshow(medfilt2(I)); % medfilt2() tworzy filtr i od razu wykonuje filtracje
title('po zastosowaniu filtru medianowego');
subplot(3,1,3); imshow(imabsdiff(I, medfilt2(I)), []);

%% zad 2
I = imread('resources/lenaSzum.bmp');
filtr = fspecial('average', 3);
I_filtr_usred = uint8(conv2(I, filtr, 'same'));

figure(2);
subplot(3,1,1); imshow(I);
subplot(3,1,2); imshow(I_filtr_usred);  title('po zastosowaniu filtru usredniajacego');
subplot(3,1,3); imshow(imabsdiff(I, I_filtr_usred), []);

%% zad 3
I = imread('resources/lena.bmp');
for i=1:10
    I = medfilt2(I,[5 5]);
end
figure(3); imshow(I);

% WNIOSEK: 1. im wi?ksza warto?? okna mediany tym wi?ksze rozmycie
%          2. zastosowanie medfilt2() dla lena.bmp i lenaSzum.bmp daje ten
%             sam efekt

%% zad 7 - filtracja medianowa dla obraz�w kolorowych
addpath(genpath('.\resources'));
% wywolaj: median3dRGB.m dla obrazow lenaRGB.bmp oraz lenaRGBSzum.bmp