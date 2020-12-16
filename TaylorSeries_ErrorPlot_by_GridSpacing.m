clear all; close all; clc

syms x
% f(x) = sin(x);
func = input("Input function: ", 's');
f(x) = str2sym(func);
df(x) = diff(f(x));
n = 3;

while true
    disp("Extrapolation Plot")
    disp(f)
    h = input("Input grid space, h: ");
    n = input("Resolution (500 recommended): ");
    
    xi = linspace(0,2*pi, n);
    dphi = zeros(1,n);

    for i = 1:1:length(xi)
        dphi(i) = (f(h+xi(i)) - f(-1*h+xi(i)))/(2*h);
    end
    
    y = df(xi);
    hold on;
    plot(xi, y);
    plot(xi, dphi, "--");
    
    grid on;
    legend ('Real df(x)', 'Approximated df(x)');
    title("Error by Centered Difference");
    hold off;
    
    comm = input("\nTerminate? (y/n): ", 's');
    if (comm == 'y')||(comm == 'Y')
        clear all; close all;
        break;
    end
    clc;
end

