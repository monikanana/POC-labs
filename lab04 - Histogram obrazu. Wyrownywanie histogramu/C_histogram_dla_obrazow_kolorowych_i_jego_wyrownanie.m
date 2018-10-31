clearvars;
close all;
clc;

%% zad 1
img = imread('resources/lenaRGB.bmp');

imgR = img(:,:,1);
imgG = img(:,:,2);
imgB = img(:,:,3);

figure(1);
subplot(15,1,1:3); imhist(imgR); title('składowa RED');
subplot(15,1,6:9); imhist(imgG); title('składowa GREEN');
subplot(15,1,12:15); imhist(imgB); title('składowa BLUE');

%% zad 2
imgEQ = img;
imgEQ(:,:,1) = histeq(imgR);
imgEQ(:,:,2) = histeq(imgG);
imgEQ(:,:,3) = histeq(imgB);

figure(2); imshow(imgEQ);

%% zad 3
imgHSV = rgb2hsv(img);

hsvH = imgHSV(:,:,1);
hsvS = imgHSV(:,:,2);
hsvV = imgHSV(:,:,3);

figure(3);
subplot(15,1,1:3); imhist(hsvH); title('składowa H');
subplot(15,1,6:9); imhist(hsvS); title('składowa S');
subplot(15,1,12:15); imhist(hsvV); title('składowa V');

% wyrownanie histogramu skladowej V 
hsvV_eq = histeq(hsvV, 256);

hsvV = hsvV_eq;

figure(4);
subplot(15,1,1:3); imhist(hsvH); title('składowa H');
subplot(15,1,6:9); imhist(hsvS); title('składowa S');
subplot(15,1,12:15); imhist(hsvV); title('składowa V');

% rezultat po wyrownaniu skladowej V
hsv_after_eq_V(:,:,1) = hsvH;
hsv_after_eq_V(:,:,2) = hsvS;
hsv_after_eq_V(:,:,3) = hsvV;

figure(5);
imshow(hsv2rgb(hsv_after_eq_V));

