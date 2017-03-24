clear all;
n = 12;

%can choose any mp4 file
video = VideoReader('Christmas_Santa_Sleigh_Motion_Background_4K.mp4');
video1 = read(video, 20);
video1 = rgb2gray(video1);
video2 = read(video, 21);
video2 = rgb2gray(video2);

figure(2);
subplot(2,2,1);
imshow(video1);
[x1,y1] = ginput(n);
roundx1 = round(x1);
roundy1 = round(y1);
title('Original picture 1');

subplot(2,2,2);
imshow(video2);
[x2,y2] = ginput(n);
roundx2 = round(x2);
roundy2 = round(y2);
title('Original picture 2');

A = zeros(n*2,6);
for i = 1:n
    bu = roundx1 - roundx2;
    bv = roundy1 - roundy2;
end;
buv = [bu; -bv];
for i = 1:n
    A(2*i-1,:) = [x1(i) y1(i) 1 0 0 0 ];
    A(2*i, :) = [0 0 0 x1(i) y1(i) 1];
end;
q = inv(A'*A)*A'*buv;
[outimg] = affinewarp_fastersolution(size(video1),double(video1),q);
subplot(2,2,3);
image(outimg);
title('Output Image');

fprintf('%s','The output image might be little bit off because you are choosing xprime and yprime manually');
differentiation1 = outimg - double(video1);
subplot(2,2,4);
imagesc(differentiation1);
title('Differentiation');
colormap('gray');