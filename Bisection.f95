! HOW TO COMPILE THROUGH COMMAND LINE (CMD OR TERMINAL)
! gfortran -c Bisection.f95
! gfortran -o bisection Bisection.o
!
! The program is open source and can use to numeric study purpose.
! The program was build by Aulia Khalqillah,S.Si
!
! email: auliakhalqillah.mail@gmail.com
! ==============================================================================

program bisection
implicit none
real,parameter::error=1e-4
real::a,b,f,c, er, h, oldc
integer :: iter,n,it

write(*,*)""
write(*,*)"=========================================================================="
write(*,*)"                     BISECTION PROGRAM (FINDING ROOT)             "
write(*,*)"=========================================================================="
write(*,*)""
write(*,"(a)",advance="no") "INSERT INITIAL BOUNDARY:"
read*, a
write(*,"(a)",advance="no") "INSERT FINAL BOUNDARY:"
read*, b
write(*,"(a)",advance="no") "INSERT STEP DATA POINT (EX: 0.1):"
read*, h

n = int((b - a)/h)

open(20, file='bisection.txt')
it = 1
500 if (f(a)*f(b) <= 0) then
iter = 1

write(*,*)""
write(*,*)"Fisrt Column: Index"
write(*,*)"Second Column: Root"
write(*,*)"Third Column: F(c)"
write(*,*)"Fourth Column: Error"
write(*,*)""

do while (iter <= n)
  c = (a+b)/2
  oldc = a
  if ((f(a))*(f(c)) <= 0 )then
    b = c
  else
    a = c
  endif

  er = abs((c-oldc)/c)*100
  
  write(*,*) iter, c, f(c),er, "%"
  write(20,*)iter, c, f(c),er, "%"
  iter = iter + 1
end do
close(20)
else
  write(*,*)"=========================================================================="
  write(*,*)""
  write(*,*) "> ROOT IS NOT FOUND, BECAUSE f(a)*f(b) > 0. DO NEW ITERATION!!!"
  write(*,*)""
  a = a + 1
  b = b - 1
  write(*,*)"ITER:",it,"| INITIAL BOUNDARY:",a,"| FINAL BOUNDARY:",b
  write(*,*)""
  it = it + 1
  go to 500
endif
end program

real function f(x)
implicit none
real::x
f = (x**2) + (2*x) + 1
end

