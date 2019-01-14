function [I_z_kwadratami] = C_wykrycie_kwadratow(I)

    I_po_indeksacji = bwlabel(I, 4);
    addpath('./resources/');

    r = regionprops(I_po_indeksacji,'Centroid');
    for i=1:length(r)
       text(r(i).Centroid(1),r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
    end

    wspolczynniki = obliczWspolczynniki(I_po_indeksacji);

    % wykrycie kwadratow
    [ksztalt, wspolczynnik] = size(wspolczynniki);
    indeksy_kwadratow = zeros(ksztalt);

    for i=1:ksztalt
        if wspolczynniki(i,1)>0.5 && wspolczynniki(i,1)<=1 % odrzucenie wiekszosci krzyzykow
            if wspolczynniki(i,2)>0.7 && wspolczynniki(i,2)<0.85 % odrzucenie kol i krzyzyka 
                indeksy_kwadratow(i) = i;
            end
        end
    end
    %indeksy_kwadratow = nonzeros(indeksy_kwadratow);

    I_z_kwadratami = I_po_indeksacji;
    [X,Y] = size(I_po_indeksacji);

    for i=2:(X-1)
        for j=2:(Y-1)
            if I_z_kwadratami(i,j) ~= 0
                I_z_kwadratami(i,j) = indeksy_kwadratow(I_z_kwadratami(i,j));
            end
        end
    end
end

