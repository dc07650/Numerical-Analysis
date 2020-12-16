%% Numerical Analysis MATLAB
% Author: Won Bin Choi (B3)
% E-mail: dc07650@naver.com
% Organization: Sogang University(Korea, Republic of), Mechanical Engineering
% Date: September 10, 2020

%% Initialize
clear all; close all; clc;
syms f; syms x;
%% Set parameters
f(x) = ((9.8*68.1)/x)*(1-exp((-x*10)/(68.1)))-40
%f(x) = 2*x + 1
df(x) = diff(f(x))
es = 0.00001; % Allowed error size
x0 = input("Input starting point: "); %% Derivation point
xi = x0;
%% Main function (Newton Raphson Method)
while true
   xii = xi - (f(xi))/(df(xi));
   if abs(f(xii)) < es
      break
   else
       xi = xii;
   end
end
%% Output
disp("The approximated root utilizing the Newton Raphson's Method is:")
disp(double(xii));
