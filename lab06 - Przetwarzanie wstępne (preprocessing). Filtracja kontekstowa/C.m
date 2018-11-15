clearvars;
close all;
clc;

I = imread('moon.tif');
figure(1);
subplot(1,3,1); imshow(I);
M = [0 1 0; 1 -4 1; 0 1 0]; % podstawowa maska Laplasjana
M = M/9; % normalizacja maski

I_filtered = uint8(conv2(I, M, 'same'));

% normalizacja przez skalowanie
I_norm_1 = I_filtered + 128;
subplot(1,3,2); imshow(I_norm_1, []);

% normalizacja przez modul
I_norm_2 = abs(I_filtered);
subplot(1,3,3); imshow(I_norm_2, []);

%% zad 5
