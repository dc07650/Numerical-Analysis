%% Numerical Analysis MATLAB
% Author: Won Bin Choi (B3)
% E-mail: dc07650@naver.com
% Organization: Sogang University(Korea, Republic of), Mechanical Engineering
% Date: November 12, 2020

%% Initialization
close all; clear all; clc;
x = [1 2 3 5 7 8];
y = [5 8 19 100 290 390];
n = length(x);

syms xx; syms product;
syms sum; syms lagrng;

%% Lagrange Interpolation
sum = 0;
for i = 1:n
   product = y(i);
   for j = 1:n
      if i ~= j
         product = product*(xx-x(j))/(x(i)-x(j));
      end
   end
   sum = sum + product;
end
lagrng(xx) = sum;

%% Plot function and coordinates & Results
hold on;
scatter(x, y);
t = linspace(0,10,100);
plot(t, lagrng(t));
grid on; legend("Data Points","Interpolated Function", 'Location', 'northwest');
title("Interpolation with Lagrange Interpolating Polynomials");
xlabel("x_i"); ylabel("f(x_i)");
hold off;

fprintf("Interpolated value at x = 4: %f\n", double(lagrng(4)));