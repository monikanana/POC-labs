clc;
clearvars;
close all;

obraz = imread('resources/bart.bmp');
figure;
subplot(1,3,1); imshow(obraz);
subplot(1,3,2); imhist(obraz);

% odczytane dzieki Tools > Data Cursor > Index
skora = 203;
progDolny = 190;
progGorny = 210;

% segmentacja na podstawie koloru skory
obrazBW = obraz > progDolny & obraz < progGorny;

subplot(1,3,3); imshow(uint8(obrazBW), []);