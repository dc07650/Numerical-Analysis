%% Numerical Analysis MATLAB
% Author: Won Bin Choi (B3)
% E-mail: dc07650@naver.com
% Organization: Sogang University(Korea, Republic of), Mechanical Engineering
% Date: November 12, 2020

%% Initilize
clear all; close all; clc;
lset = 0; rset = 5;
init_x = [1; 0];
n = 1000;
h = (rset-lset)/n;
tn = lset:h:rset;
%% Main
[t x]  = ode45(@mck, tn, init_x');

%% Numerical
a = [0 1; -9 -10];
eig(a)
yn = zeros(2,n);
yn(:,1) = init_x;
for i = 1:n
    yn(:,i+1) = (eye(2,2)+a*h)*yn(:,i);
end

%% Graph
Position = x(:, 1);
Velocity = x(:, 2);
Position_app = yn(1,:);
Velocity_app = yn(2,:);
figure(1); hold on; grid on;
plot(t, Position);
plot(tn, Position_app);
plot(t, Velocity);
plot(tn, Velocity_app);
xlabel('times(sec)');
ylabel('response');
legend('Position(m)', 'Position(m)_{APP}', 'Velocity(m/s)', 'Velocity(m/s)_{APP}','location', 'southeast')

%% Error
avgError = zeros(2,1);
avgError(1) = mean(Position_app - Position');
avgError(2) = mean(Velocity_app - Velocity');

fprintf("Error of Explicit Euler Method\n");
fprintf("Position - n = %d:\th = %.3f, mean error = %f\n",n, (rset-lset)/n, avgError(1));
fprintf("Velocity - n = %d:\th = %.3f, mean error = %f\n",n, (rset-lset)/n, avgError(2));

%% Function
function dx = mck(t,x)
    m = 1;
    c = 5;
    k = 25;
    u = 0;
    dx = zeros(2,1);
    
    dx(1) = x(2);
    dx(2) = -c/m * x(2) -k/m * x(1) +1/m * u;
end