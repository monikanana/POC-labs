clearvars;
close all;
clc;

I = imread('resources/jet.bmp');
H = imhist(I);
figure; imshow(I); title('Obraz oryginalny');

%% bhe

% wyznaczenie progu podzialu
srednia_z_kolumn = mean(I);
lm = round(mean(srednia_z_kolumn));

% podzial histogramu na histogramy H1 i H2
H = transpose(H);
H1 = H(1 : lm); H1 = H1/sum(H1); H1 = transpose(H1);
H2 = H(lm+1 : 256); H2 = H2/sum(H2);  H2 = transpose(H2);
H = transpose(H);

C1 = cumsum(H1);
C2 = cumsum(H2);

% przeksztalcenie LUT
C1n = (lm)*C1;
C2n = lm+1 + (255-lm+1)*C2;
lut = uint8([C1n; C2n]);

% operacja LUT
figure; imshow(intlut(I, lut)); title('Obraz po wykonaniu BBHE');
figure; imshow(histeq(I)); title('Obraz po wykonaniu HE');