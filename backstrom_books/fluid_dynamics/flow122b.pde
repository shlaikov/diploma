TITLE 								      { flow122b.pde }
   'Viscous Flow by Gravity through a Funnel, Dissipation'
SELECT
   errlim=1e-2
COORDINATES
   ycylinder('r','z')
VARIABLES
   vr      vz       p
DEFINITIONS
   L=1.0		r1=1.0      	g=9.81 		dens=1e3	
   visc=1e4 		Fz=-dens*g
   v= vector( vr, vz)        	vm= magnitude( v)
   Re= dens* globalmax(vm)* r1/ visc
   div_v= 1/r*dr(r*vr)+ dz(vz)	curl_phi= dz(vr)-dr(vz)
   unit_r= vector(1,0)		unit_z= vector(0,1)
   natp= normal( unit_z)*Fz+
      visc* ( normal( unit_r)* ( 1/r*dr(r*dr(vr))- vr/r^2+dzz(vr))+
      normal( unit_z)* ( 1/r*dr(r*dr(vz))+ dzz(vz)) )
   power_d= visc*( 2*dr(vr)^2+ (dz(vr)+dr(vz))^2+ 2*dz(vz)^2)
   power_g= integral( -2*pi*r* vz*dens*g)		{ Gravitational power }
EQUATIONS
   vr:	dr(p)- visc*( 1/r*dr(r*dr(vr))- vr/r^2+ dzz(vr))= 0		
   vz:	dz(p)- Fz- visc*( 1/r*dr(r*dr(vz))+ dzz(vz))= 0			
   p:	1/r*dr( r*dr(p))+ dzz(p)- 1e4*visc/L^2* div_v= 0		
BOUNDARIES
region 'domain'
   start 'outer' (0,0)      value(vr)=0   natural(vz)=0
   value(p)=0     line to (r1,0)   						{ In }
   value(vr)=0   value(vz)=0   natural(p)=natp  line to (r1,L)
   to (3*r1,3*L)  to (3*r1,3*L)
   value(vr)=0   natural(vz)=0  value(p)=0    	line to (0,3*L)	{ Out }
   value(vr)=0   natural(vz)=0   natural(p)=0    	line to close
PLOTS
   contour( vz) report( Re) 	contour( vr)       	contour( p) painted
   vector( vr, vz) norm     	contour( curl_phi) painted
   contour( 2*pi*r* power_d) painted  report( power_g)
END "BgE9h1hsnyhG43nyPYpEjc54afDJ+S/yOz1RpU70nrtsv9XSMZqZH2E6G/0goyWYuYp+uTRyQdkd2SM65uVUEUK/xaSFoTLRzSnBC9p/wmjHioSdeYtSzIMhf43ynnXhmqW44m/M4BQ8LYcxZZ1ZopRUO+VENRFq1AS+VXdaONf"
