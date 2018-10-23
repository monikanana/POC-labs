clearvars;
close all;
clc;

%% parametry
I = imread('chessboard.bmp');
figure(1); imshow(I);

I=double(I); % przekształcenie z uint8 na double

xReScale = 5;
yReScale = 5;

[YY,XX] = size(I);
nYY = floor(YY * yReScale);
nXX = floor(XX * xReScale);

nI = double(zeros(nYY,nXX));

%% algorytm

xStep=XX/nXX;
yStep=YY/nYY;

for ii=0:nYY-2
    
    % wspolrzedne y dla A,B,C,D
    ay=floor(ii*yStep);
    
    if ay>YY-2
        ay=YY-2;
    end
    
    by=ay+1;
    cy=ay+1;
    dy=ay;
    
    for jj=0:nXX-2
        
        % wspolrzedne x dla A,B,C,D
        ax=floor(jj*xStep);
        
        if ax>=XX-2
            ax=XX-2;
        end
        
        bx=ax;
        cx=ax+1;
        dx=ax+1;
        
        i=ii*yStep-ay;
        j=jj*xStep-ax;
        
        % podstawiam znalezione wspolrzedne do wzoru
        nI(ii+1, jj+1)=[1-i i]*[I(ay+1,ax+1) I(dy+1,dx+1); I(by+1,bx+1) I(cy+1,cx+1)]*[1-j;j];
    end
end

figure(2); imshow(uint8(nI));