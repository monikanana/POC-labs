close all;
clearvars;
clc;

I = imread('resources/ertka.bmp');

SE = strel('square', 3);
I_eroded = imerode(I, SE);

figure(1);
subplot(2,1,1); imshow(I); title('oryginalny');
subplot(2,1,2); imshow(I_eroded); title('po erozji');

% WNIOSEK: erozja dziala nastepujaco: przesuwa maske (element strukturalny
% SE) po calym obrazie i dla kazdego piksela wybiera element minimalny
% z jego otoczenia i ten pixel wstawia do obrazu wynikowego. w efekcie
% "przerysowujemy obraz wejsciowy markerem o ksztalcie SE"

%% zad 6
I_multi_erode = I;
for i=1:3
    I_multi_erode = imerode(I_multi_erode, SE);
end

figure(2);
subplot(3,1,1); imshow(I); title('oryginal')
subplot(3,1,2); imshow(I_multi_erode); title('po dwukrotnej erozji kwadratem 3x3')
subplot(3,1,3); imshow(imerode(I, strel('square', 9))); title('po jednokrotnej erozji kwadratem 9x9')

% nie mam wnioskow xD

%% zad 7
figure(3);
I_buzka = imread('resources/buzka.bmp');
subplot(3,1,1); imshow(I_buzka); title('orygialny');

SE_buzka_skos_w_prawo = [1,0,0;0,1,0;0,0,1]; 
subplot(3,1,2); imshow(imerode(I_buzka,SE_buzka_skos_w_prawo)); title('erozja, SE: [1,0,0;0,1,0;0,0,1]');

SE_buzka_skos_w_prawo = [0,0,1;0,1,0;1,0,0]; 
subplot(3,1,3); imshow(imerode(I_buzka,SE_buzka_skos_w_prawo)); title('erozja, SE: [0,0,1;0,1,0;1,0,0]');

%% zad 8
SE = strel('square', 3);
I = imread('resources/ertka.bmp');
figure(4)
subplot(2,1,1); imshow(I); title('oryginalny');
subplot(2,1,2); imshow(imdilate(I,SE)); title('dylatacja, SE: kwadrat 3x3');

%% zad 9
SE = strel('square', 3);
I = imread('resources/kolka.bmp'); % testuj dla wyspa.bmp, ertka.bmp, kolka.bmp
figure(5);
subplot(5,1,1); imshow(I); title('oryginalny');
subplot(5,1,2); imshow(imerode(I, SE)); title('erozja, SE: kwadrat 3x3');
subplot(5,1,3); imshow(imdilate(I, SE)); title('dylatacja, SE: kwadrat 3x3');
subplot(5,1,4); imshow(imopen(I, SE)); title('otwarcie, SE: kwadrat 3x3');
subplot(5,1,5); imshow(imclose(I,SE)); title('zamkniecie, SE: kwadrat 3x3');

%% zad 11 - mini zadanko :D
I = imread('resources/ertka.bmp');
SE = strel('square', 3);
figure(6);
subplot(2,1,1); imshow(I); title('oryginalny');
subplot(2,1,2); imshow(imclose(imopen(I, SE), SE)); title('czysta ertka');

%% zad 13 - trafi, nie trafi
I = imread('resources/hom.bmp');
figure(7);
subplot(2,1,1); imshow(I); title('oryginalny');
SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];
subplot(2,1,2); imshow(bwhitmiss(I, SE1, SE2)); title('trafi nie trafi');