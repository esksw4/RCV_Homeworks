close all;
clear;
n = 4;
%choose any picture
hp = imread('hpworld.png');
doublehp = im2double(hp);
figure(1);
subplot(1,2,1)
hold on;
imshow(hp);
[xprime,yprime] = ginput(n);
[n,g] = size(xprime);
x = [160 300 160 300];
y = [260 260 560 560];
marker = insertMarker(hp, [xprime,yprime],'x');
imshow(marker);
hold off;
A = zeros(8,9);
for i = 1:n
    A(2*i-1, :) = [x(i) y(i) 1 0 0 0 -x(i)*xprime(i) -y(i)*xprime(i) -xprime(i)];
    A(2*i, :) = [0 0 0 x(i) y(i) 1 -x(i)*yprime(i) -y(i)*yprime(i) -yprime(i)];
end;
h = null(A);
[regimg] = homogwarp(doublehp, doublehp, h);
subplot(1,2,2);
imshow(regimg);