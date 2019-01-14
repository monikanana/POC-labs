close all;
clearvars;
clc;

I = imread('resources/ccl2.png');
figure(1); imshow(I, 'InitialMagnification', 300); title('Oryginalny');

I_after_4 = bwlabel(I, 4);
figure(2); imshow(I_after_4, 'InitialMagnification', 300); title('Po indeksacji z sasiedztwem 4-elementowym');

I_after_8 = bwlabel(I, 8);
figure(3); imshow(I_after_8, 'InitialMagnification', 300); title('Po indeksacji z sasiedztwem 8-elementowym');

I_diff = imabsdiff(I_after_4, I_after_8);
figure(4); imshow(I_diff, []); title('Roznica');