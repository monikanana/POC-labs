close all;
clearvars;

figure(1);
I_org = imread('resources/lab112.png'); 

subplot(2,2,1); imshow(I_org); title('oryginalny');

filtr = fspecial('average', [9 19]);
I = uint8(conv2(I_org, filtr, 'same'));

I = imbinarize(I, 35/255);
I = not(I);

I = imclearborder(I);

I = edge(I, 'sobel', 0.06);
subplot(2,2,2); imshow(I); 











