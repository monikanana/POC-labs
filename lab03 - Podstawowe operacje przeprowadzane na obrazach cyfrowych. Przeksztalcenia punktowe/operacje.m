clearvars;
close all;
clc;

lena = imread('resources/lena.bmp');
jet = imread('resources/jet.bmp');


%% dodawanie
figure(1);

subplot(2,2,1);
imshow(lena);

subplot(2,2,2);
imshow(jet);

subplot(2,2,3);
imshow(imadd(uint16(lena), uint16(jet)), []);
title("dodawanie"); 

%% kombinacja liniowa
figure(2);

subplot(2,2,1);
imshow(lena);

subplot(2,2,2);
imshow(jet);

subplot(2,2,3);
imshow(imlincomb(2, jet));
title("kombinacja 2xjet");

subplot(2,2,4);
imshow(imlincomb(1,lena,20,jet,'uint16'),[]);
title("kombinacja 1xlena, 20xjet");

%% odejmowanie
figure(3);
imshow(imsubtract(int16(lena), int16(jet)),[]);

%% absolute
figure(4);
imshow(imabsdiff(lena, jet));

figure(5);
imshow(imabsdiff(jet, lena));

%% mnożenie
figure(6);
subplot(2,2,1);
imshow(immultiply(jet, lena));
title("jet x lena");
subplot(2,2,2);
imshow(immultiply(lena,3));
title("lena x 3");

kolo = imread('resources/kolo.bmp');
subplot(2,2,3);
imshow(immultiply(lena,boolean(kolo)));
title("lena x maska");

%% negatyw
figure(7);
imshow(imcomplement(lena));