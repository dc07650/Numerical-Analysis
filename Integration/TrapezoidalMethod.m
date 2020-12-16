%% Numerical Analysis MATLAB
% Author: Won Bin Choi (B3)
% E-mail: dc07650@naver.com
% Organization: Sogang University(Korea, Republic of), Mechanical Engineering
% Date: November 12, 2020
%% Initialize
close all; clear all; clc
syms f;
syms x;

f(x) = input("Target function: ");
while true
    a = input("Lower bound: ");
    b = input("Upper bound: ");
    if b>a
        break
    else
        disp("ERROR::Invalid range (Lower bound should be smaller than upper bound)");
    end
end
n = input("Number of intervals: ");

real = int(f, a, b);
%% Main loop
h = (b-a)./n;
x = a;
sum = f(x);
for i = 1:n-1
   x = x + h; 
   sum = sum + 2*f(x);
end
sum = sum + f(b);
trap = h*sum/2;

error = double(trap) - double(real);
%% Display
disp("Integration using Trapezoidal Method");
fprintf("Range: %.2f ~ %.2f \t Intervals: %d\n", a, b, n);
fprintf("Actual Value \t\t=\t %f\n", real);
fprintf("Integrated Value \t=\t %f\nError value(Approximated - Real) = %f\nError ratio(Error value/Real) = %f %%\n", trap, error, error./real*100);