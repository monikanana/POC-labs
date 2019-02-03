close all;
clearvars;
clc;

I = imread('resources/trojkat.bmp');

f_img = fft2(I);
f_przesuniete = fftshift(f_img);

A = abs(f_przesuniete);
Faza = angle(f_przesuniete);

A_log = log10(A+1);
F = angle(f_przesuniete.*(A>0.0001));

figure(1);
subplot(1,3,1); imshow(I); title('Oryginalny');
subplot(1,3,2); imshow(A_log,[]); title('amplituda F-obrazu');
subplot(1,3,3); imshow(F,[]); title('faza F-obrazu');