close all;
clearvars;

figure('units','normalized','outerposition',[0 0 1 1]);
I_org = imread('resources/lab112.png'); 
subplot(1,4,1); imshow(I_org); title('oryginalny');

%% rozmycie
filtr = fspecial('average', 10);
I = uint8(conv2(I_org, filtr, 'same'));
subplot(1,4,2); imshow(I); title('po rozmyciu');

%% binaryzacja 
I = im2bw(I, 35/255);
subplot(1,4,3); imshow(I); title('po binaryzacji');

%% czyszczenie krawedzi
I = not(I); % bo imclearborder() szuka JASNIEJSZYCH elementow na obrazie
I = imclearborder(I);
subplot(1,4,4); imshow(I); title('po zanegowaniu i wyczyszczeniu krawedzi');

%% wykrycie krawedzi
I = not(I);
I = edge(I, 'sobel');
figure(); imshow(I); title('po wykryciu krawedzi z parametrem sobel');