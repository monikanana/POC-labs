close all;
clearvars;
clc;

I = imread('resources/shapesReal.png');
figure(1); imshow(I,[]); title('Oryginalny');

%% przygotowanie obrazu
% binaryzacja
I = im2bw(I,0.2);
% otwarcie
I = ~imopen(I, strel('square', 3));

figure(2); imshow(I,[]); title('Po binaryzacji, otwarciu i zanegowaniu');

%% indeksacja
I_z_kwadratami = C_FUNKCJA_wykrycie_kwadratow(I);

figure(3); imshow(I_z_kwadratami);