TITLE  									   { def53.pde }
   'Displacements and Temperature '
{ Steel block, heated over half of the upper face }
{ From "Deformation and Vibration" by Gunnar Backstrom }
SELECT
   errlim= 1e-4
VARIABLES
   u  	v    dtemp
DEFINITIONS
   Lx= 100e-3             	Ly = 200e-3
   mu = 0.3             	E  = 200e9       		{ Steel }
   C= E/(1-mu^2)       	G = E/(2*(1+mu))
   alpha= 1e-5                          			{ Thermal expansivity }
   k= 45						{ Thermal conductivity }
   uv= vector( u, v)	uvm= magnitude( uv)
   ex= dx(u)            	ey= dy(v) 		exy= dx(v)+ dy(u)
   sx= C*(ex+ mu*ey- (1+mu)*alpha*dtemp)    	
   sy= C*(mu*ex+ ey- (1+mu)*alpha*dtemp)       	
   sxy= G*exy
   p_ang= 0.5* arctan( 2*sxy/(sx-sy) )   		{ Radians }
   sxp0= 0.5*(sx+sy)+ 0.5*(sx-sy)*cos(2*p_ang)+ sxy*sin(2*p_ang)
   syp0= 0.5*(sx+sy)+ 0.5*(sx-sy)*cos(2*(p_ang+pi/2))
      	+ sxy*sin(2*(p_ang+pi/2))
		  						{ Test for highest value }
   p_angl=   if sxp0>syp0 then p_ang    else p_ang+ pi/2
   sxp=   if sxp0>syp0 then sxp0    else syp0
   syp=   if sxp0>syp0 then syp0    else sxp0
   p_angle= p_angl * 180/pi                     		{ Degrees }
   mises= sqrt( 0.5*( (sx-sy)^2+ sx^2+ sy^2)+ 3*sxy^2)
EQUATIONS       		
   u:	dx( sx) + dy( sxy)= 0
   v:	dx( sxy)+  dy( sy)= 0
   dtemp:	dx(-k*dx( dtemp))+ dy(-k*dy( dtemp))= 0	{ Third PDE }
BOUNDARIES
region 'steel'
   start  'outer'  (-Lx,0)
   value( dtemp)= 0     	load(u)= 0           	load(v)= 0     line to (Lx,0)
   natural( dtemp)= 0        	line to (Lx,Ly)
   value( dtemp)= 300   	line to (0,Ly)
   natural( dtemp)= 0   		line to (-Lx,Ly) to close
region 'other'        alpha= 2e-5
   start 'inner' (-Lx,Ly/2)   line to (Lx,Ly/2) to (Lx,Ly) to (-Lx,Ly) to close
PLOTS
   grid(x+100*u, y+100*v) 		contour(dtemp)
   contour( u)      		contour( v)  		vector( uv) norm
   contour( sx)          	contour( sy)             	contour( sxy)
   elevation( u, v) on 'outer'
   elevation( sx) on 'outer'   		elevation( sy) on 'outer'
   contour( p_angle)
   vector( cos(p_angl)*sxp, sin(p_angl)*sxp) norm notips as ' "Tension" '
   contour( sxp)		contour( syp)   	   	contour( Mises)
   contour( sxp) painted		contour( syp) painted
   contour( Mises) painted	
END "Cq7QN4v7ktnTtYlKc1tvzTK6TfRQ/mlTefoe1WqFf5ER6c+K9Naac5ShOLei2ycFT+WWL2fC66LWe+HccnHdxlna7MpmOOjXMXRWC46lDysNTWoahXG65/adVnp4htv/a8frgrS36T5mzqCev+wzAp9cRj97bo4m8X2TVRDRPCw"
