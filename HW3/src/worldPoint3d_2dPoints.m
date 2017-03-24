clear all;
close all;
clc;
pts = [2 0 0;
       3 0 0;
       3 1 0;
       2 1 0;
       2 0 1;
       3 0 1;
       3 1 1;
2 1 1;
       2.5 0.5 2];
for i = 1:9
    augmentPts(i,:) = [pts(i,:) 1];
end;
K = [-100 0 200;
     0 -100 200;
0 0 1];

% rotate about z-axis by angle 128
Rotation1_z = [cosd(128) -sind(128) 0 ;
               sind(128) cosd(128) 0 ;
0 0 1 ];
% rotate about y-axis by angle 10
Rotation1_y = [cosd(10) 0 sind(10);
               0 1 0;
               -sind(10) 0 cosd(10)];
% rotate about x-axis by angle 15
Rotation1_x = [1 0 0;
0 cosd(15) -sind(15);
               0 sind(15) cosd(15)];
Rotation1 = Rotation1_x*Rotation1_y * Rotation1_z;
translation1 = [10; 20; 15];
for i = 1:3;
   cTw1(i,:) = [Rotation1(i,:) translation1(i)];
end
for i = 1:9,
    kCameraCoordinate1(i,:) = K*cTw1*augmentPts(i,:)';
    twoDpoints1(i,1) = kCameraCoordinate1(i,1)/kCameraCoordinate1(i,3);
    twoDpoints1(i,2) = kCameraCoordinate1(i,2)/kCameraCoordinate1(i,3);
end;
figure(1);
drawmyobject(twoDpoints1);
title('Rotation: 15,10,128 Translation: 10,20,15');
% rotate about y-axis by angle 10
Rotation2_y = [cosd(10) 0 sind(10);
               0 1 0;
               -sind(10) 0 cosd(10)];
% rotate about x-axis by angle 15
Rotation2_x = [1 0 0;
               0 cosd(15) -sind(15);
               0 sind(15) cosd(15)];
% rotate about z-axis by angle 100
Rotation2_z_1 = [cosd(100) -sind(100) 0 ;
                 sind(100) cosd(100) 0 ;
0 0 1 ];
% rotate about z-axis by angle 137
Rotation2_z_2 = [cosd(137) -sind(137) 0 ;
                 sind(137) cosd(137) 0 ;
0 0 1 ];
% rotate about z-axis by angle 143
Rotation2_z_3 = [cosd(143) -sind(143) 0 ;
                 sind(143) cosd(143) 0 ;
0 0 1 ];
% rotate about z-axis by angle 150
Rotation2_z_4 = [cosd(165) -sind(165) 0 ;
                 sind(165) cosd(165) 0 ;
0 0 1 ];
% rotate about z-axis by angle 172
Rotation2_z_5 = [cosd(172) -sind(172) 0 ;
                 sind(172) cosd(172) 0 ;
0 0 1 ];
Rotation2_1 = Rotation2_x*Rotation2_y * Rotation2_z_1;
Rotation2_2 = Rotation2_x*Rotation2_y * Rotation2_z_2;
Rotation2_3 = Rotation2_x*Rotation2_y * Rotation2_z_3;
Rotation2_4 = Rotation2_x*Rotation2_y * Rotation2_z_4;
Rotation2_5 = Rotation2_x*Rotation2_y * Rotation2_z_5;
translation2 = [-4; -5; -5.5];
for i = 1:3;
   cTw2_1(i,:) = [Rotation2_1(i,:) translation2(i)];
   cTw2_2(i,:) = [Rotation2_2(i,:) translation2(i)];
   cTw2_3(i,:) = [Rotation2_3(i,:) translation2(i)];
   cTw2_4(i,:) = [Rotation2_4(i,:) translation2(i)];
   cTw2_5(i,:) = [Rotation2_5(i,:) translation2(i)];
end

for i = 1:9,
    kCameraCoordinate2_1(i,:) = K*cTw2_1*augmentPts(i,:)';
    twoDpoints2_1(i,1) = kCameraCoordinate2_1(i,1)/kCameraCoordinate2_1(i,3);
    twoDpoints2_1(i,2) = kCameraCoordinate2_1(i,2)/kCameraCoordinate2_1(i,3);
    kCameraCoordinate2_2(i,:) = K*cTw2_2*augmentPts(i,:)';
    twoDpoints2_2(i,1) = kCameraCoordinate2_2(i,1)/kCameraCoordinate2_2(i,3);
    twoDpoints2_2(i,2) = kCameraCoordinate2_2(i,2)/kCameraCoordinate2_2(i,3);
    kCameraCoordinate2_3(i,:) = K*cTw2_3*augmentPts(i,:)';
    twoDpoints2_3(i,1) = kCameraCoordinate2_3(i,1)/kCameraCoordinate2_3(i,3);
    twoDpoints2_3(i,2) = kCameraCoordinate2_3(i,2)/kCameraCoordinate2_3(i,3);
kCameraCoordinate2_4(i,:) = K*cTw2_4*augmentPts(i,:)';
    twoDpoints2_4(i,1) = kCameraCoordinate2_4(i,1)/kCameraCoordinate2_4(i,3);
    twoDpoints2_4(i,2) = kCameraCoordinate2_4(i,2)/kCameraCoordinate2_4(i,3);
    kCameraCoordinate2_5(i,:) = K*cTw2_5*augmentPts(i,:)';
    twoDpoints2_5(i,1) = kCameraCoordinate2_5(i,1)/kCameraCoordinate2_5(i,3);
    twoDpoints2_5(i,2) = kCameraCoordinate2_5(i,2)/kCameraCoordinate2_5(i,3);
end;
figure(2);
subplot(2,3,1);
drawmyobject(twoDpoints2_1);
title('Rotation: 15,10,100 Translation: 10,20,15');
subplot(2,3,2);
drawmyobject(twoDpoints2_2);
title('Rotation: 15,10,137 Translation: 10,20,15');
subplot(2,3,3);
drawmyobject(twoDpoints2_3);
title('Rotation: 15,10,143 Translation: 10,20,15');
subplot(2,3,4);
drawmyobject(twoDpoints2_4);
title('Rotation: 15,10,165 Translation: 10,20,15');
subplot(2,3,5);
drawmyobject(twoDpoints2_5);
title('Rotation: 15,10,172 Translation: 10,20,15');