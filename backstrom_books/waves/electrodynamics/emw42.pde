TITLE								         { emw42.pde }
   'Circular Wave-Guide, Eigenstates, E and B'		
{ From "Waves by Finite Element Analysis" by Gunnar Backstrom }		
SELECT								
   errlim= 1e-3   		modes= 8		plotintegrate= off
VARIABLES
   Ezr        	
DEFINITIONS                                        	
   r0= 0.01		
   eps0= 8.85e-12       	eps= eps0		{ Vacuum }
   mu0= 4*pi*1e-7       	mu= mu0           		
   omega0k= sqrt( lambda/ (mu*eps))	{ Critical frequency }
   omega= 1.1* omega0k
   gamma= sqrt( mu*eps*omega^2- lambda)
   Exi= -gamma/lambda* dx(Ezr)
   Eyi= -gamma/lambda* dy(Ezr)			Ei= vector( Exi, Eyi)
   Bxi= omega*mu*eps/lambda* dy(Ezr)
   Byi= -omega*mu*eps/lambda* dx(Ezr)		Bi= vector( Bxi, Byi)
EQUATIONS
   del2( Ezr)+ lambda*Ezr = 0
BOUNDARIES
region 'vacuum'    	start 'outer' (0,r0)       value(Ezr)= 0
   arc( center= 0,0)  angle= 360  close  	
PLOTS
   contour( Ezr)  report( omega)  report( gamma)
   vector( Ei)  norm		vector( Bi)  norm	
END "BU7pmIB7vs6Fd8TeWSeXKfIg+yKezgSui0mXuvGpOYPMAPrmSi+X1uOhv4ETfFIp0fN3O5PN+Y+5JNyMnbXqeENODZqOReQTyN0q7Ni38O31WuRoXXciehaCjosLM4zwpbC4QJEuvUlHablsOWObaAS+xiVZP56X59ppxW8HwdZ"
