% This matlab program is used to plot results from:
%
% Bisection.f95
%
% By: Aulia Khalqillah,S.Si (2019)

% Numerical Bisection
data = load('bisection.txt');
iter = data(:,1);
root = data(:,7);
root = root(end);
fn = data(:,8);
fn = fn(end);
error = data(:,9);

% Function
x = -3:0.1:3;
f = x.^2 - 2*x + 1;

figure(1)
plot(x,f,'r','linewidth',2)
hold on
plot([root root],[fn fn],'.b','markersize',30)
legend('Function','Root - Numerical Bisection','location','NorthWest')
title('FINDING ROOT USING BISECTION METHOD')
xlabel('X')
ylabel('Function')
text(-2.5,12,'f = x^2-2*x+1', 'fontsize', 20)
grid minor

figure(2)
plot(iter,error,'b','linewidth',2.)
xlabel('Iteration')
ylabel('Error (%)')
title('Error of bisection method for each iteration')
