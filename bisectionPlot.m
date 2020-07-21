% This matlab program is used to plot results from:
% 
% Bisection.f95
% 
% By: Aulia Khalqillah,S.Si (2019)

% Numerical Bisection
clear;clc;
xi = -3;
xf = 3;
n = 100;
% root from bisection method
root = -1.00024414;
deltax = (xf-xi)/n;
xaxis = [xi:deltax:xf];
f = (xaxis.^2)+(2*xaxis)+1;
froot = (root^2)+(2*root)+1;
plot(xaxis,f)
hold on;
plot([root root],[froot froot],'.r','markersize',10)
xlabel('x')
ylabel('f(x)')
title('Finding Root-Bisection Method')
text(-2.5,12,'f = x^2+2*x+1', 'fontsize', 20)
grid minor
print -dpng some_name.png;
