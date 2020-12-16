%% Numerical Analysis MATLAB
% Author: Won Bin Choi (B3)
% E-mail: dc07650@naver.com
% Organization: Sogang University(Korea, Republic of), Mechanical Engineering
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
    h = input("Input grid space, h: ");
    xi = 0:h:2;
    dphi = zeros(n, length(xi));
    error = zeros(n, length(xi));
    
    %% Calculation using extrapolation (Two Point Forward)
    for i = 1:1:n
        disp(sprintf("%d) h = %f",i, h));
        for j = 1:1:length(xi)
            dphi(i,j) = (f(h+xi(j)) - f(-1*h+xi(j)))/(2*h);
            real = df(xi(j));
            error(i, j) = real - dphi(i, j);
        end
        h = h * (1/2);
    end
    
    %% Calculate average error
    avgError = zeros(n,1);
   
    for i = 1:1:n
    temp = 0;
       for j = 1:1:length(xi)
           temp = temp + error(i,j);
       end
       avgError(i) = temp ./ length(xi);
    end
    
    %% Display results
    
     disp('Centered Difference Derivation')
     disp('h and 1/2*h');
     disp(sprintf('phi(h),      h - average error: %f',double(avgError(1))));
     disp(sprintf('phi(h),  1/2*h - average error: %f',double(avgError(2))));
     disp(sprintf('Calculated Error Reduction Ratio: %f %%',double(100*avgError(2)/avgError(1))));
     disp('Ideal Error Reduction Ratio: 25 %');
     disp('');
     disp('Centered Difference Derivation')
     disp('h and 1/4*h');
     disp(sprintf('phi(h),      h - average error: %f',double(avgError(1))));
     disp(sprintf('phi(h),  1/4*h - average error: %f',double(avgError(3))));
     disp(sprintf('Calculated Error Reduction Ratio: %f %%',double(100*avgError(3)/avgError(1))));
     disp('Ideal Error Reduction Ratio: 6.25 %');
     
    %% Termination checkpoint
    comm = input("\nTerminate? (y/n): ", 's');
    if (comm == 'y')||(comm == 'Y')
        break;
    end
    clc;
end

