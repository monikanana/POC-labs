close all;
clearvars;
clc;

I = imread('resources/ccl1.png');
figure(1); imshow(I); title('Oryginal');

[sizeX, sizeY] = size(I);
etykiety = zeros(sizeX, sizeY);

L = 1;

id = 1:100

for x=2:sizeX           % wiersze
    for y=2:(sizeY-1)   % kolumny
        if I(x,y) ~= 0
            
            sasiedzi = [I(x-1,y-1) I(x-1,y) I(x-1,y+1) I(x, y-1)];
            suma = sum(sasiedzi);
            
            if suma == 0
                I(x,y) = L;
                L = L+1;
                display(L);
            elseif suma > 0
                sasiedzi = nonzeros(sasiedzi);
                minimum = min(sasiedzi);
                maximum = max(sasiedzi);
                
                if minimum == maximum
                    I(x,y) = minimum; % (b)
                else
                    I(x,y) = minimum; % (c)
                    id = union(minimum, maximum, id);
                end
     
            end 
        end
    end
end

figure(2); imshow(label2rgb(I)); title('Po pierwszym przebiegu indeksacji');
figure(3); imshow(imread('resources/ccl1Result.png')); title('ccl1Result.png');


% zad2

lut = id;

for i = 1:numel(id) % numel - ilosc elementow w tablicy
    lut(i) = root(i, id);
end

I2 = I;

for x = 2:sizeX
    for y = 2:sizeY-1
        if I(x,y) > 0
            I2(x,y) = lut(I(x,y));
        end
    end
end

figure(4); imshow(label2rgb(I2)); title('Po drugim przebiegu indeksacji');
