TITLE							  	         { emw64.pde }
   'AC Coil Above a Metal Plate, Transients'	
{ From "Waves by Finite Element Analysis" by Gunnar Backstrom }					
SELECT								
   errlim= 1e-4		
COORDINATES
   ycylinder('r','z')
VARIABLES
   Aphi( 1e-7)      				        	
DEFINITIONS                                        	
   L= 0.1	    rc= 10e-3       dc= 5e-3       d0= 1e-3 	    dp= 50e-3
   eps0= 8.85e-12       	eps		I0= 1.0  	{ Current }
   mu0= 4*pi*1e-7       	mu		sigma
   omega= 2*pi*50		Jphi0              	{ Input current density }
   Ephi= -dt( Aphi)		Jphi= sigma*Ephi	
   Brho= -dz( Aphi)    		Bz=  1/r* dr( r*Aphi) 	
   B= vector( Brho, Bz)		Bm= magnitude( B)				
INITIAL VALUES
   Aphi= 0
EQUATIONS
   dr( 1/(mu*r)* dr( r*Aphi))+ dz( 1/mu* dz( Aphi))
      		-sigma*dt(Aphi)+ Jphi0= 0
BOUNDARIES
region 'vacuum'   eps= eps0    mu= mu0     sigma= 0 	Jphi0= 0
   start 'outer' (0,-L)      value( Aphi) = 0
   line to (2*L,-L) to (2*L,L) to (0,L)
   natural(Aphi)= 0  line to close
region 'coil1'   eps= eps0  mu= mu0  sigma= 5.99e7*0  Jphi0= I0/ dc^2
   start(rc,0) line to (rc+dc,0) to (rc+dc,dc) to (rc,dc) to close
region 'plate'    eps= eps0	mu= mu0 	sigma= 5.99e7  Jphi0= 0	
   start(0,-d0-dp) line to (2*L,-d0-dp) to (2*L,-d0) to (0,-d0) to close
TIME
   0 to 1
PLOTS
   for t= 1e-4, 3e-4, 1e-3, 3e-3, 1e-2, 3e-2, 0.1, 0.3, 1
      contour( Aphi)			contour( Jphi) painted on 'plate'
      vector( B) norm
END "IsmRZ3yV27XiA2P1TIxY8ZBCdZGxpH7Wld7U+UQJiIp3v5Li7HRquECFrefR6haam9DqSGBqPzaYcGx56uCDvWqRmn4wxXsCVzRo6mlwBD8UdTnqQlLbvPS2zrZKxkY3P/QaSiBcwSksr7FboSvru1KR4B59jJFkKl6tWP3eVAc"
