close all;
clearvars;
clc;

I = imread('resources/shapes.png');
figure(1); imshow(I,[]); title('Oryginalny');

% implemetacja algorytmu wykrywania kwadratow zdefiniowana w funkcji
% C_FUNKCJA_wykrycie_kwadratow(obraz)
I_z_kwadratami = C_FUNKCJA_wykrycie_kwadratow(I);

figure(2); imshow(I_z_kwadratami);