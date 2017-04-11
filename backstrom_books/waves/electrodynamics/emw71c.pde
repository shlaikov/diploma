TITLE							  	       { emw71c.pde }
   'Scattering in (x,y), Implicit Wave'		
{ From "Waves by Finite Element Analysis" by Gunnar Backstrom }				
SELECT								
   errlim= 1e-3	ngrid= 30	      regrid= off	   vandenberg= on
VARIABLES
   Ezr        		Ezi				        	
DEFINITIONS                                        	
   r0= 0.3		r1= 1.0	       	
   eps0= 8.85e-12       	eps= eps0		
   mu0= 4*pi*1e-7       	mu= mu0		omega=10e9		
   k= omega* sqrt( mu*eps)	r= sqrt( x^2+ y^2)
   Ewr= cos(k*x)		Ewi= -sin(k*x)
   add= 0			{ For changing the orientation }
   ang1= pi/180* (290+ add)	x1= r0*cos( ang1)	y1= r0*sin( ang1)
   ang2= pi/180* (160+ add)	x2= r0*cos( ang2)	y2= r0*sin( ang2)
   ang3= pi/180* (90+ add)	x3= r0*cos( ang3)	y3= r0*sin( ang3)
EQUATIONS
   Ezr:	del2(Ezr)+ k^2*Ezr= 0
   Ezi:	del2(Ezi)+ k^2*Ezi= 0
BOUNDARIES
region 'vacuum'  	start 'outer' (r1,0)
   natural(Ezr)= k*Ezi 		natural(Ezi)= -k*Ezr
      arc( center= 0,0) angle= 360  close
   start 'inner' (x1,y1)	value(Ezr)= -Ewr	 value(Ezi)= -Ewi
      line to (x2,y2) to (x3,y3) to close
PLOTS	
   contour( Ewr) painted	
   contour( Ezr) painted 		contour( Ezi) painted
   contour( Ezr+ Ewr) painted		contour( Ezi+ Ewi) painted
   elevation( Ezr+Ewr, Ezi+Ewi) from (-r1,0) to (r1,0)
END "KJFR8wOlyoeFFKQCk96noKKmDQTSi5xxOUSFZpAQ1B8gNe3WjD/k923t1GJcxu7KXn9cCqirwRtIDzorVApF/jN4IGeqzMYBHTuxsFBlrtVCzGhD7zi3OOc7rqO1iPa4AYHl4cqtYG72KZ1E6PA4RNZUCVl0xV4u2mP9Xu92bkL"
