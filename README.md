# Bisection Method
Bisection method is one of bracketing methods for solving root of the function. The root is laying in range [xi,xf], where xi is initial boundari and xf is final boundary of roots estimation. The idea of bisection method is, by using the range of these boundary, if `f(xi)*f(xr) < 0` that means the roots are in range of [xi,xf]. Otherwise, if `f(xi)*f(xf) > 0` that means the roots are not in these range and you have to input another value of range roots approximation. Then, to get the roots approximation, you have to calculate the middle point of [xi,xf] by using

![middle_equation](https://i.upmath.me/svg/xr%20%3D%20%7B(x_i%2Bx_f)%5Cover2%7D)

By using `xr`, check the condition:

1. if `f(xi)*x(xr) < 0`, then the xf = xr,
2. if `f(xi)*x(xr) > 0`, then the xi = xr,
3. if `f(xi)*x(xr) = 0`, then the xr = xr

The process will stop when the f(xr) is close to 0.
# Example
Solve a equation of ![f(x) = x^2+2x+1](https://i.upmath.me/svg/f(x)%20%3D%20x%5E2%2B2x%2B1) to find root by using bisection method! As we know, this funtion has root of -1 (solving by factorization in mathematically). 

There are three parameters input:
 - Initial Boundary = -3
 - Final Boundary = 3

The program has been written for finding a roots of the function automatically. So, you can input whatever the boundary values are. Remember, Initial Boundary always more less than Final Boundary.

To plot the result, you can use bisectionPlot.m file (Matlab). Finally, you can check the result in figure bisection.png 
# Contact
Email: auliakhalqillah.mail@gmail.com
# Material Source
[Julan Hernadi,2012,Matematika Numerik dengan Implementasi Matlab](http://andipublisher.com/produk-1012004497-matematika-numerik-dengan-implementasi-m.html)
