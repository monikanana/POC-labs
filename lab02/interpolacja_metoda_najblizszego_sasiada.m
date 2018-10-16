clearvars;
close all;
clc;

%% parametry

I = imread('chessboard.bmp');
figure(1); imshow(I);

xReScale = 5.0;
yReScale = 5.0;

[YY,XX] = size(I);
nYY = floor(YY * yReScale);
nXX = floor(XX * xReScale);

nI = uint8(zeros(nYY,nXX));

%% algorytm

xStep=XX/nXX;
yStep=YY/nYY;

for ii=0:nYY-1
    i=round(ii*yStep);
    if i>YY-1
        i=YY-1;
    end
    for jj=0:nXX-1
        j=round(jj*yStep);
        if j>=XX-1
            j=XX-1;
        end
        nI(ii+1,jj+1)=I(i+1,j+1);
    end
end

figure(2); imshow(nI);
