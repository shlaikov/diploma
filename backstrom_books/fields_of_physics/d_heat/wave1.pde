TITLE                                                    { wave1.pde }
   'Oscillating Temperature in a Steel Block '
{ Block excited at one end by a time-sinusoidal temperature. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 1e-3
VARIABLES
   tempr        tempi
DEFINITIONS
   Lx= 0.2                      Ly= 0.1
   k= 45                                rcp= 3.6e6                      heat= 0
   a0= 1                                                        { Re(tempr) at left boundary }
   omega= 0.25                                          { Angular frequency }
   tempa= sqrt(tempr^2+ tempi^2)        { Amplitude }
   phase= sign(tempi)* arccos(tempr/tempa)/pi*180
   sq= sqrt( omega* rcp/ ( 2*k))                { Exact solutions ...}
                tempr_ex= a0* cos(-sq*x)* exp(-sq*x)
        tempi_ex= a0*  sin(-sq*x)* exp(-sq*x)
        tempa_ex= a0* exp(-sq*x)
EQUATIONS
   tempr:	div( -k*grad( tempr))- heat- omega*rcp* tempi= 0
   tempi:	div( -k*grad( tempi))+ omega* rcp* tempr= 0
BOUNDARIES
region 1
   start (0,0)   natural(tempr)= 0      natural(tempi)= 0
      line to (Lx,0) to (Lx,Ly) to (0,Ly)
      value(tempr)= a0          value(tempi)= 0         { Input temperature }
      line to close
PLOTS
   elevation( tempr, tempi) from (0,Ly/2) to (Lx,Ly/2)
   elevation( phase) from (0,Ly/2) to (Lx,Ly/2)
   elevation( abs(tempr), abs(tempi), abs(tempa)) log
      from (1e-3*Lx,Ly/2) to (Lx,Ly/2)          { Avoid zero in tempi }
   elevation( abs(tempr), abs(tempr_ex))  log
      from (0,Ly/2) to (Lx,Ly/2)
   elevation( abs(tempa), abs(tempa_ex))  log
      from (0,Ly/2) to (Lx,Ly/2)
   surface( abs(tempr))  log viewpoint( 1,-1,30)
END "DT9QoIg2DTctEkLHbUnkq2W4GmgrcTib865TAih4VltCbUejXuiL6ta0wgg7c6AEDp86dEOpC8dlZddqG4TuOiFbqeJb0peHvx5LC2/ffavnDk5x0X9adhbYVQpVgIlbNMe/OWv4T1xbSDIJfqSGZzhizY3sb28eG8jjIpx8lWX"
