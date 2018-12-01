close all;
clearvars;
clc;

I = imread('resources/fingerprint.bmp');

figure(1);
subplot(2,2,1); imshow(I); title('oryginal');
subplot(2,2,2); imshow(bwmorph(I, 'thin')); title('scienianie x 1');
subplot(2,2,3); imshow(bwmorph(I, 'thin', 2)); title('scienianie x 2');
subplot(2,2,4); imshow(bwmorph(I, 'thin', Inf)); title('scienianie x Inf');

I = imread('resources/kosc.bmp');

figure(2);
subplot(2,2,1); imshow(I); title('oryginal');
subplot(2,2,2); imshow(bwmorph(I, 'skel')); title('szkieletyzacja x 1');
subplot(2,2,3); imshow(bwmorph(I, 'skel', 2)); title('szkieletyzacja x 2');
subplot(2,2,4); imshow(bwmorph(I, 'skel', Inf)); title('szkieletyzacja x Inf');

%% otwarcie przez rekonstrukcje
I = imread('resources/text.bmp');
figure(3);
subplot(5,1,1); imshow(I); title('oryginal');
I_otwarcie = imopen(I, ones(51,1));
subplot(5,1,2); imshow(I_otwarcie); title('otwarcie pionowymi liniami o dlugosci 51');
marker = imerode(I, ones(51,1));
maska = I;
I_rekonstr = imreconstruct(marker, maska);
subplot(5,1,3); imshow(I_rekonstr); title('rekonstrukcja');

%% wypelnienia dziur
I_wypeln = imfill(I, 'holes');
subplot(5,1,4); imshow(I_wypeln); title('wypelnienia dziur');

%% czyszczenie brzegu
I_brzeg = imclearborder(I);
subplot(5,1,5); imshow(I_brzeg); title('czyszczenie brzegu');
