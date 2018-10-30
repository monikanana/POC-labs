clearvars;
close all;
clc;

lena1 = imread('resources/lena1.bmp');
lena2 = imread('resources/lena2.bmp');
lena3 = imread('resources/lena3.bmp');
lena4 = imread('resources/lena4.bmp');

%% zad 1
figure(1);
subplot(4,2,1); imshow(lena1);
subplot(4,2,2); imhist(lena1,256);
subplot(4,2,3); imshow(lena2);
subplot(4,2,4); imhist(lena2,256);
subplot(4,2,5); imshow(lena3);
subplot(4,2,6); imhist(lena3,256);
subplot(4,2,7); imshow(lena4);
subplot(4,2,8); imhist(lena4,256);

%% zad 3
hist1 = imread('resources/hist1.bmp');
figure(2);
subplot(1,2,1); imshow(hist1);
subplot(1,2,2); imhist(hist1, 256); title('histogram');

%% zad 4 - wyrownanie histogramu
figure(3);
hist_1_adjusted = imadjust(hist1);
subplot(1,2,1); imshow(hist_1_adjusted); title('histogram wyrownany')
subplot(1,2,2); imhist(hist_1_adjusted, 256);

%% zad 8
figure(4);
[H,x] = imhist(hist1); % x - wartosci na osi X, H - na osi Y
bar(x,H); % wyswietlenie histogramu - alternatywa dla imhist(I);
C = cumsum(imhist(hist1)); % wartosci histogramu skumulowanego 

% skalowanie histogramu skumulowanego tak, aby si? zmie?ci? na wykresie
% dlaczego? sprawdz: plot(C); <- max(C) = 57120!
k = max(C)/max(H); 
C2 = C/k;

figure(5);
hold on;
% p1,p2 - plots, n1,n2 - names of plots
p1 = plot(x,H); n1 = 'histogram';
p2 = plot(x,C2); n2 = 'histogram skumulowany';
legend([p1;p2], n1, n2);
hold off;

%% zad 9
figure(6);
subplot(2,2,1:2); bar(x,H); xlim([0 255]); title('histogram');
subplot(2,2,3:4); bar(x,C2); xlim([0 255]); title('histogram skumulowany');