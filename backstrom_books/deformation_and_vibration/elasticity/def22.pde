TITLE                                                               { def22.pde}
   'Composite Semicircular Beam'
{ Hook, left end welded, right end loaded, aluminum reinforced by steel }
{ From "Deformation and Vibration" by Gunnar Backstrom }
SELECT
   errlim= 1e-4
VARIABLES
   u            v
DEFINITIONS
   mu = 0.3                     E  = 200e9                      { Steel }
#include 'defuv.pde'
   r1= 0.06             r2= 0.1                rm= 0.07
   F= 5e4                                                       { Force/area }
EQUATIONS
   u:	dx( sx) + dy( sxy)= 0
   v:	dx( sxy)+  dy( sy)= 0
BOUNDARIES
region 'steel'
   start 'outer' (-r2,0)
   load(u)= 0        load(v)= 0         arc to (0,-r2) to (r2,0)
   load(u)= 0        load(v)= -F/(r2-r1)     line to (r1,0)
   load(u)= 0        load(v)= 0         arc to (0,-r1) to (-r1,0)
   value(u)= 0      value(v)= 0         line to close
region  'aluminum'              E= 70e9
   start 'Al' (-r2,0)  arc to (0,-r2)  to  (r2,0)  line  to  (rm,0)
   arc to (0,-rm) to (-rm,0) line to close
PLOTS
   grid( x+200*u, y+200*v)
   contour( u)                  contour( v)             vector( uv) norm
   contour( sx)                 contour( sy)                    contour( sxy)
   elevation( u, v) on 'outer'
   elevation( sx) on 'outer'    elevation( sy) on 'outer'
   contour( p_angle)
   vector( cos(p_angl)*sxp, sin(p_angl)*sxp) norm notips as ' "Tension" '
   contour( sxp)                contour( syp)           contour( Mises)
   contour( sxp) painted                contour( syp) painted
   contour( mises) painted
   surface( mises)      contour( mises) painted on 'aluminum'
END "F2SBSg9zo6wN9G6WQ/kkDmAw4ZP877k+0tC+NwTF06LGiYcqZbfRR86ycjtIUyfGYuUDtECW6I25EAEPJB3KFhudx61ddYaQTuBtd1N2qAqUIH+YiWCkxfu0XzXqCd0DyYJKQ67EwFaj9l31+ZH1QgxIGbNFAw2102vjKepCMzh"
