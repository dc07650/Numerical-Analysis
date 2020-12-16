%% Numerical Analysis MATLAB
% Author: Won Bin Choi (B3)
% E-mail: dc07650@naver.com
% Organization: Sogang University(Korea, Republic of), Mechanical Engineering
% Date: November 12, 2020
%% Initialize
close all; clear all; clc
syms f;
syms x;
syms y;
f(x, y) = input("Target function: ");
while true
    xa = input("Lower bound, x: ");
    xb = input("Upper bound, x: ");
    if xb>xa
        break
    else
        disp("ERROR::Invalid range (Lower bound should be smaller than upper bound)");
    end
end
while true
    ya = input("Lower bound, y: ");
    yb = input("Upper bound, y: ");
    if yb>ya
        break
    else
        disp("ERROR::Invalid range (Lower bound should be smaller than upper bound)");
    end
end

xn = input("Number of intervals of x-axis: ");
yn = input("Number of intervals of y-axis: ");


%% Main loop
hx = (xb - xa)/(xn);
hy = (yb - ya)/(yn);
tx = xa:hx:xb;
ty = ya:hy:yb;
temp = f(tx, ty(1));
for i = 2:yn+1
    temp = vertcat((f(tx, ty(i))),temp);
end
temp = flipud(temp);
cashe = 0;
for j = 1:xn
    for k = 1:yn
        cashe = cashe + (hx*hy/4)*(temp(k,j)+temp(k+1,j)+temp(k,j+1)+temp(k+1,j+1));
    end
end
disp(cashe);
%% Display
% disp("Integration using Trapezoidal Method");
% fprintf("Range: %.2f ~ %.2f \t Intervals: %d\n", a, b, n);
% fprintf("Actual Value \t\t=\t %f\n", real);
% fprintf("Integrated Value \t=\t %f\nError value(Approximated - Real) = %f\nError ratio(Error value/Real) = %f %%\n", trap, error, error./real*100);