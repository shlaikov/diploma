TITLE 								        { flow111.pde }
   'Constricted Tube, Kinetic Energy and Work Input'
SELECT
   errlim= 1e-4   		plotintegrate= off
COORDINATES
   ycylinder('r','z')
VARIABLES
   phi
DEFINITIONS
   r0=0.5      	r1=1.0         	L=1.0
   vr=  dr(phi)          	vz=  dz(phi)
   v= vector( vr, vz) 	vm= magnitude( v)
   vz1=1.0        	p1=1e5         	dens=1e3
   p= p1+ 0.5*dens*(vz1^2-vm^2)
   div_v= 1/r*dr( r*vr)+ dz( vz)			{ Divergence in (r,z) }
   int_k1=  bintegral( 2*pi*r*(-vz)* 0.5*dens*vm^2, 'upper')	{ Kinetic… }
   int_k0=  bintegral( 2*pi*r*(-vz)* 0.5*dens*vm^2, 'lower')
   int_w1= bintegral( 2*pi*r*(-vz)*p, 'upper')      		{ Work… }
   int_w0= bintegral( 2*pi*r*(-vz)*p, 'lower')
EQUATIONS
   (1/r)* dr( r* dr(phi))+ dzz( phi)= 0
BOUNDARIES
region 'domain'
   start 'outer' (r1,3*L)
   natural( phi)= -vz1   	line to (0,3*L)		{ In }
   natural( phi)= 0		line to (0,0)
   value( phi)= 0       	line to (r0,0) 		{ Out } 	
   natural( phi)= 0  	line to (r0,L) to (r1,2*L) to close
feature			{ Liquid to the left of the line }
   start 'upper' (r1,3*L) line to (0,3*L)
feature				
   start 'lower' (0,0) line to (r0,0)
PLOTS
   contour( vm) painted         	contour( p) painted    	
   contour( div_v)		 	vector( v) norm
      report( int_w1)  report( int_w0)  report( int_k1)  report( int_k0)
   elevation( p) from (0,3*L) to  (0,0)
      report( int_w1- int_w0)  report( int_k0- int_k1)
   elevation( vz) on 'outer'
END "Aq262SwfZ1CMrS4qWiZyitD2o5svtHYrtTYmStiwzE9B4I9+qgH5Y+lFVgsRv268g37qh1i5CWr/2lTJZAK9bbRmwVvtYEDRJYsLkKLwVsjp7ZiN6YS90JmfHO1ob+nuCV5kl6c2jN58tSQ18CIsst4s/mYZCmQXIkE/4TDoN06"
