TITLE								      { flow101b.pde }
   'Viscous Flow past a Circular Cylinder, Dissipation'
SELECT
   errlim= 5e-3
VARIABLES
   vx      vy       p
DEFINITIONS
   Lx=1.0         	Ly=1.0       	a=0.2		visc=1e4
   delp=1e2							{ Driving pressure }
   dens=1e3	Re= dens* globalmax( vx) *2*Lx/visc	
   v= vector( vx, vy) 		vm= magnitude( v)
   div_v= dx( vx)+dy( vy)	curl_z= dx( vy)- dy( vx)		{ Vorticity }
   unit_x= vector(1,0)		unit_y= vector(0,1)
   natp= visc*( normal( unit_x)*del2(vx)+ normal( unit_y)*del2(vy))
   Pd= visc*( 2*dx(vx)^2+ (dy(vx)+ dx(vy))^2+ 2*dy(vy)^2)
EQUATIONS
   vx:	dx( p)- visc* del2( vx)= 0
   vy:	dy( p)- visc* del2( vy)= 0
   p:	del2( p)- 1e4*visc/Ly^2* div_v= 0
BOUNDARIES
region 'domain'  start 'outer' (-Lx,Ly)
   natural( vx)=0   natural( vy)=0    value(p)=delp			{ In }
   line to (-Lx,-Ly)  value( vx)=0   value( vy)=0   natural(p)= natp
   line to (Lx,-Ly)  natural( vx)=0    natural( vy)=0   value(p)=0  	{ Out }
   line to (Lx,Ly)  value( vx)=0  value( vy)=0   natural(p)= natp
      line to close
   start 'cylinder' (a,0)						{ Exclude }
   value( vx)=0  value( vy)=0   natural(p)=natp
      arc( center= 0,0) angle= -360 close
PLOTS
   contour( vm) painted 		contour( Pd) painted
   elevation( vx*p) on 'outer'
END "B/1lo+hNpvzO56Aw61yQqPtK0/dVFeW+rdZ4XwRTWdIx3lfw1/D9xPdv2wb532830xbrYgcganXlGcAv4FlI1TLpKlVsBhSrZ0SlNHz0pTybCqA0QpEWugZMHLwQd9kmQnNBjA0SoVc6UxF/s0jH/UbU0uTcHciC4EBrQceseeN"
