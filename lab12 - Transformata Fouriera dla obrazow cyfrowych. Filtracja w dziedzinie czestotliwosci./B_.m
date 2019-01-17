clearvars;
close all;
clc;

I = imread('resources/lena.bmp');

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

%% zad 4 filtracja gornoprzepustowa
[f1, f2] = freqspace(512, 'meshgrid');
Hd = ones(512);
r = sqrt(f1.^2 + f2.^2);

Hd(r>0.1) = 0; % maska kola

figure(2); colormap(jet(64)); mesh(f1, f2, Hd);


%% zad 5 - wlasciwa filtracja - mnozenie F-obrazu przez filtr Hd
figure(3); imshow(f_obraz .* Hd);

%% zad 7
h = fwind1(Hd, hanning(21));
[H, f1, f2] = freqz2(h, 512, 512);
figure(4); mesh(f1, f2, H);

%% zad 9 - filtr Gaussa
[X, Y] = size(I);
maska = fspecial('gaussian', X, 10); % ta 10 jest tutaj troche strzalem
gray = mat2gray(maska);
figure(5); imshow(gray);

F = fft2(I);        % fourier
F = fftshift(F);    % przesuniecie
F = F .* maska;     % maska
F = ifft2(F);       % odwrotny fourier
figure(6); imshow(F);