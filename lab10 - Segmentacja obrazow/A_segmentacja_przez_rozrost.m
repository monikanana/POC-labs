clearvars;
close all;

I = imread('resources/knee.png');

imshow(I);

%[X,Y] = ginput(1);
%X = round(X);
%Y = round(Y);

X = 287; Y = 10; % co by przy testach nie klikac za kazdym razem

visited = zeros(size(I));
segmented = zeros(size(I));

stack = zeros(10000,2);

iStack = 1; % wskaznik na element na gorze stosu

% I krok 
stack(iStack,:) = [X,Y];
visited(X,Y) = 1;    % oznaczamy pixel jako odwiedzony
segmented(X,Y) = 1;  % oznaczamy puxel jako zaliczony do obiektu
iStack = iStack + 1;

[nrow, ncol] = size(I);

prog = 4;

while iStack > 1
    % pobranie wspolrzednych pixela ze stosu:
    a = stack(iStack-1,1);
    b = stack(iStack-1,2);
    
    % sprawdzenie czy dla wybranego pixela mozna okreslic kontekst o rozm.
    % 3x3 - czy ma wszystkich sasiadow
    if (a == 1 || b == 1 || a == nrow || b == ncol)
        iStack = iStack - 1;
        disp('ni');
        continue;
    end
    
    % petla po otoczeniu 3x3
    for i=-1:1
        for j=-1:1
            roznica_jasnosci = abs(I(a,b) - I(a+i,b+j)); % modul z roznicy jasnosci
            %  TODO zad 6
        end
    end    
        
    
    iStack = iStack - 1;
end
    