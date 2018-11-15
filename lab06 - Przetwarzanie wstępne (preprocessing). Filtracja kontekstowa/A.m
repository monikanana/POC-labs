close all;
clearvars;
clc;

I = imread('resources/plansza.bmp');

%% zad 4
filtr = fspecial('average', 3);
I_filtered = uint8(conv2(I, filtr, 'same'));

figure(1);
subplot(3,1,1); imshow(I);
subplot(3,1,2); imshow(I_filtered);
subplot(3,1,3); imshow(imabsdiff(I, I_filtered), []);

%% zad 6
% wniosek: im wieksza wartosc okna tym wieksze rozmycie obrazu

%% zad 7
I2 = imread('resources/lena.bmp');

M = [1 2 1; 2 4 2; 1 2 1];
M = M/sum(sum(M));

I2_filtered = uint8(conv2(I2, M, 'same'));

figure(2);
subplot(3,1,1); imshow(I2);
subplot(3,1,2); imshow(I2_filtered);
subplot(3,1,3); imshow(imabsdiff(I2, I2_filtered), []);

%% zad 10
maska_gaussa = fspecial('gaussian',5,0.5);

I3_filtered = uint8(conv2(I2, maska_gaussa, 'same'));

figure(3);
subplot(3,1,1); imshow(I2);
subplot(3,1,2); imshow(I3_filtered);
subplot(3,1,3); imshow(imabsdiff(I2, I3_filtered), []);

%% zad 11
% wniosek: im wieksze odchylenie standardowe tym wieksza roznica miedzy
% obrazem oryginalnym a przefiltrowanym
