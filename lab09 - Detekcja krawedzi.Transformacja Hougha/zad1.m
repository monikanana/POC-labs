clear;
clc;
close all;


I = imread('resources/dom.png');

%% Detection LoG

detection1 = edge(I, 'log', 0.006);
figure(1);
imshow(detection1); title('LoG');

%% Detection Canny

detection2 = edge(I, 'canny', 0.2);
figure(2);
imshow(detection2); title('canny');

%% Detection sobel
detection3 = edge(I, 'sobel', 0.13);
figure(3);
imshow(detection3); title('sobel');