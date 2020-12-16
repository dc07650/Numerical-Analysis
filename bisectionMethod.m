clear all; close all; clc;

syms f;
syms x;
f(x) = ((9.8*68.1)/x)*(1-exp((-x*10)/(68.1)))-40
%f(x) = 2*x + 1
es = 0.00001;

while 1
      xl = input("Input lower bound: "); 
      xu = input("Input upper bound: "); 
      if (xl < xu) && (double(f(xl))*double(f(xu)) < 0)
          disp("Initialize")
          break
      end
      disp("Wrong value, input again.")
end
while 1
   xr = (xl + xu)./2;
   if double(f(xl))*double(f(xr)) < 0
       xu = xr;
   elseif double(f(xl))*double(f(xr)) > 0
       xl = xr;
   else
       break
   end
   if abs(f(xr)) < es
       break
   end
end
disp("The approximated root utilizing the Bisection Method is:")
disp(xr)

