{ Include file for axial symmetry }					  { defuw.pde } 
   Q= E/((1-2*mu)*(1+mu))    	G= E/(2*(1+mu))   
   uw= vector( u, w)		uwm= magnitude( uw)
   er= dr(u)	   et= u/r      ez= dz(w)	 		{ Strain }
   sr= Q*( (1-mu)*er+ mu*et+ mu*ez)		{ Constant T }
   st= Q*( mu*er+ (1-mu)*et+ mu*ez)
   sz= Q*( mu*er+ mu*et+ (1-mu)*ez)
   erz= dz(u)+dr(w)	srz= G*erz			{ Shear strain & stress }
   mises= sqrt( 0.5*( (sr-st)^2+ (sr-sz)^2+ (st-sz)^2)+ 3*srz^2)
   p_ang= 0.5* arctan( 2*srz/(sr-sz) )   		{ Radians }
   srp0= 0.5*(sr+sz)+ 0.5*(sr-sz)*cos(2*p_ang)+ srz*sin(2*p_ang)
   szp0= 0.5*(sr+sz)+ 0.5*(sr-sz)*cos(2*(p_ang+pi/2))
      	+ srz*sin(2*(p_ang+pi/2))
		  						{ Test for highest value }
   p_angl=   if srp0>szp0 then p_ang    else p_ang+ pi/2
   srp=   if srp0>szp0 then srp0    else szp0	{ Principal stress }
   szp=   if srp0>szp0 then szp0    else srp0
   p_angle= p_angl * 180/pi                     		{ Degrees }
   energy_d= (1/2)*( sr*er+ sz*ez+ srz*erz)	{ Energy density }
