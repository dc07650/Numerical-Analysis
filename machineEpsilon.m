clear all; close all; clc;
a = 1;
while true
   disp(a);
   a = a/2;
   if (a+1)<=1
       break
   end
end
disp("Terminate Program")