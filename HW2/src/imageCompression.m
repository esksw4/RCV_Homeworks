clear all;
%choose different image
HarryPotter = imread('17n7t003puynzjpg.jpg');
HarryPotter1 = rgb2gray(HarryPotter);
HarryPotter2 = imresize(HarryPotter1, [200 NaN]);
figure(3);
subplot(1,4,1);
imshow(HarryPotter1);
title('original image');
[U,S,V] = svd(double(HarryPotter2));
N = 20;
R = zeros(200,150);
for i = 1:N
    R = R + U(:,i) * V(:,i)' * S(i,i);
end;
subplot(1,4,2);
imagesc(R);
fprintf('%s','N = 20 : ');
fprintf('%s%d','Storage requirement: 20*(200+150) = ', 20*(200+150));
N = 40;
R = zeros(200,150);
for i = 1:N
    R = R + U(:,i) * V(:,i)' * S(i,i);
end;
subplot(1,4,3);
imagesc(R);
fprintf('\n%s','N = 80 : ');
fprintf('%s%d','Storage requirement: 40*(200+150) = ', 40*(200+150));
N = 150;
R = zeros(200,150);
for i = 1:N,
    R = R + U(:,i) * V(:,i)' * S(i,i);
end;
subplot(1,4,4);
imagesc(R);
fprintf('\n%s','N = 150 : ');
fprintf('%s%d\r','Storage requirement: 150*(200+150) = ', 150*(200+150));
fprintf('%s','Result:');
fprintf(' %s %d%s\r\t\t%s%d%s\r','Compare to original picture: 300*225 =',
300*225,',', 'N = 80 storage reqruiement is ',80*(200+150), '.');
fprintf('\t\t%s%d%s\r','You can save about ', round(28000/67500*100), '% from the
original picture.');