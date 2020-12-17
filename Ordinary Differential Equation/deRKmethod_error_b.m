%% Numerical Analysis MATLAB
% Author: Won Bin Choi (B3)
% E-mail: dc07650@naver.com
% Organization: Sogang University(Korea, Republic of), Mechanical Engineering
% Date: November 12, 2020
%% Initialize
close all; clq; clc;
syms y; syms x;
lambda = 2; n = 1000;
lset = 0; rset = 2;
y(x) = (exp(lambda*x) - lambda*x - 1)/(power(lambda,2));
%% Compute
h = (rset-lset)/n;
t = lset:h:rset;
yn = zeros(1,n);
yn(1) = double(y(lset));
for i = 1:n
    yn(i+1) = yn(i) + h*(lambda * (yn(i) + h/2 * (lambda * yn(i) + t(i))) + (t(i+1) + t(i))/2);
end
%% Compute 2
h = (rset-lset)/(2*n);
t2 = lset:h:rset;
yn2 = zeros(1,2*n);
yn2(1) = double(y(lset));
for i = 1:2*n
    yn2(i+1) = yn2(i) + h*(lambda * (yn2(i) + h/2 * (lambda * yn2(i) + t2(i))) + (t2(i+1) + t2(i))/2);
end
%% Plot
hold on;
plot(t,y(t));
plot(t,yn);
plot(t2,yn2);
grid on; xlim([lset rset]); ylim([0 ceil(max(double(y(t)))/10)*10]);
legend("Exact", "Approximate", "Approximate (Double Grid)");
hold off;
%% Error
avgError = zeros(2,1);
avgError(1) = mean(yn - double(y(t)));
avgError(2) = mean(yn2 - double(y(t2)));

fprintf("Error Reduction Rate of Runge Kutta Method\n");
fprintf("n = %d:\th = %.3f, mean error = %.3f\n",n, (rset-lset)/n, avgError(1));
fprintf("n = %d:\th = %.3f, mean error = %.3f\n",2*n, (rset-lset)/(2*n), avgError(2));
fprintf("Reduction Rate: %f%%\n",avgError(2)/avgError(1)*100);