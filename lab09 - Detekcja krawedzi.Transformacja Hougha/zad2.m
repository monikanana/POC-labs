clearvars;
close all;
clc;

obraz = zeros(11,11);

%% jeden punkt
obraz(6,6) = 1;

figure(1);

subplot(3,2,1); imshow(obraz); title('oryginal (1 punkt)');

[H, T, R] = hough(obraz,'RhoResolution',0.1,'ThetaResolution',0.5);
subplot(3,2,2); imshow(H, []); title('Przestrze Hougha dla 1 punktu');

%% dwa punkty
obraz(2,2) = 1;
obraz(8,8) = 1;
subplot(3,2,3); imshow(obraz); title('oryginal (3 punkty)');

[H, T, R] = hough(obraz,'RhoResolution',0.1,'ThetaResolution',0.5);
subplot(3,2,4); imshow(H, []); title('Przestrze Hougha dla 3 punktow');

% zad 8 - 9
X = 1; Y = 73;
ro = R(Y);
teta = T(X);

x = 0:0.1:10;
y = (ro - x * cosd(teta)) / sind(teta);
subplot(3,2,5); imshow(obraz); hold on; plot(x+1,y+1);
