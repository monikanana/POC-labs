close all;
clearvars;
clc;

image = imread('resources/plytkaSzumImp.bmp');
image_mediana = medfilt2(image,[7 7]);

kopia = image;

[X,Y] = size(image);

for x = 4:(X-4)
    for y = 4:(Y-4)
        flaga = 0;
        zxy = image(x,y);
		
        Smax = 1;
        a = 0;
        for n = (x-Smax):(x+Smax),
            a = a+1;
            b = 0;
            for m = (y-Smax) : (y+Smax),
                b = b+1;
                Macierz(a,b) = image(n,m);
            end;
        end;
        W = Macierz(:);
        zmin = min(W);
        zmax = max(W);
        zmed = median(W);
        
        if ((zmin < zmed) && (zmed < zmax))
            flaga = 1;
            if((zmin < zxy) && (zxy < zmax))
                kopia(x,y) = zxy;
            else
                kopia(x,y) = zmed;
            end
        else
            Smax = 2;
            a = 0;
        for n = (x-Smax) : (x+Smax),
            a = a+1;
            b = 0;
            for m = (y-Smax):(y+Smax),
                b = b+1;
                Macierz(a,b) = image(n,m);
            end;
        end;
        W = Macierz(:);
        zmin = min(W);
        zmax = max(W);
        zmed = median(W);  %5x5
        end;

               
        if ((zmin < zmed) && (zmed < zmax) && (flaga == 0))
            flaga = 1;
            if((zmin < zxy) && (zxy < zmax))
                kopia(x,y) = zxy;
            else
                kopia(x,y) = zmed;
            end
        else
            Smax = 3;
            a = 0;
        for n = (x-Smax):(x+Smax),
            a = a+1;
            b = 0;
            for m = (y-Smax):(y+Smax),
                b = b+1;
                Macierz(a,b) = image(n,m);
            end;
        end;
        
        W = Macierz(:);
        zmin = min(W);
        zmax = max(W);
        zmed = median(W);  %7x7 
    end;
        

    if ((zmin<zmed) && (zmed<zmax) && (flaga==0))
        flaga=1;
               if((zmin < zxy) && (zxy < zmax))
                   kopia(x,y) = zxy;
               else
                   kopia(x,y) = zmed;
               end;
    elseif(flaga==0)
        kopia(x,y) = zmed;
    end;
        
    end;
end;


%% wyswietlenie wynikow

subplot(1,3,1); imshow(image); title('Obraz oryginalny');
subplot(1,3,2); imshow(image_mediana); title('Obraz przefiltrowany filtrem medianowym');
subplot(1,3,3); imshow(kopia); title('Obraz przefiltrowany filtrem adaptacyjnym');
