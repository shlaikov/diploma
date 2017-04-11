TITLE								  	{ emw55.pde }
   'Alternating Current Above a Metal Plate'	
{ From "Waves by Finite Element Analysis" by Gunnar Backstrom }					
SELECT								
   errlim= 3e-4					
VARIABLES
   Ezr        	Ezi				        	
DEFINITIONS                                        	
   r0= 0.002        	L= 0.1	         d0= 0.005		dp= 0.05
   eps0= 8.85e-12       	eps= eps0
   mu0= 4*pi*1e-7       	mu= mu0		sigma	Jz0r			
   omega= 2*pi*50    	        		{ 50 Hz }
#include 'emw_xy.pde'
EQUATIONS
   Ezr:	div( grad( Ezr)/mu)+ eps*omega^2*Ezr+ sigma*omega*Ezi= 0
   Ezi:	div( grad(Ezi)/mu)+ eps*omega^2*Ezi- sigma*omega*Ezr
   		-Jz0r*omega= 0
BOUNDARIES
region 'vacuum'    	sigma= 0		Jz0r= 0	
   start 'outer' (-L,-L)      	value( Ezr) = 0 		value( Ezi) = 0
   line to (L,-L) to (L,L) to (-L,L) to close
region 'wire' 	sigma= 5.99e7      Jz0r= 10/(pi*r0^2) 	{ I= 10 A }
   start (-r0,0)  arc to (0,-r0) to (r0,0) to (0,r0) to close
region 'plate' 	sigma= 5.99e7		Jz0r= 0	         { Plate }
   start(-L,-d0-dp) line to (L,-d0-dp) to (L,-d0) to (-L,-d0) to close
PLOTS
   contour( Ezr)		contour( Ezi)
   vector( Br) norm	vector( Bi) norm
   contour( Brm)		contour( Bim)	
   contour( sigma*Ezi) painted on 'plate'	surface(sigma*Ezi) on 'plate'
   elevation( Brm, Bim) from (0,-d0-dp) to (0,-d0)
   elevation( normal( Br), Brm, normal( Bi), Bim) on 'outer'
END "EXn+XdjnMIha6JTbt7aWwRQBrX/TDvSLgwcznuDp+vuaDxac03xH/3/ni5ko8iaTIL7j4UTYhTmi/sFUaVmoJFQM8+w41xyPDN5Ix5FvlkCy+QqH3YtIMc2b1f78Ld5DSMyF7trF0VBbjqMTHpuM/42BUFQ2OsgItjzl9AqwhJT"
