TITLE								          { flow95.pde }
   'Channel With a Lateral Cavity'
SELECT
   errlim=1e-2   	
VARIABLES
   vx      vy       p
DEFINITIONS
   delp=1e-6	
   Lx= 1.0         		Ly= 1.0     		visc= 1.0	
   vy0= 1e-5				{ Input velocity }
   dens= 1e3	Re= dens* globalmax( vx) *2*Lx/visc	
   v= vector( vx, vy) 	vm= magnitude( v)
   v_angle= sign( vy)* arccos( vx/vm)/pi*180
   div_v= dx( vx)+dy( vy)	curl_z= dx( vy)- dy( vx) 	{ Vorticity }
   unit_x= vector(1,0)		unit_y= vector(0,1)
   natp= visc* ( normal( unit_x)* del2( vx)+ normal( unit_y)* del2( vy))
EQUATIONS
   vx:	dx( p)- visc* del2( vx)= 0
   vy:	dy( p)- visc* del2( vy)= 0
   p:	del2( p)- 1e4*visc/Ly^2* div_v= 0			{ 3rd PDE }
BOUNDARIES
region 'domain'  start 'outer' (0,Ly)
   natural(vx)=0   value( vy)=0   value(p)=delp			{ In }
   line to (0,0)   value(vx)=0     value(vy)=0    natural(p)=natp
   line to  (Lx,0) to (Lx,-Ly) to (2*Lx,-Ly) to (2*Lx,0) to (3*Lx,0)
   natural(vx)= 0    value(p)=0    line to (3*Lx,Ly)  		{ Out }
   value(vx)= 0   natural(p)=natp  line to close
PLOTS
   vector( v)  norm  report( Re)   		contour( vm) 	
   vector( v)  norm  zoom(Lx,-Ly,  Lx,Ly)		contour( p)	
   contour( div_v)			contour( curl_z) painted
   elevation( vx) from (0.5*Lx,0) to (0.5*Lx,Ly)
   elevation( vx) from (1.5*Lx,-Ly) to (1.5*Lx,Ly)
   elevation( vx) from (2.5*Lx,0) to (2.5*Lx,Ly)
END "Ji7v+1vQJZ7EwA22YGBUGwBFfWlqYtnHxBidEZOnHX8VJDu7T2BqDw4B9yPHkYmh4/5htXgMBo+PkhU4XJP7tpNWYiy51xE6qHyK72jDaNmaVRGgUy/6cz3AAu4IEOz3W5THLGlG6XIpqC//y1oHR7+UGx4GhsY1gk5qXv8jQCG"
