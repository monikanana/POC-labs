close all; clearvars; clc;

global odchylenieLimit podzialLimit segRes index MRes

I = imread('resources/umbrealla.png');
I_HSV = rgb2hsv(I);
I_H = double(I_HSV(:,:,1));

odchylenieLimit = 0.05;
podzialLimit = 8;
[sizeX,sizeY] = size(I_H);
segRes = zeros(sizeX, sizeY);
index = -1;
MRes = zeros(sizeX, sizeY);

split(I_H, 1, 1, sizeX, sizeY);

prog_kolorow = 5/255;

i = 0;
while i <= index
    IB = segRes == i;
    
    if any(IB(:))
       [yF, xF] = find(IB, 1, 'first');
       IB_dilate = imdilate(IB, strel('square',3));
       IB_diff = imabsdiff(IB_dilate,IB);
       IB_mult = IB_diff.*segRes;
       IB_mult_non_zeros = nonzeros(IB_mult);
       IB_unique = unique(IB_mult_non_zeros);
       joined = 0; 
       
       for k = 1:numel(IB_unique)
           IBS = segRes == IB_unique(k);
           [yFS, xFS] = find(IBS,1,'first');
            
           color_difference = abs(MRes(yF,xF) - MRes(yFS, xFS));
           if color_difference < prog_kolorow
               segRes(IBS) = i;
               joined = 1;
           end
       end
       
       if joined == 0
           i = i +1;
       end
    else
        i = i + 1;
    end
end

minimalny_rozmiar_obszaru = 33;
minimalny_rozmiar_obrazu = 8;

segRes_unique = unique(segRes);
for i = 1:numel(segRes_unique)
    obszar = segRes == segRes_unique(i);
    if sum(obszar) < minimalny_rozmiar_obszaru
        segRes(obszar) = 0;
    end
end

segRes_unique_2 = unique(segRes);
for i = 1:numel(segRes_unique_2)
    obszar = segRes == segRes_unique_2(i);
    segRes(obszar) = i;
end

I_final = label2rgb(segRes);
subplot(2,1,1); imshow(I); title('Oryginalny');
subplot(2,1,2); imshow(I_final); title('Po segmentacji');




