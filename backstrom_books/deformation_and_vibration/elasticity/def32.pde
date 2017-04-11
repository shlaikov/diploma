TITLE                                                                      { def32.pde }
   'Tube Pressurized Over Part of Its Length'
{ From "Deformation and Vibration" by Gunnar Backstrom }
SELECT
   errlim= 1e-3
debug(formulas)
COORDINATES
   ycylinder( 'r', 'z')
VARIABLES
   u            w
DEFINITIONS
   E  = 200e9                   mu = 0.3                        { Steel }
   r1 = 2e-3                    r2 = 10e-3                      L= 10e-3
   p1= 1e8              p2= 0                           { Pressure }
#include 'defuw.pde'
   q2r= r2/r            q21= r2/r1                              { Exact solution: }
   sr_ex= -(p1* (q2r^2- 1)+ p2* (q21^2-q2r^2))/ (q21^2- 1)
   st_ex=  (p1* (q2r^2+ 1)- p2* (q21^2+q2r^2))/ (q21^2- 1)
   u_ex= r/E*( st_ex- mu*sr_ex)                 { Hooke }
EQUATIONS
   u:	dr( sr)+ dz( srz)+ ( sr- st)/r= 0
   w:	dr( srz)+ dz( sz)+ srz/r= 0
BOUNDARIES
region 'steel'
   start 'outer' (r1,0)
   line to (r2,0)  to (r2,L/2)  point value(w)= 0
   line to (r2,L)   to (r1,L)  to (r1,2*L/3)
   load(u)= p1  line to (r1,L/3)                        { Inner pressure }
   load(u)= 0           line to close
MONITORS
   grid( r+300*u, z+300*w)      contour( u)
PLOTS
   grid( r+300*u, z+300*w)      contour( u)     contour( w)
   contour( uwm)                vector( uw) norm        elevation( u, w) on 'outer'
   contour( sr) painted contour( st) painted    contour( sz) painted
   contour( p_angle)
   vector( cos(p_angl)*srp, sin(p_angl)*srp) norm notips as ' "Tension" '
   contour( srp) painted        contour( szp) painted
   contour( mises) painted      contour( ( u- u_ex)/ u_ex)
END "BRs7qbQjy33z65K9V12IxmWfw9NO4g2lpdOlKUUwRCTBelfgtWhGZH+nldCekZ/VXzG1t0vDd12IOW2zSEktLNh2mKHiMXOUO7BOE1YdGODrw26Ola3uu1jH0lV0nwRiCrFGgQAefsp8X/RIwj7pWuFhVAe35qF5dFZRUE1ASE4"
