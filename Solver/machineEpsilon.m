%% Numerical Analysis MATLAB
% Author: Won Bin Choi (B3)
% E-mail: dc07650@naver.com
% Organization: Sogang University(Korea, Republic of), Mechanical Engineering
% Date: September 10, 2020

%% Initilizae
clear all; close all; clc;
a = 1; % Set random initial value
%% Main Loop
while true
   disp(a);
   a = a/2;
   if (a+1)<=1
       break
   end
end
%% Display
disp("Terminate Program")