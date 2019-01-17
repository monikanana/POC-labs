clearvars;
close all;
clc;

I = imread('resources/lena.bmp');

%% zad 3

f_obraz = fft2(I);
f_przesuniete = fftshift(f_obraz);

A = abs(f_przesuniete);
Faza = angle(f_przesuniete);

A_log = log10(A+1);
F = angle(f_przesuniete.*(A>0.0001));

figure(1);
subplot(1,3,1); imshow(I); title('Oryginalny');
subplot(1,3,2); imshow(A_log,[]); title('amplituda F-obrazu');
subplot(1,3,3); imshow(F,[]); title('faza F-obrazu');

%% zad 5

th = 0;

imgfft2 = fft(I);
fft2abs = log10(abs(imgfft2) + 1);
imgfft2(fft2abs > th) = 0;



