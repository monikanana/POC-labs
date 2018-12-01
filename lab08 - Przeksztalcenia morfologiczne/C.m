close all;
clearvars;
clc;

I = imread('resources/ferrari.bmp');

SE = strel('square', 3);

I_eroded = imerode(I, SE);
I_dilated = imdilate(I, SE);

figure(1);
subplot(5,2,1); imshow(I); title('oryginalny');
subplot(5,2,2); imshow(I_eroded); title('po erozji');
subplot(5,2,3); imshow(I_dilated); title('po dylatacji');
subplot(5,2,4); imshow(imabsdiff(I_dilated, I_eroded)); title('roznica');
subplot(5,2,5); imshow(imclose(imopen(I, SE), SE)); title('otwarcie + zamkniecie');
subplot(5,2,6); imshow(imtophat(I, SE)); title('top-hat');
subplot(5,2,7); imshow(imbothat(I, SE)); title('bottom-hat');

I = imread('rice.png');

figure(2);
subplot(2,1,1); imshow(I); title('oryginalny');
subplot(2,1,2); imshow(imtophat(I, strel('disk', 10))); title('top-hat ("disk", 10)');