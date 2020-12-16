clear all; close all; clc;

syms f;
syms x;
f(x) = ((9.8*68.1)/x)*(1-exp((-x*10)/(68.1)))-40
%f(x) = 2*x + 1
df(x) = diff(f(x))
es = 0.00001;

x0 = input("Input starting point: ");
xi = x0;

while true
   xii = xi - (f(xi))/(df(xi));
   if abs(f(xii)) < es
      break
   else
       xi = xii;
   end
end

disp("The approximated root utilizing the Newton Raphson's Method is:")
disp(double(xii));