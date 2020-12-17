%% Numerical Analysis MATLAB
% Author: Won Bin Choi (B3)
% E-mail: dc07650@naver.com
% Organization: Sogang University(Korea, Republic of), Mechanical Engineering
% Date: November 12, 2020

%% Initialize
close all; clear all; clc
n = [20]; % Grid Points
lset = 0; rset = 1; % x range
alp = 0.02; % conduction coefficient
%% Set coefficient matrix
for l = 1:length(n)
    dx = 1/n(l);
    x = lset:dx:rset;
    A = zeros(n(l)-1);
    R = zeros(n(l)-1,1);
    for m = 1:n(l)-1
        A(m,m) = - 2;
        if m~= 1
            A(m,m-1) = 1;
        end
        if m~= n(l)-1
            A(m,m+1) = 1;
        end
        if m == n(l)-1
            R(m,1) = 1;
        end
    end
    %% Time Step Calculation
    dt = [0.04 0.08];
    sum = 0;
    for q = 1:m
        label(q) = sprintf("x = %.2f",sum);
        sum = sum + dx;
    end
    for p = 1:length(dt)
        t = 0:dt(p):8;
        phi = zeros(n(l) - 1,length(t)); % phi(x,t)
        dim = size(phi);
        phi(1,:) = 0;   % Boundary Condition
        phi(dim(1),:) = 1; % Boundary Condition
        phi(:,1) = 0; % Initial Condition
        for i = 1:length(t)-1 % Explicit Euler Method
            phi(:,i+1) = (eye(dim(1)) + alp*dt(p)/power(dx,2) * A) * phi(:,i) + alp*dt(p)/power(dx,2) * R;
        end
        hold on;
        figure(2*p-1);
        plot(t, phi)
        title("Conduction Heat Transfer by Time [\phi(x,t=0)=0, \phi(x=0,t)=0, \phi(x=1,t)=1]")
        xlabel("Time (sec)"); ylabel("Temperature (Degree Celcius)");
        xlim([0 8]); ylim([0 1]);
        legend(label, 'Location', "northwest");
        grid on;
        figure(2*p)
        hold on;
        plot(x,[0 phi(:,floor(0.24/dt(p))+1)' 1]');
        plot(x,[0 phi(:,floor(8.0/dt(p))+1)' 1]');
        title("Conduction Heat Transfer by x [\phi(x,t=0)=0, \phi(x=0,t)=0, \phi(x=1,t)=1]")
        xlabel("Distance (x)"); ylabel("Temperature (Degree Celcius)");
        xlim([0 1]); ylim([0 1]);
        legend("t = 0.24", "t = 8", 'Location', "northwest");
        grid on;
    end
end