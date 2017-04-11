TITLE								  	{ emw21.pde }
   'Plane Wave in a Conductor'		
{ From "Waves by Finite Element Analysis" by Gunnar Backstrom }
SELECT								
   errlim= 1e-3   					{ Limit of relative error }
VARIABLES
   Ezr        	Ezi				        	{ Real and imaginary parts }
DEFINITIONS                                        	{ SI units throughout }
   Lx= 1.0              	Ly= 0.2 		{ Domain size }
   eps0= 8.85e-12       	eps			{ Permittivity }
   mu0= 4*pi*1e-7       	mu 			{ Permeability }
   sigma						{ Electric conductivity }
   omega= 5e9                 			{ Angular frequency }
   Ez_in= 1.0                   			{ Input field Ez }
   Ep= sqrt(Ezr^2+ Ezi^2)  			{ Modulus of Ez }
   phase= sign( Ezi)* arccos( Ezr/Ep)/pi*180 	{ Angle }
EQUATIONS
   Ezr:	del2( Ezr)+ mu*eps*omega^2*Ezr+ mu*sigma*omega*Ezi= 0
   Ezi:	del2( Ezi)+ mu*eps*omega^2*Ezi- mu*sigma*omega*Ezr= 0
BOUNDARIES
region 'conductor'    	eps= eps0		mu= mu0	 	sigma= 1e-1
   start 'outer' (0,0)
   natural(Ezr)= 0   	natural(Ezi)= 0 	line to (Lx,0)
   value(Ezr)= 0   		value(Ezi)= 0 	line to (Lx,Ly)    	{ Conducting }
   natural(Ezr)= 0  	natural(Ezi)= 0 	line to (0,Ly)
   value(Ezr)= Ez_in     value(Ezi)= 0   	line to close	{ Input field }
PLOTS
   elevation( Ezr, Ezi, Ep) from (0,Ly/2) to (Lx,Ly/2)
   elevation( phase) from (0,Ly/2) to (Lx,Ly/2)
   elevation( Ezr, Ezi, Ep) on 'outer'
   contour( Ezr)        	contour( Ezi)			
END "INS8EPUDp5xPdIvQzrEvrmbtIDLMIhrZ0STRYyB3XsCTY8ExJ4Y7NRlmPg7NnnW2Vmn21PN3jkP8UgN51xv22gET9DgFBx3USOTwVudwIksn8TtYfygcQp+KCWZiP1bbt05knz72YrCydUdP1CbiFwzxbHfWpGvgJl2aqBvWxJF"
