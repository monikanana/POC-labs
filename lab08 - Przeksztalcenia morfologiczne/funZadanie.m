function [ wynik ] = funZadanie( nhood )
    if(nhood(2,2))
        suma = sum(nhood(:))-1;
        wynik = (suma==2 || suma==3);
    end
    
    if(~nhood(2,2))
        suma = sum(nhood(:));
        wynik = (suma==3);
    end
end

