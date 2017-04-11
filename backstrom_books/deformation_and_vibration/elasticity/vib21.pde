TITLE 								{ vib21.pde }
   'Eigenstates of a Membrane '       	
{ Vibrations perpendicular to the plane of the membrane }
{ From "Deformation and Vibration" by Gunnar Backstrom }		
SELECT
   modes= 16		errlim=0.01    	plotintegrate= off      	
VARIABLES
   w
DEFINITIONS
   r0= 0.1			freq= sqrt( lambda)
EQUATIONS
   del2( w)+ lambda*w= 0			{ Laplace operator }
BOUNDARIES
region 'membrane'   	
   start(r0,0)
	value(w) = 0  arc to (0,r0) to (-r0,0) to (0,-r0) to close
MONITORS
   contour( w) report( freq)
PLOTS
   contour( w) report( freq)         		surface( w)
END "FCGzDAAwirHDfK0DjZjKjA40iGrgz/jpz0gGBS34DYTei8LIAa8Yi5iC6hIkRr7Z0rx7hqKj8SD8pTtH4hOWUzm/0RdID75b8rcQHYS8sBB3r4GHP5uFEIpmEFh9zGkfgJ0+vRwRfTwXr6Z71rXbm1zsMAX5bufZhHZ4AU5SzyW"
