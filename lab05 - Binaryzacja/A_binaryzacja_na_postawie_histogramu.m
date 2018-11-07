clearvars;
close all;
clc;

% na potrzeby zadania 2: coins.png
% na potrzeby zadania 8:  katalog.bmp, obiekty.bmp, rice.png, tekst.bmp 
I = imread('resources/coins.png');
figure(1);
subplot(2,1,1); imshow(I); title ('oryginalny');
subplot(2,1,2); imhist(I);

BW = im2bw(I, 100/255);
figure(2);
subplot(2,1,1); imshow(BW); title ('po binaryzacji');
subplot(2,1,2); imhist(BW);

%% zad 4 - mozna testowac dla figura.png, figura2.png, figura3.png, figura4.png i roznych wartosci progu
I_figura = imread('resources/figura4.png');
figure(3);
subplot(2,1,1); imshow(I_figura); title ('oryginalny');
subplot(2,1,2); imhist(I_figura);

prog = 50;
BW_figura = im2bw(I_figura, prog/255);
figure(4);
subplot(2,1,1); imshow(BW_figura); title ('po binaryzacji');
subplot(2,1,2); imhist(BW_figura);

%% zad 5 - binaryzacja automatyczna metoda Otsu
level = graythresh(I);
BW = im2bw(I, level);
figure(6);
subplot(2,1,1); imshow(BW); title ('po binaryzacji');
subplot(2,1,2); imhist(BW);

%% zad 7 - binaryzacja metoda Kittler oraz Yen
addpath('./resources/');
level_k = clusterKittler(I);
level_y = entropyYen(I);
figure(7);
subplot(3,2,1); imshow(I); title('obraz oryginalny');
subplot(3,2,2); imhist(I); title('histogram oryginalu');
subplot(3,2,3); imshow(im2bw(I, level_k/255));
title(['binaryzacja metoda Kittler, prog: ', num2str(level_k)]);
subplot(3,2,4); imshow(im2bw(I, graythresh(I)));
title('binaryzacja metoda Otsu');
subplot(3,2,5); imshow(im2bw(I, level_y/255)); title('binaryzacja metoda Yen');
title(['binaryzacja metoda Yen, prog: ', num2str(level_y)]);
subplot(3,2,6); imshow(im2bw(I, 90/255));
title('binaryzacja z progiem wyliczonym "na oko"');