TITLE                         { flow141.pde }
   'Viscous Flow in a Tube at High Re'
SELECT
   stages=4
COORDINATES
   ycylinder('r','z')
VARIABLES
   vr(0.01)      vz
   p
DEFINITIONS
   L=2.0    r1=1.0    visc=1.0     dens=1e3
   delp= staged(1e-6,1e-2,1,10, 20)    { Successive values }
   k= staged(0,1,1,1,1)           { Linear-to-nonlinear }
   v= vector( vr, vz)            vm= magnitude( v)
   Re= dens* globalmax(vm)* r1/ visc
   div_v= 1/r*dr(r*vr)+ dz(vz)    curl_phi= dz(vr)-dr(vz)
   vz_ex= delp/(L* 4*visc)* (r1^2-r^2)     { Exact solution for Re<<1 }
   unit_r= vector(1,0)      unit_z= vector(0,1)
   vrdvr= vr*dr(vr)+ vz*dz(vr)    vrdvz= vr*dr(vz)+ vz*dz(vz)
   natp= visc*normal( unit_r)*(1/r*dr(r*dr(vr))- vr/r^2+ dzz(vr))+
      visc*normal( unit_z)*(1/r*dr(r*dr(vz))+ dzz(vz))-
      k*dens*(normal( unit_r)*vrdvr+  normal( unit_z)*vrdvz)
EQUATIONS
   vr:	k*dens* vrdvr+ dr(p)- visc*( 1/r*dr(r*dr(vr))- vr/r^2+ dzz(vr))= 0
   vz:	k*dens* vrdvz+ dz(p)- visc*( 1/r*dr(r*dr(vz))+ dzz(vz))= 0
   p:	1/r*dr( r*dr(p))+ dzz(p)+ k*dens*(1/r*dr(r*vrdvr)+dz( vrdvz))-
     		1e4*visc/L^2* div_v= 0
BOUNDARIES
   region 'domain'  start 'outer' (0,0)
   value(vr)=0   natural(vz)= 0  value(p)=delp     line to (r1,0)     { In }
   value(vr)=0   value(vz)=0   natural(p)= natp  line to (r1,L)
   value(vr)=0   natural(vz)=0  value(p)=0      line to (0,L)    { Out }
   value(vr)=0   natural(vz)= 0   natural(p)=0      line to close
PLOTS
   contour( vz) report( Re)   contour( vr)
   contour( p) painted     vector( v) norm
   elevation(vz, vz_ex) from (0,L) to (r1,L) report( Re)
   elevation( 2*pi*r*vz) from (0,0) to (r1,0)    { Flux… }
   elevation( 2*pi*r*vz) from (0,L) to (r1,L)
END "F7IJE87Qjqk+gX0kC69p4Uy7WsQpxvv199R6m8dyQSd/1BBnLYi643bcspw4Jm7ZIk2R5dazM4OfUciwU5EB063DNkaaUZc9QeZM5fHYsDmNLq81xOFioOgC+Ncu++5CPS7wVm8y8llyQ7/OQ7yhQJEhpeTTy27qVFArJvhqSMS"
