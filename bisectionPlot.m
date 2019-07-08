% This matlab program is used to plot results from:
% 
% Bisection.f95
% 
% By: Aulia Khalqillah,S.Si (2019)

% Numerical Bisection
data = load('bisection.txt');
root = data(:,2);
root = root(end);
fn = data(:,3);
fn = fn(end);

% Function
x = -3:0.1:3;
f = x.^2 + 2*x + 1;

plot(x,f,'r','linewidth',2)
hold on
plot([root root],[fn fn],'.b','markersize',30)
legend('Function','Numerical Bisection','location','NorthWest')
title('FINDING ROOT USING BISECTION METHOD')
xlabel('X')
ylabel('Function')
text(-2.5,12,'f = x^2+2*x+1', 'fontsize', 20)
grid minor
