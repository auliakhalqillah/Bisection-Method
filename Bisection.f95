! HOW TO COMPILE THROUGH COMMAND LINE (CMD OR TERMINAL)
! gfortran -c Bisection.f95
! gfortran -o bisection Bisection.o
!
! The program is open source and can use to numeric study purpose.
! The program was build by Aulia Khalqillah,S.Si
!
! email: auliakhalqillah.mail@gmail.com
! ==============================================================================
program bisection_method
  implicit none
  real :: xi,xf,xr,er,xrold,f,inf
  integer :: iter,n,it
  character(len=100) :: fmt

  write(*,*)""
  write(*,*)"---------------------------------"
  write(*,*)"BISECTION METHOD - FINDING ROOT"
  write(*,*)"---------------------------------"
  write(*,*) ""
  write(*,"(a)",advance="no") "Isert Initial Boundary (XI):"
  read*, xi
  write(*,"(a)",advance="no") "Insert Final Boundary (XF):"
  read*, xf
  write(*,"(a)",advance="no") "Insert Data Length (ex: N=100):"
  read*, n

  inf = huge(1000.0)
  fmt = "(a12,a13,a13,a20)"
  write(*,*)""
  write(*,fmt)"ITER","XR[ROOT]","F(XR)","ERROR(%)"
  open(20, file='bisection.txt', status='replace')

  50 if ((f(xi)*f(xf)) .le. 0) then
    iter = 1
    xrold = 0.0
    do while (iter .le. n)
      xr = (xi+xf)/2

      if ((f(xi)*f(xr)) .le. 0) then
        xf = xr
      else
        xi = xr
      end if

      er = abs((xr-xrold)/xr)*100

      write(*,*) iter,xr,f(xr),er
      write(20,*) iter,xr,f(xr),er
      iter = iter + 1
      xrold = xr
    end do
    close(20)
  else
    ! Estimate new boundary
    xi = xi + 1
    xf = xf - 1
    go to 50
  end if
end program

real function f(x)
  implicit none
  real::x
  ! f = (x**10)-1
  f = (x**2)+(2*x)+1
end
