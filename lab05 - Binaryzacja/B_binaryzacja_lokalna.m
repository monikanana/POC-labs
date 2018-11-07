clc;
clearvars;
close all;

%% zad 2-7
I = imread('resources/rice.png');
[X, Y] = size(I);
I_BW = I;

window = 15; % przyjecie podane w zadaniu
W2 = floor(window/2);

addpath('./resources');
for i = 1:X
    for j = 1:Y
        BW = meanLT(i,j,W2,I,X,Y);
        if I_BW(i,j) > BW
            I_BW(i,j) = 255;
        else
            I_BW(i,j) = 0;
        end
    end 
end

figure;
subplot(3,1,1); imshow(I); title('obraz oryginalny');
subplot(3,1,2); imshow(I_BW); title('obraz zbinaryzowany lokalnie');

%% zad 8
% odp: jakie sa wady tej metody? ciezko dobrac odpowiednia wielkosc okna

%% zad 9-10 - metoda Sauvoli

I_BW_Sauvoli = I;
addpath('./resources');
for i = 1:X
    for j = 1:Y
        m = meanLT(i,j,W2,I,X,Y);   % srednia w oknie
        odchylenie = stddevLT(i,j,W2,I,m,X,Y);
        k = 0.15;
        R = 128;
        BW = m*(1-k*(odchylenie/R-1));
        if I_BW_Sauvoli(i,j) > BW
            I_BW_Sauvoli(i,j) = 255;
        else
            I_BW_Sauvoli(i,j) = 0;
        end
    end 
end

%% zad 12 - porownanie
subplot(3,1,3); imshow(I_BW_Sauvoli); title('obraz zbinaryzowany lokalnie metoda Sauvoli');