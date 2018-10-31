clearvars;
close all;
clc;

I = imread('resources/phobos.bmp');
figure(1); imshow(histeq(I)); title('klasyczne wyrownanie HE');
load('resources/histogramZadany.mat');
I_zadany = histeq(I, histogramZadany);
figure(2); imshow(I_zadany); title('obraz wynikowy po dopasowaniu zadanym histogramem');
figure(3); imhist(histeq(I, histogramZadany)); title('histogram obrazu po zastosowaniu wyrownania');

% zad 4
figure(4); I_adjust = imadjust(I); imshow(I_adjust);
figure(5); I_clahe = adapthisteq(I); imshow(I_clahe);
figure(6);
subplot(10,1,1:4); imhist(I_adjust); title('histogram obrazu po zastosowaniu imadjust');
subplot(10,1,6:10); imhist(I_clahe); title('histogram obrazu po zastosowaniu adapthisteq');