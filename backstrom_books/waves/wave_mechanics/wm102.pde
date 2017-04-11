TITLE									{ wm102.pde }
   'Harmonic Oscillator in 2D'
SELECT  								
   errlim= 1e-3 		  	modes= 8  	
VARIABLES
   psi
DEFINITIONS
   r0= 2e-10                  		r1= 10e-10
   me= 9.1096e-31             	h= 6.6262e-34
   c= 8* pi^2* me/h^2       	f0= 1e15		rad= sqrt( x^2+ y^2)
   V= 2*pi^2*me*f0^2* rad^2
   psi1= psi/ sqrt( integral( psi^2) )	
EQUATIONS
   del2(psi)- V*c*psi+ lambda*c*psi= 0
BOUNDARIES
region 'domain'
   start(r1,0)  value(psi)= 0    arc to (0,r1) to (-r1,0) to (0,-r1) to close
PLOTS
   contour( psi1)  painted zoom(-r1/2,-r1/2,  r1,r1)
   surface( psi1^2) zoom(-r1/2,-r1/2,  r1,r1)
END "GCka1fyDyw4IKcTZckm39Ci07ZXR7tujcsp0E+QPGDDoi44UsB+EakPkNvqns/OzygFWi+ST1+lJrpnLEH5i5IfpNikDQQXCgFdamItVzg+Fxi5GCYAaEE4rDZK/GWzGlhLoV5sjaCm4biHjP4siNPxG+o0IycPqkFUQ5zKQq4u"
