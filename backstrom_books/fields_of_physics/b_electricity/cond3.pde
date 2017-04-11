TITLE                                                       { cond3.pde }
   'Conduction in a Trapezoidal Plate'
{ Find the potential U in a plate under an impressed voltage. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 1e-4
VARIABLES
   U
DEFINITIONS
   L1= 0.5                      L2= 0.25                Ly= 1
   cond= 5.99e7                                 { Copper }
   Ex= -dx(U)           Ey= -dy(U)
   E= -grad(U)          Em= magnitude(E)
   Jx= cond*Ex          Jy= cond*Ey
   J= cond*E            Jm= magnitude(j)
   U_ex= y/Ly* 1.0      { Exact solution for 1.0 V }
   eqn= div( -cond*grad(U))
EQUATIONS
   div( -cond*grad(U))= 0
BOUNDARIES
region 1
   start(-L1,0)          value(U)= 0          line to (L1,0)
   natural(U)= 0        line to (L2,Ly)         { Insulated }
   value(U)= 1.0        line to (-L2,Ly)
   natural(U)= 0                line to close          { Insulated }
PLOTS
   contour( U)          surface( U)             vector( E)  norm
   contour( Jx)                 contour( Jy)        contour( Jm)
   contour( eqn) as 'Residual'
   elevation( Jy) from (-L1,0) to (L1,0)
   elevation( Jy) from (-L2,Ly) to (L2,Ly)
END "H6TiOyj6dVmeCzFD2fZRfZm9+6hSu0cl5YOPDLYsePuicDSnYsaFwRrrMyd8EkFiSazOgV+tGdAu1c+JSIhGiGf8hmmBHaJjfS82kCXNTPD4JEAmalX9cPmvx7Qoghq6ZGH8P2tPxIJ4+eVm4CNrWeUB/0hvWUhbynQaR2GxnO/"
