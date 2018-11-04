clc;
clearvars;
close all;

%% zad 2-7
I = imread('resources/rice.png');
[X, Y] = size(I);
I_BW = I;

window = 15; % przyjecie podane w zadaniu
W2 = floor(window/2);

addpath('./resources');
for i = 1:X
    for j = 1:Y
        BW = meanLT(i,j,W2,I,X,Y);
        if I_BW(i,j) > BW
            I_BW(i,j) = 255;
        else
            I_BW(i,j) = 0;
        end
    end 
end

figure;
subplot(2,1,1); imshow(I); title('obraz oryginalny');
subplot(2,1,2); imshow(I_BW); title('obraz zbinaryzowany lokalnie');

%% zad 8-12