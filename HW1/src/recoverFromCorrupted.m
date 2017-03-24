%% 6a: Read and display picture
clear;

cguitar=imread(sprintf('/Users/e.kim4/Documents/MATLAB/RCV_Homework/HW1/data/cguitar.tiff'));

figure(2)
subplot(1,2,1);
imshow(cguitar);
for i = 1:250
    for j = 1:50
        subImg(i,j) = cguitar(i,j);
    end
end
subImg = im2double(subImg);
ec = reshape(subImg,12500,1,[]);

%% 6b: Estimation of parameter: Linear Least Square Estimation
A = [];
x = [];
y = [];
for j= 1:250
    for i= 1:50
A = [A; j i 1];
    end
end
q = inv(A'*A)*(A')*ec;
% displaying results of estimated parameters
% a = -9.999702e-04
% b = -2.000256e-03
% c = 9.982459e-01
fprintf('\n %s','#6b: results of estimated parameters');
fprintf('\n    %2s %d\n    %2s %d\n    %2s %d\r','a = ', q(1), 'b = ',...
    q(2), 'c = ',q(3));
for x = 1:205
    for y = 1:511
        fxy(y,x) = q(1)*x + q(2)*y +q(3);
    end 
end

%% 6c: Displaying the original and corrected image
doublecguitar = im2double(cguitar);
subplot(1,2,2);
imshow(fxy.\doublecguitar)