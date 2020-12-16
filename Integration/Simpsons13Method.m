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
    n = input("Number of intervals (2k): ");
    if rem(n,2) == 0
        break
    else
        disp("ERROR::Invalid value (Input values in the multiple of two)")
    end
end

real = int(f, a, b);
%% Main loop
h = (b-a)/n;
x = a:h:b;
sum = f(a);
for i = 1:2:n-2 % Indexing starts from 1 in Matlab
   sum = sum + 4*f(x(i+1)) + 2*f(x(i+2));   
end
sum = sum + 4*f(x(n-1+1))+f(x(n+1));
trap = h*sum/3;

error = double(trap) - double(real);
%% Display
disp("Integration using Simpson's 1/3 Method");
fprintf("Range: %.2f ~ %.2f \t Intervals: %d\n", a, b, n);
fprintf("Actual Value \t\t=\t %f\n", real);
fprintf("Integrated Value \t=\t %f\nError value(Approximated - Real) = %f\nError ratio(Error value/Real) = %f %%\n", trap, error, error./real*100);