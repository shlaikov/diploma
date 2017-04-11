TITLE   	       						 		{ emw81.pde }
   'Radiating Coil'	
SELECT
   errlim=1e-4          ngrid= 30	regrid= off	     vandenberg= on
COORDINATES
   ycylinder('r','z')
VARIABLES
   Ephir   	Ephii
DEFINITIONS
   r0= 0.5e-3         	r1= 1.0	
   mu0= 4*pi*1e-7     	mu= mu0 		sigma= 0		I0= 1.0
   eps0= 8.854e-12      	eps= eps0		omega= 10e9
   Jphi0r     		   	{ Current density in coil }		
   k= omega* sqrt( mu*eps)		rad= sqrt( r^2+ z^2)
#include 'emw_rz.pde'
EQUATIONS
   Ephir:	drr(Ephir)+ 1/r*dr(Ephir)+ dzz(Ephir)+ (k^2-1/r^2)*Ephir= 0
   Ephii:	drr(Ephii)+1/r*dr(Ephii)+ dzz(Ephii)+ (k^2-1/r^2)*Ephii
      		-omega*mu*Jphi0r= 0
BOUNDARIES
region 'vacuum'   Jphi0r= 0
   start(0,-r1)    natural(Ephir) = k*Ephii	natural(Ephii)=  -k*Ephir
   arc(center= 0,0) to (r1,0) to (0,r1)
   value(Ephir) = 0   value(Ephii)= 0  line to close
region 'coil' 	Jphi0r= I0/(2*r0)^2			
   start(0,-r0) line to (2*r0,-r0) to (2*r0,r0) to (0,r0) to close
PLOTS
   contour( rad*Ephir) painted  		
   contour( rad*Ephii) painted  fixed range(-5e-2,5e-2)   	
   elevation( rad*Ephir, rad*Ephii) from (r1/20,0) to (r1,0)
   vector( Br)  norm
END "COEtPhrmNZNbKoVmpYsLeg/3dPrIPM/Q3SKWvx762rc1uAj7M0XTjwSzM9zrqQdchrxlQ50LX5vJVcZTgFtI6Sv1uYyGntengc0nY8w1UX63rxBJOxwY640LrLotP4xaGtiMT/ouyKsxZSwljz2a0Vt0AIQ1RA0aMKx8dr8YnZi"
