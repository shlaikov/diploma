TITLE							 	          { flow83.pde }
   'Forces on an Airfoil'
SELECT
   errlim= 1e-3			plotintegrate= off
VARIABLES
   phi		psi                                 	{ Velocity potentials }
DEFINITIONS
   Lx=1.0                	Ly=1.0        	
   a=0.2*Ly            	d=0.1* a		vx0=1		
   alpha= 20* pi/180     		{ Angle of attack, radians  }
   si= sin( alpha)                  	co= cos( alpha)
   x1= -a*co- d*si		y1= a*si- d*co
   x2= a*co		y2= -a*si
   x3= -a*co+ d*si		y3= a*si+ d*co	
   p0= 1e5              		{ Atmospheric pressure at left end }
   dens= 1e3			{ Mass density }
   omega			m		liq= 1-omega
   vx=  dx( phi)            	vy=  dy( phi)      		{ Velocity components }
   v= vector( vx, vy)		vm= magnitude( v)
   vcx=  dy( psi)           	vcy=   -dx( psi)  		{ Circulating field }   	
      vc= vector( vcx, vcy)		vcm= magnitude( vc)
      c2= -30    	v2x= vx+ c2*vcx		v2y= vy+ c2*vcy
   v2= vector( v2x, v2y)    	v2m= magnitude( v2) 	{ Combined }
      p2= p0+ 0.5*dens*( vx0^2- v2m^2)         	
   unit_x= vector( 1,0)		unit_y= vector( 0,1)	{ Cosines }
   force_x= p2*normal( unit_x)		force_y= p2*normal( unit_y)
   int_fx= bintegral( force_x,'-airfoil')		{ Integrated fx }
   int_fy= bintegral( force_y,'-airfoil')		{ Integrated fy }
   int_v2= bintegral( tangential(v2), '-airfoil')	{ Circulation }
   K_J= dens*vx0* int_v2			{ Kutta-Joukowski lift force }
EQUATIONS
   phi:	div( m*grad( phi))= 0
   psi:	div( 1/m*grad( psi))+ omega=  0
BOUNDARIES
region 'domain'    		omega=0		m=1
   start 'outer' (-Lx,Ly) point value( phi)= 0	value( psi)= 0
      natural( phi)= -vx0   line to (-Lx,-Ly)
      natural( phi)=  0     	line to (Lx,-Ly)
      natural( phi)= vx0   	line  to (Lx,Ly)
      natural( phi)= 0	line to close
region 'airfoil'         	omega= 1		m= 1e-10                           	
   start 'airfoil' (x1,y1) arc( radius= 6*a) to (x2,y2)  		
      arc( radius= 6*a) to (x3,y3) arc( radius= 1.006*d)   to close
feature start '-airfoil' (x3,y3) arc( radius= -6*a) to (x2,y2)  		
      arc( radius= -6*a) to (x1,y1) arc( radius= -1.006*d)   to (x3,y3)
PLOTS  	
   elevation( normal( unit_x)) on 'airfoil'    { Direction cosine }
   vector( liq* v) norm	   vector( liq* vc) norm 	
   vector( liq*v2) norm  zoom(-2*a,-2*a,  4*a,4*a)
   contour( p2-p0) painted
   elevation( force_y) on '-airfoil'
      report( int_v2)  report( int_fx) report( int_fy)  report( K_J)
   contour( liq*div( v2))		contour( curl( v2)) painted	
END "EYlNKhflWmhdN3E5GsMqlzQGNmcaO4oDFEn//lqDamtj5fVlompPol8xjGYcAK+CiuYoSg//LEek6JuDB6NTUYfG07/lOJ3GsTWkrH9joPZb8f4fZrJnOwk/WjJaD3AYfEGT9h07kZJhiLfxVw4PiJdcPM5AeNb9Lg6eSZtvk8d"
