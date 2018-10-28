clearvars;
close all;
clc;

%% I etap zadania - dekompozycja

img = imread('resources/100zloty.jpg');
I = rgb2gray(img);

% b1 - tablica najmniej znacz?cych bitów warto?ci I, b8 - najbardziej
% znacz?cych
b1 = double(bitget(I,1));
b2 = double(bitget(I,2)); 
b3 = double(bitget(I,3)); 
b4 = double(bitget(I,4)); 
b5 = double(bitget(I,5)); 
b6 = double(bitget(I,6)); 
b7 = double(bitget(I,7)); 
b8 = double(bitget(I,8)); 

figure(1);
subplot(3,3,1); imshow(I); title('Obraz uint8');
subplot(3,3,2); imshow(b1); title('1. bit (najmniej znaczacy)');
subplot(3,3,3); imshow(b2); title('2. bit');
subplot(3,3,4); imshow(b3); title('3. bit');
subplot(3,3,5); imshow(b4); title('4. bit');
subplot(3,3,6); imshow(b5); title('5. bit');
subplot(3,3,7); imshow(b6); title('6. bit');
subplot(3,3,8); imshow(b7); title('7. bit');
subplot(3,3,9); imshow(b8); title('8. bit (najbardziej znaczcy)');


%% II etap zadania - rekonstrukcja

I_bin = uint8(cat(8,b1,b2,b3,b4,b5,b6,b7,b8));

% zamiana warto?ci binarnych na uint8
b1 = I_bin(:,:,1);
b2 = I_bin(:,:,2)*2;
b3 = I_bin(:,:,3)*4;
b4 = I_bin(:,:,4)*8;
b5 = I_bin(:,:,5)*16;
b6 = I_bin(:,:,6)*32;
b7 = I_bin(:,:,7)*64;
b8 = I_bin(:,:,8)*128;

figure(2);
imshow(b8+b7);  title('b8+b7');

figure(3);
imshow(b8+b7+b6+b5+b4); title('b8+b7+b6+b5+b4');