close all;
clearvars;
clc;

I = imread('resources/tekstReczny.png');
figure;
subplot(2,1,1); imshow(I);
subplot(2,1,2); imhist(I);

%% zad 2 - binaryzacja reczna i metoda Otsu
figure; imshow(im2bw(I, 20/256)); title('recznie wyznaczony prog');
figure; imshow(im2bw(I, graythresh(I))); title('prog wyznaczony metoda Otsu')
% graythresh() wyznacza wieksza wartosc progu, dlatego na zbinaryzowanym obrazie
% pojawia sie oragla czarna ramka

%% binaryzacja z wykorzystaniem sredniej ruchomej
N = 20;
a = 0.5;
[X, Y] = size(I);
I_BW = I;

kolejka = zeros(1,N);
i = 1;
srednia = 0;

for x = 1:X
    for y = 1:Y
        i_last = mod(i,20) + 1;
        srednia = srednia + (kolejka(i) - kolejka(i_last)) / N;
        
        i = mod(i,20) + 1;
        
        T = a *  srednia;
        
        if I(x,y) > T
            I_BW(x,y) = 255;
        else 
            I_BW(x,y) = 0;
        end
    end
end

figure; imshow(I_BW); title('binaryzacja z wykorzystaniem sredniej ruchomej');