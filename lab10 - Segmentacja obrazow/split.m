function split(I,x1,y1,x2,y2)

    global odchylenieLimit podzialLimit segRes index MRes

    obszar = I(y1:y2, x1:x2);
    srednia = mean(obszar(:));
    odchylenie = std(obszar(:));

    if (odchylenie >= odchylenieLimit || abs(x2 - x1) > podzialLimit)
        % niejednorodny obszar - podzial na czesci
        rozmiarX = floor((x2 - x1)/2); % rozmiar x podobszaru
        rozmiarY = floor((y2 - y1)/2); % rozmiar y podobszaru

        split(I, x1, y1, x1+rozmiarX, y1+rozmiarY);
        split(I, x1+rozmiarX+1, y1, x2, y1+rozmiarY);
        split(I, x1, y1+rozmiarY+1, x1+rozmiarX, y2);
        split(I, x1+rozmiarX+1, y1+rozmiarY+1, x2, y2);
    else
        % obszar jest jednorodny
        index = index + 1;
        segRes(y1:y2,x1:x2) = index;
        MRes(y1:y2,x1:x2) = srednia;
    end
end

