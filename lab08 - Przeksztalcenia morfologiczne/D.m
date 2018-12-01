close all;
clearvars;
clc;

I = imread('resources/calculator.bmp');

figure(1); imshow(I); title('oryginalny');

% krok 1,2 - cel: usuniecie poprzecznych odblaskow
% krok 3   - cel: usuniecie pionowych odblaskow
% krok 4   - cel: odzyskanie "I" przy "ASIN"

%% krok 1: otwarcie przez rekonstrukcje (zad:3)
I_step_1 = imerode(I, ones(1,71));
marker = I_step_1;
maska = I;
I_step_1 = imreconstruct(marker, maska);
figure(2);
subplot(1,2,1); imshow(I_step_1); title('otwarcie przez rekonstrukcje'); % to na razie tylko obraz tla
subplot(1,2,2); imshow(imopen(I, ones(1,71))); title('porownanie: klasyczne otwarcie');

%% krok 2: top-hat przez rekonstrukcje (odjecie efektu poprzedniego kroku od oryginalu) (zad:4)
I_step_2 = imabsdiff(I, I_step_1);
figure(3);
subplot(1,2,1); imshow(I_step_2); title('oryginal - otwarcie przez rekonstrukcje');
subplot(1,2,2); imshow(imtophat(I, ones(1,71))); title('porownanie: oryginal - klasyczne otwarcie');

%% krok 3: otwarcie przez rekonstrukcje (zad:5)
I_step_3 = imerode(I_step_2, ones(1,11));
marker = I_step_3;
maska = I_step_2;
I_step_3 = imreconstruct(marker, maska);
figure(4);
imshow(I_step_3); title('oryginal - otwarcie przez rekonstrukcje');

%% krok 4: dylatacja i rekonstrukcja (zad:6)
I_step_4 = imdilate(I_step_3, ones(1,21));
marker = min(I_step_4, I_step_2);
maska = I_step_2;
I_step_4 = imreconstruct(marker, maska);
figure(5); imshow(I_step_4); title('dylatacja i rekonstrukcja');