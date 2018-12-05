close all;
clearvars;

figure(1);
I_org = imread('resources/kwadraty.png');

subplot(2,2,1); imshow(I_org); title('oryginal');

I = edge(I_org, 'sobel');
subplot(2,2,2); imshow(I); title('krawedzie');

[H, T, R] = hough(I);
subplot(2,2,3); imshow(H, []); title('macierz Hougha');

P = houghpeaks(H, 8);
subplot(2,2,4); hold on; plot(P(:,1), P(:,2), 'o'); title('maksima');


%% zad 10 
% Find lines and plot them
       lines = houghlines(I,T,R,P,'FillGap',5,'MinLength',7);
       figure(2); imshow(I_org), hold on
       max_len = 0;
       for k = 1:length(lines)
         xy = [lines(k).point1; lines(k).point2];
         plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
 
         % plot beginnings and ends of lines
         plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
         plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
 
         % determine the endpoints of the longest line segment 
         len = norm(lines(k).point1 - lines(k).point2);
         if ( len > max_len)
           max_len = len;
           xy_long = xy;
         end
       end
 
       % highlight the longest line segment
       plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');