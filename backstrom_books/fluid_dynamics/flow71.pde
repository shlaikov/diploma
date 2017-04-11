TITLE								 	{ flow71.pde }
   'Flow Through a Constricted Channel'
SELECT
   errlim= 1e-4         	
VARIABLES
   phi                                    	{ Velocity potential }
DEFINITIONS			{ SI units }
   Lx= 1                	Ly= 1             		
   coef= 0.5				{ Constriction coefficient }
   vx0= 3.0               		{ Velocity at input end }
   p0= 1e5              		{ Atmospheric pressure }
   dens= 1e3            		{ Mass density }
   vx=  dx(phi)            	vy=  dy(phi)      		{ Velocity components }
   v= vector( vx,vy)		vm= sqrt( vx^2+ vy^2)		{ Speed }
   p= p0+ 1/2*dens*(vx0^2-vm^2)         	{ Pressure }
   div_v= dx( vx)+ dy( vy)
   curl_z= dx( vy)- dy( vx)
EQUATIONS
   dxx( phi)+ dyy( phi)= 0
BOUNDARIES
region 'domain'   start 'outer' (0,Ly)
   natural( phi)= -vx0   line to (0,-Ly)					{ In }
   natural( phi)= 0   line to (Lx,-Ly)  to (2*Lx,-Ly*coef)  to (3*Lx,-Ly*coef)
   value( phi)= 0    line  to (3*Lx,Ly*coef)  				{ Out }
   natural( phi)= 0  line to (2*Lx,Ly*coef) to (Lx,Ly) to close
PLOTS
   contour( phi) 	contour( vm) painted    contour( p) painted
   contour( p) zoom(1.5*Lx,0  ,Lx,Ly)
   surface( p) zoom(1.5*Lx,0  ,Lx,Ly)	vector( v) norm
   elevation( vm) on 'outer'		{ Verify boundary conditions }
   contour( div_v)			contour( curl_z)
END "E+5vkdLUJ/sQ796bIOROji3+Vgj0Zzwes94FyX6UBf+D6koTd6PX73V9yqMo8789UtdBocAV0JC+EiyD3Ey1dRoqNucHelbyJTZXyQ8/W7KL02fqhocPjU2kxeslq5a75cxMDggzp5U20ywZom5Jw+3+54JaZIUlI0FEd+04kLB"
