! HOW TO COMPILE THROUGH COMMAND LINE (CMD OR TERMINAL)
! gfortran -c Bisection.f95
! gfortran -o bisection Bisection.o
!
! The program is open source and can use to numeric study purpose.
! The program was build by Aulia Khalqillah,S.Si.,M.Si
!
! email: auliakhalqillah.mail@gmail.com
! ==============================================================================
program bisection_method

implicit none
real :: xi,xf,xr,error,xrold,f,check,limitrange,limiterror
real :: start, finish
integer :: iter, condition
character(len=100) :: fmt

write(*,*)""
write(*,*)"---------------------------------"
write(*,*)"BISECTION METHOD - FINDING ROOT"
write(*,*)"---------------------------------"
write(*,*) ""
write(*,"(a)",advance="no") "Insert Initial Boundary (XI):"
read*, xi
write(*,"(a)",advance="no") "Insert Final Boundary (XF):"
read*, xf

fmt = "(a12,a13,a13,a20,a13,a17,a20,a17,a17,a20)"
write(*,*)""

call cpu_time(start)
limitrange = 1e12
limiterror = 1e-10
open(20, file='bisection.txt', status='replace')
    check = f(xi)*f(xf)
    ! Automatic change boundary if the f(xi)*f(xf) > 0
    do while (check > 0)
        if (check > limitrange) then
            xi = xi + 1
            check = f(xi) * f(xf)
        else
            xf = xf - 1
            check = f(xi) * f(xf)
        end if
        print*, xi, xf
    end do
    ! Start root calculation
    iter = 1
    xrold = xi
    xr = (xi+xf)/2
    error = abs((xr-xrold)/xr) * 100
    condition = 0
    write(*,fmt)"ITER","Xi","Xf","F(Xi)","F(Xf)","XROLD","XR[ROOT]","F(XR)","ERROR","CONDITION"
    do while (error > limiterror .or. isnan(error))
        ! write the result on terminal and save to the file
        write(*,*) iter,xi,xf,f(xi),f(xf),xrold,xr,f(xr),error,condition
        write(20,*) iter,xi,xf,f(xi),f(xf),xrold,xr,f(xr),error,condition      
        ! Check first condition of bisection method
        if ((f(xi)*f(xr)) < 0) then
            xf = xr
            xrold = xr
            xr = (xi+xf)/2
            error = abs((xr-xrold)/xr) * 100
            condition = 1
        ! Check second condition of bisection method
        elseif ((f(xi)*f(xr)) > 0) then
            xi = xr
            xrold = xr
            xr = (xi+xf)/2
            error = abs((xr-xrold)/xr) * 100
            condition = 2
        ! Check third condition of bisection method
        elseif (f(xi)*f(xr) == 0) then
            xr = xr
            if (f(xr) == 0) then
                xr = xr
            else
                xr = xi
            endif
            xrold = xr
            error = abs((xr-xrold)/xr) * 100
            condition = 3
        end if
        ! Do the netx iteration
        iter = iter + 1
    end do
close(20)
call cpu_time(finish)
print '("Time = ",f12.8," seconds.")',finish-start
end program
  
function f(x)
implicit none
real::x,f
! f = (x**2)-16
f = (x**2)-(2*x)+1
! f = (x**3) - (x**2) - (10*x) + 2
end
  
