close all;
clearvars;
clc;

load('resources/maskiPP');

I = imread('resources/jet.bmp');

%% detekcja krawedzi z pomoca gradientu Robertsa
figure(1);
subplot(1,3,1); imshow(I); title('oryginalny');
subplot(1,3,2); imshow(conv2(I, R1, 'same'),[]); title('detekcja krawedzi - gradient R1');
subplot(1,3,3); imshow(conv2(I, R2, 'same'),[]); title('detekcja krawedzi - gradient R2');

%% detekcja krawedzi z pomoca gradientu Prewitta
figure(2);
subplot(1,3,1); imshow(I); title('oryginalny');
subplot(1,3,2); imshow(conv2(I, P1, 'same'),[]); title('detekcja krawedzi - gradient P1 (pionowy)');
subplot(1,3,3); imshow(conv2(I, P2, 'same'),[]); title('detekcja krawedzi - gradient P2 (poziomy)');

%% detekcja krawedzi z pomoca gradientu Sobela
figure(3);
subplot(1,3,1); imshow(I); title('oryginalny');
subplot(1,3,2); imshow(conv2(I, S1, 'same'),[]); title('detekcja krawedzi - gradient S1 (pionowy)');
subplot(1,3,3); imshow(conv2(I, S2, 'same'),[]); title('detekcja krawedzi - gradient S2 (poziomy)');

%% zad 4
o1 = conv2(I, S1,'same');
o2 = conv2(I, S2,'same');

OW = sqrt(o1.^2 + o2.^2); % trudniejszy sposob
OW2 = abs(o1.^2 + o2.^2); % prostszy sposob

figure(4);
subplot(1,3,1); imshow(I); title('oryginalny');
subplot(1,3,2); imshow(OW, []); title('filtr kombinowany (pierwiastek z sumy)');
subplot(1,3,3); imshow(OW2, []); title('filtr kombinowany (suma modulow)');
