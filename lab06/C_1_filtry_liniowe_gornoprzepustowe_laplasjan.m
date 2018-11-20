clearvars;
close all;
clc;

I = imread('moon.tif');
figure(1);
subplot(1,5,1); imshow(I); title('oryginal');
M = [0 1 0; 1 -4 1; 0 1 0]; % podstawowa maska Laplasjana
M = M/9; % normalizacja maski

% konwolucja orazu z maska
I_konwolucja_1 = uint8(conv2(I, M, 'same'));

% normalizacja przez skalowanie
I_norm_1 = I_konwolucja_1 + 128;
subplot(1,5,2); imshow(I_norm_1, []); title('po normalizacji przez skalowanie');

% normalizacja przez modul
I_norm_2 = abs(I_konwolucja_1);
subplot(1,5,3); imshow(I_norm_2, []); title('po normalizacji przez modul');

%% zad 5
M_laplasjan = fspecial('laplacian');

%% zad 6
I_konwolucja_2 = uint8(conv2(I, M_laplasjan, 'same'));
roznica = imabsdiff(I, I_konwolucja_2);
subplot(1,5,4); imshow(I_konwolucja_2,[]); title('konwolucja maska Laplasjana');
subplot(1,5,5); imshow(roznica,[]); title('roznica oryginalu i filtracji maska Laplasjana');