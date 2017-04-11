TITLE									   { vib44.pde }
   'Cylindrical Resonator'
{ Forced acoustical vibration }
{ From "Deformation and Vibration" by Gunnar Backstrom }
SELECT
   errlim= 1e-4        	
VARIABLES
   phi_r   	phi_i                    		{ Real and imaginary potential }
DEFINITIONS
   omega= 70
   L= 10         h= 4         dens= 1.176       Bs= 1.4e5  	{ Air }
   vx_r= -dx(phi_r)      vx_i= -dx(phi_i)	{ Velocity components }
   vy_r= -dy(phi_r)      vy_i= -dy(phi_i)	
   v_r= vector( vx_r, vy_r)		v_i= vector( vx_i, vy_i)
   v_rm= magnitude( v_r)		v_im= magnitude( v_i)
   p_real= -dens* omega* phi_i  		{ Pressure }
   p_imag= dens* omega* phi_r
EQUATIONS
   phi_r:	del2(phi_r)+ dens* omega^2/ Bs*phi_r= 0
   phi_i:	del2(phi_i)+ dens* omega^2/ Bs*phi_i= 0
BOUNDARIES
region 'air'
   start (0,-0.5*h)      natural(phi_r)= 0    	natural(phi_i)= 0
   line to  (L,-0.5*h)   arc to  (L+ 4*h, 0) to (L,0.5*h)   line to (0,0.5*h)
   natural(phi_r)= 1    line to close
PLOTS
   elevation( vx_r, vx_i) from (0,0) to (L+4*h,0)
   contour( vx_r)           		contour(vx_i)
   contour( vy_r)           		contour(vy_i)
   contour( p_real)       		contour( p_imag)
   vector( v_r)  norm     		surface( p_imag)
END "FHRUp+SB+xwn6xBjEyNX1dr5Y7JnK2q7f7HOchWS+UyoWDGG0V8n8bqtQipDI/rf8xQeslC0zNYLeXkvmuoAUF49R4wA+ZRmK3lHWm4Jnb8MSJGrX9XG6eUne3INW6hAt7DaDWg0oOk3ihATMf3D/aAvVMxYFCbyABO7ehpBiRg"
