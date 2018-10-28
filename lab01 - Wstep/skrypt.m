clear;
close all;

imfinfo('0_Wstep/lena.jpg')
imfinfo('0_Wstep/lena.bmp')

lena_jpg = imread('0_Wstep/lena.jpg');
lena_bmp = imread('0_Wstep/lena.bmp');

figure(1)
imshow(lena_jpg);

figure(2)
imshow(lena_bmp);

figure(3)
lena_gray = rgb2gray(lena_bmp);
imshow(lena_gray)
imwrite(lena_gray, 'lena_gray.bmp') % zad 8

% zad 9
figure(4)
colormap gray;
mesh(lena_gray)

plot(lena_gray(10,:)); % (numer_wiersza, numer_kolumny)

figure(5)
plot(lena_gray(5,:));

figure(6)
plot(lena_gray(:,14));






