close all;
clear;
A = [4.19 2.2 5.51;
    5.20 10.11 -8.24;
    1.33 4.8 -6.52];
R = rref(A);
conJecture = rank(R);

% display the conjecture that matrix A have 3 linearly independent columns
fprintf('\n %s','#1: Conjecture');
fprintf('\n %s','The matrix A have three linearly independent columns ');
fprintf('%s %d %s\r', 'because the rank is ', conJecture,'.');