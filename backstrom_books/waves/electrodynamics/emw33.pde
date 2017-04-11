TITLE								  	{ emw33.pde }
   'Wave in a Rectangular Cavity, Eigenstates'		
{ From "Waves by Finite Element Analysis" by Gunnar Backstrom }	
SELECT								
   errlim= 5e-3   		modes= 16				
VARIABLES
   Ezr        				        	
DEFINITIONS                                        	
   Lx= 1.0              	Ly= 0.8		Ezi= 0	
   eps0= 8.85e-12       	eps			{ Permittivity }
   mu0= 4*pi*1e-7       	mu			{ Permeability }
   sigma						{ Conductivity }
   omega= sqrt( lambda/ (mu0*eps0))	{ Angular frequency }		
#include 'emw_xy.pde'
EQUATIONS
   del2( Ezr)+ lambda*Ezr = 0
BOUNDARIES
region 'vacuum'   	eps= eps0		mu= mu0		sigma= 0	
   start 'outer' (0,0)       	value(Ezr)= 0   	
   line to (Lx,0) to (Lx,Ly) to (0,Ly)  line to close
PLOTS
   contour( Ezr)  report( omega)		
END "AzD7rCcoMGxDp/bbScQB8ukDeGr5zsdZOW04MoeO+6Ouwt6jVXo8nno6Jgy0nrsNOBJJJ8RTzR4ZMQ6NmkIvPEc0d7g6eI2+F9YCBhbp7aMG1TrkC889KT1tKpPM+IJgCcJJZLlYmwj4QWfVnuGSopFZhnEUtmB9uBjrj73STZF"
