TITLE                                                                      { def12.pde }
   'Beam With Continuous Load, Principal Axes'
{ From "Deformation and Vibration" by Gunnar Backstrom }
SELECT
   errlim= 1e-4
VARIABLES
   u            v
DEFINITIONS
   mu = 0.3                     E  = 200e9              { Steel }
   L= 1.0                       h= 0.2
#include 'defuv.pde'                            { Block of command lines }
   pressure= 1e6
EQUATIONS
   u:	dx( sx) + dy( sxy)= 0
   v:	dx( sxy)+  dy( sy)= 0
BOUNDARIES
region 'steel'
   start 'outer' (0,-h/2)
   load(u)= 0           load(v)= 0              line to (L,-h/2)
   load(u)= 0           load(v)= 0              line to (L,h/2)
   load(u)= 0           load(v)= -pressure      line to (0,h/2)
   value(u)= 0          value(v)= 0                     line to close
PLOTS
   grid( x+200*u, y+200*v)
   contour( u)                  contour( v)             vector( uv) norm
   contour( sx)                 contour( sy)                    contour( sxy)
   contour( ez)         elevation( u, v) on 'outer'
   elevation( sx) on 'outer'    elevation( sy) on 'outer'
   elevation( ez) on 'outer'
   contour( p_angle)
   vector( cos(p_angl)*sxp, sin(p_angl)*sxp) norm notips as ' "Tension" '
   contour( sxp)                contour( syp)           contour( mises)
   contour( sxp) painted                contour( syp) painted
   contour( mises) painted
   contour( energy_d) painted
END "C5O5sOJhCdQMIJawt0YLuWj5+Rr7yC47bpH7gDlrY/RQ/1pJjnIOqRgGAigpPtVmx2hmhrt8wYxG5So1wKT8hqEWU1DV7i2BXZUuaOS0EWWYqqow8mFX4t9q0zfFgCNzLb1lOHb/mduquqQmuYi9NPk/QBfnTtcDeDCHOn5siLj"
