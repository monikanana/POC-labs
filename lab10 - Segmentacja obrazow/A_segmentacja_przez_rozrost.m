close all; clearvars; clc;

I = imread('resources/knee.png');
I = double(I);
H = fspecial('gaussian',10,10); 
I = imfilter(I,H);

figure(1);
subplot(1,2,1);
imshow(uint8(I));


%[x,y] = ginput;
%x = floor(x);
%y = floor(y);

x = 340;
y = 220;

visited = zeros(size(I));
segmented = zeros(size(I));

stos = zeros(1000,2);
is = 1;

stos(is,:) = [x,y];

visited(x,y) = 1;
segmented(x,y) = 1;

[sx,sy] = size(I);
prog = 30;
mV = 0;
nS = 0;

mVnSi = 0;

while (is >= 1)
   
    P = stos(is,:);
    
    nS = nS + 1;
    mVnSi = mVnSi + I(P(1),P(2));
    mV = mVnSi/nS;
   
    if (P(1) > 1 && P(1) < sx && P(2) > 1 && P(2) < sy)
        for i = -1:1
           for j = -1:1
               Px = P(1) + i;
               Py = P(2) + j;
               dys = abs(mV - I(Px,Py));
               if (dys < prog && visited(Px,Py) ~= 1)
                   segmented(Px,Py) = 1;
                   stos(is,:) = [Px, Py];
                   is = is + 1;
               end
               visited(Px,Py) = 1;
           end
        end
    end
    is = is - 1;
    
end

subplot(1,2,2);
imshow(segmented);