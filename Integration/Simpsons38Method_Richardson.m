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
while true
    n = input("Number of intervals (3k): ");
    if rem(n,3) == 0
        break
    else
        disp("ERROR::Invalid value (Input values in the multiple of three)")
    end
end

real = int(f, a, b);
trap = zeros(2,1);
%% Main loop
for j = 1:2
    nc = n*(power(2,j-1));
    h = (b-a)/(nc);
    x = a:h:b;
    sum = f(a);
    for i = 1:3:nc-3 % Indexing starts from 1 in Matlab
        sum = sum + 3*f(x(i+1)) + 3*f(x(i+2)) + 2*f(x(i+3));
    end
    sum = sum + 3*f(x(nc-2+1))+ 3*f(x(nc-1+1)) + f(x(nc+1));
    trap(j) = 3*h*sum/8;
end
richardson = 16/15 * trap(2) - 1/15 * trap(1);
error = double(richardson) - double(real);
%% Display
disp("Integration using Simpson's 3/8 Method with Richardson's Extrapolation");
fprintf("Range: %.2f ~ %.2f \t Intervals: %d\n", a, b, n);
fprintf("Actual Value \t\t=\t %f\n", real);
fprintf("Integrated Value \t=\t %f\nError value(Approximated - Real) = %f\nError ratio(Error value/Real) = %f %%\n", richardson, error, error./real*100);