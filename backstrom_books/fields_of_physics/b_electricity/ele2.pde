TITLE                                                        { ele2.pde }
   'Metal Bar in a Tube'
{ Calculate the field between a metal bar of square cross section and a metal tube. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 1e-3
VARIABLES
   U
DEFINITIONS
   r0= 1                        b= 0.3          Ub= 1
   Ex= -dx(U)           Ey= -dy(U)
   E= -grad(U)          Em= magnitude(E)
EQUATIONS
   div( -grad(U))= 0
BOUNDARIES
region 1
   start 'tube'  (r0,0)
      value(U)= 0               arc( center= 0,0) angle= 360
   start 'bar' (-b,-b)          value( U)= Ub
      line to (-b,b)  to (b,b)   to (b,-b)  to close
PLOTS
   contour( U)          surface( U)
   elevation( U) on 'tube'              elevation( U) on 'bar'
   contour( Em)         vector( E) norm
   elevation( Em) on 'tube'     elevation( Em) on 'bar'
END "H6/YhOqKW3J0uXZDmRoTc6ND8dDGTBRef7DZN3Jart2wSAh73VbTlU7c32m5fWKkXLssA5avrCIhGp0nc5pt3fGEx4JeBs2q+VpuvPa0fYxFzeEggCLaLgvAl/Se/DIsG5ZtQxXLBWoFb5MQ8pW6nIpTcfI1fZRUwh25wE5zGwC"
 
