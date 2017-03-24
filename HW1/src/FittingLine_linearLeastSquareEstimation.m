close all;
clear;
x = [0 1 1 3 3 5];
y = [1 3.2 5 7.2 9.3 11.1];
A = [];
B = [];
for i = 1:6
    A = [A; x(i) 1];
    B = [B; y(i)];
end
AtA = A'*A;
estimate = inv(AtA)*A'*B;
yfit = estimate(1)*x + estimate(2);
figure(1)
subplot(1,2,1)
plot(x,y,'o');
subplot(1,2,2)
plot(x, yfit, 'r');