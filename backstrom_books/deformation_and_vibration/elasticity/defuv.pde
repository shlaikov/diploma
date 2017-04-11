{ Block of commands for later descriptors }		                 { defuv.pde }
   C= E/(1-mu^2)       	G = E/(2*(1+mu))
   uv= vector(u,v)		uvm= magnitude( uv)
   ex= dx(u)            	ey= dy(v)                	exy= dx(v)+ dy(u)
   sx= C*(ex+ mu*ey)    	sy= C*(mu*ex+ ey)       sxy= G*exy
   ez= -mu*(sx+ sy)/E
   p_ang= 0.5* arctan( 2*sxy/(sx-sy) )   		{ Radians }
   sxp0= (sx+sy)/2+ (sx-sy)/2*cos(2*p_ang)+ sxy*sin(2*p_ang)
   syp0= (sx+sy)/2- (sx-sy)/2*cos(2*p_ang)- sxy*sin(2*p_ang)
		  		{ Test for highest algebraic value: }
   p_angl=   if sxp0>syp0 then p_ang    else p_ang+ pi/2
   sxp=   if sxp0>syp0 then sxp0    else syp0
   syp=   if sxp0>syp0 then syp0    else sxp0
   p_angle= p_angl * 180/pi                     		{ Degrees }
   mises= sqrt( 0.5*( (sx-sy)^2+ sx^2+ sy^2)+ 3*sxy^2)
   energy_d= (1/2)*( sx*ex+ sy*ey+ sxy*exy)	{ Energy density }
