function [ wynik ] = funE( nhood )
    wynik = nhood(2,2) & (sum(nhood(:)) == 2);
    % nhood(2,2)    - srodkowy pixel z otoczenia
    % sum(nhood(:)) - suma wartosci wszystkich sasiadow i siebie samego
end

