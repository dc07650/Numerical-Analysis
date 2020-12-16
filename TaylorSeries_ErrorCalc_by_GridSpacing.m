% Author: Choi Won Bin (20171899)
% E-mail: dc07650@naver.com
% Organization: Sogang University, Mechanical Engineering
% Date: September 10, 2020

%% Initialization
clear all; close all; clc
syms x;
n = 3; % Number of grid space utilized

%% Input original function
func = input("Input function: ", 's');
f(x) = str2sym(func);
df(x) = diff(f(x));

%% Main Loop
while true
    %% Initialization
    disp("Extrapolation of Derivation")
    disp(f)
    dphi = zeros(1,n);
    h = input("Input grid space, h: ");
    xi = input("Input passing point, x_0: ");
   
    %% Calculation using extrapolation (Two Point Forward)
    for i = 1:1:n
        disp(h)
        dphi(i) = (f(h+xi) - f(-1*h+xi))/(2*h);
        h = h * (1/2);
    end
    
    %% Error calculation with the approximated value
    real = df(xi);
    error = zeros(1,n);
    
    for i = 1:1:n
        approx = dphi(i);
        error(i) = real - approx;
    end
    
    %% Display results
    disp(horzcat('df(x): ',num2str(double(df(xi)))));
    disp(' ')
    disp('Centered Difference Derivation')
    disp('h and 1/2*h');
    disp(sprintf('phi(h),     h: %f \t error: %f \t error ratio: %f %%',double(dphi(1)),double(error(1)),double(100*error(1)/real)));
    disp(sprintf('phi(h), 1/2*h: %f \t error: %f \t error ratio: %f %%',double(dphi(2)),double(error(2)),double(100*error(2)/real)));
    disp(sprintf('Calculated Error Reduction Ratio: %f %%',double(100*error(2)/error(1))));
    disp('Ideal Error Reduction Ratio: 25 %');
    disp(' ');
    disp('h and 1/4*h');
    disp(sprintf('phi(h),     h: %f \t error: %f \t error ratio: %f %%',double(dphi(1)),double(error(1)),double(100*error(1)/real)));
    disp(sprintf('phi(h), 1/4*h: %f \t error: %f \t error ratio: %f %%',double(dphi(3)),double(error(3)),double(100*error(3)/real)));
    disp(sprintf('Calculated Error Reduction Ratio: %f %%',double(100*error(3)/error(1))));
    disp('Ideal Error Reduction Ratio: 6.25 %');
    
    %% Termination checkpoint
    comm = input("\nTerminate? (y/n): ", 's');
    if (comm == 'y')||(comm == 'Y')
        break;
    end
    clc;
end

