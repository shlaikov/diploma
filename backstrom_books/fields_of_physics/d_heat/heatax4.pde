TITLE                                                    { heatax4.pde }
   'Tube With Cooling Flanges'
{ A section of a steel tube including one typical flange cooled by air flow. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 1e-4
COORDINATES
   ycylinder( 'r','z')
VARIABLES
   temp
DEFINITIONS
   r1= 10e-2       r2= 12e-2       r3= 20e-2       L= 5e-2     dL= 0.5e-2
   k= 45                                                { Steel }
   temp2= 300
   fluxd_r= -k*dr(temp)                 fluxd_z= -k*dz(temp)
   fluxd= vector( fluxd_r, fluxd_z)     fluxdm=magnitude( fluxd)
EQUATIONS
   (1/r)* dr( -r*k*dr(temp))+ dz( -k*dz(temp))= 0
BOUNDARIES
region 1
   start (r1,0)         natural(temp)= 0     line to (r2,0)
   natural(temp)= 20*(temp-temp2)
   line to (r2,L)  to (r3,L)  to (r3,L+dL)  to (r2,L+dL)  to (r2,2*L+dL)
   natural(temp)= 0                     line to (r1,2*L+dL)
   value(temp)= 373                     line to close  { Inside tube }
feature 2
   start 'outer' (r2,0)
   line to (r2,L) to (r3,L) to (r3,L+dL) to (r2,L+dL) to (r2,2*L+dl)
PLOTS
   contour( temp)       surface( temp)
   contour( fluxdm)     vector( fluxd)  norm
   contour( fluxd_r)            contour( fluxd_z)
   elevation( normal( fluxd)) on 'outer'
END "D4NkkNkQFdKdRUjloo3lQ0W4pR7mPA423L63oxKXNqxH5L9X4ofwYiKP90mHbpqoAm+Q7d7ansBdihG5tv5ly8+QQc5iBNj083Rpwarzcyy3egRkFQ/NklgXqH/Q6PGB9hX73dLRuZ0kwjbOW/8e7uCqhT82c3ik2t+cBkuwgN4"
