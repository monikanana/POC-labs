close all;
clearvars;
clc;

load('resources/gra.mat');
I = obraz;
lut = makelut(@funZadanie, 3);

for i = 1:50
    I = applylut(I, lut);
    
    imshow(I, 'InitialMagnification', 5000); % wyswietla obraz 50x wiekszy niz domyslnie
    pause(0.5);
    refresh;
end