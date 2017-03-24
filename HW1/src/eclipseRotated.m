clear;
a = 5;
b = 100;
t = 0:0.01:10;
x = a*cos(t);
y = b*sin(t);
figure(3);
subplot(1,3,1)
plot(x,y,'-*');
title('Points in an ellipse');
cc = cos(pi/3);
ss = sin(pi/3);
R = [cc ss;
     -ss cc];
pts = [x;
       y];
rpts = R*pts;
subplot(1,3,2);
plot(rpts(1,:), rpts(2,:),'*-');
title('Points in a rotated ellipse');
[U,sigma,V] = svd(rpts);
 ans1 = atan(U(2,1)/U(1,1));
 ans2 = atan(U(2,2)/U(1,2));
 ans = [ans1 -ans2; ans2 ans1];
 newrpts = ans*pts;
 subplot(1,3,3)
 plot(newrpts(1,:), newrpts(2,:),'*-');
 axis([-100 100 -60 60]);
title('Results');