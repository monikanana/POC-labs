clearvars;
close all;
clc;

kolo = boolean(imread('resources/kolo.bmp'));
kwadrat = boolean(imread('resources/kwadrat.bmp'));

figure(1);
subplot(1,2,1); imshow(kolo);
subplot(1,2,2); imshow(kwadrat);

figure(2);
subplot(2,2,1);
imshow(~kolo);
title("NOT kolo");

subplot(2,2,2);
imshow(kolo & kwadrat);
title("kolo AND kwadrat");

subplot(2,2,3);
imshow(kolo | kwadrat);
title("kolo OR kwadrat");

subplot(2,2,4);
imshow(xor(kolo, kwadrat));
title("kolo XOR kwadrat");

