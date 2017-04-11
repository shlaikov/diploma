TITLE							           { wm92b.pde }
   'Particle Scattering in 1D, Gaussian V(x)'
{ From "Waves by Finite Element Analysis" by Gunnar Backstrom }	
SELECT
   errlim= 5e-3   		plotintegrate= off
VARIABLES
   psir		psii
DEFINITIONS			{ SI units throughout }
   Lx= 3e-9                 	Ly= Lx/20   		d= 0.4e-9  	
   me= 9.1096e-31 		{ SI units throughout }
   h= 6.6262e-34 			{ Planck’s constant }
   W= 5e-19			{ Kinetic energy, fixed }	
   p= sqrt( 2*me*W)		{ Momentum }
   k= 2*pi*p/h 			{ Wave number }
   c= 8*pi^2*me/h^2		{ Coefficient for PDE }	
   psip= sqrt( psir^2+ psii^2)	{ Local peak value }
   V= 1.2*W* exp( -x^2/d^2)			{ Gaussan potential energy }	
EQUATIONS
   psir:	del2(psir)- c*V*psir+c*W*psir= 0
   psii:	del2(psii)- c*V*psii+ c*W*psii= 0
BOUNDARIES
region 'forcefree'      		
   start 'outer' (-Lx,Ly)
   value(psir)= 1			value(psii)= 0		line to (-Lx,-Ly)
   natural(psir)= 0   		natural(psii)= 0		line to (Lx,-Ly)
   natural(psir)= -k*psii  	natural(psii)= k*psir	line to (Lx,Ly)
   natural(psir)= 0   		natural(psii)= 0		line to  close
PLOTS
   elevation( V) from (-Lx,0) to (Lx,0)
   elevation( psir, psii, psip) from (-Lx,0) to (Lx,0)
END "GEhgT2f16z2Nfp6Ix826M3kFIA7ROVWEVFk5Y1KzgioJnFt6GggGu4KVs2VpbTr+d8/gCHt/o3g/ELpsw1ozRzhNR/zuoUvSm8vuabnThQ9cnI1WhwMqK22gqRZ+thTaHeu9hEzAS22eM8AOVZYMVElCuy4mYoSi3xD5z1ofxwD"
