clearvars;
close all;
clc;

I = imread('resources/phobos.bmp');
figure; imshow(histeq(I)); title('klasyczne wyrownanie HE');
load('resources/histogramZadany.mat');
I_zadany = histeq(I, histogramZadany);
figure; imshow(I_zadany); title('dopasowanie histogramu zadanym');
figure; imhist(histeq(I, histogramZadany)); title('histogram obrazu po zastosowaniu wyrownania');
