close all;
clearvars;
clc;

load('MR_data.mat');
local_window = [9 9];

%% konwolucja
I_noisy1_conv = convolution(I_noisy1,local_window);

figure(1)
subplot(1,2,1); imshow(I_noisy1,[]); title('obraz oryginalny');
subplot(1,2,2); imshow(I_noisy1_conv,[]); title('obraz po konwolucji');

%% bilateryzacja
I_noisy1_bil = bilateral(I_noisy1,local_window);

figure(2)
subplot(1,2,1); imshow(I_noisy1,[]); title('obraz oryginalny');
subplot(1,2,2); imshow(I_noisy1_bil,[]); title('obraz po bilateryzacji');