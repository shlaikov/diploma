{
  This is a slight modification of Prof. Backstrom's problem.
  We have used linear basis for the pressure variable, because this
  helps stabilize the solution, and we have extended the pipe on the
  downwind side to avoid a boundary condition conflict at high
  velocity.
}
TITLE                        { flow132x.pde }
   'Viscous Flow Past a Circular Cylinder'
SELECT
   stages=4   errlim=3e-2
VARIABLES
   vx      vy(1e-3)       p
DEFINITIONS
   Lx=1.0           Ly=1.0         a=0.1    visc=1.0
   delp=staged( 1e-3,1e-2,0.1,1,10)   k=staged(0,1,1,1,1)
   dens=1e3    Re= dens* globalmax( vx) *2*Ly/visc
   v= vector( vx, vy)   vm= magnitude( v)
   div_v= dx( vx)+dy( vy)  curl_z= dx( vy)- dy( vx)    { Vorticity }
   unit_x= vector(1,0)    unit_y= vector(0,1)
   vxdvx= vx*dx(vx)+ vy*dy(vx)  vxdvy= vx*dx(vy)+ vy*dy(vy)
   natp= visc*( normal( unit_x)*del2(vx)+ normal( unit_y)*del2(vy))-
      k*dens*( normal( unit_x)*vxdvx+  normal( unit_y)*vxdvy)
   vx_ex=  delp/(3*Lx)/(2*visc)*(Ly^2- y^2)  { Exact solution }
EQUATIONS
   vx:  k*dens* vxdvx+ dx( p)- visc* del2( vx)= 0
   vy:  k*dens* vxdvy+ dy( p)- visc* del2( vy)= 0
   p:  del2( p)+ k*dens*(vxdvx+ vxdvy)- 1e4*visc/Lx^2*div_v= 0
BOUNDARIES
region 'domain'   start 'outer' (-Lx,Ly)
   natural( vx)=0   natural( vy)=0    value(p)=delp      { In }
   line to (-Lx,0)  natural( vx)=0   value( vy)=0   natural(p)=0
   line to (-a,0) value(vx)=0   value(vy)=0 natural(p)=natp
      arc( center= 0,0) angle= -180 to (a,0)       { Cylinder }
   natural( vx)=0   value( vy)=0   natural(p)=0
   line to (3*Lx,0)  natural( vx)=0   natural( vy)=0   value(p)=0    { Out }
   line to (3*Lx,Ly)  value( vx)=0  value( vy)=0   natural(p)= natp
   line to close
PLOTS
   contour( vx) painted report( Re)    contour( vm) painted
   vector( v) norm   vector( v) norm zoom(0,0, 5*a,5*a) report( Re)
   contour( p) painted  contour( div_v)
END "CnYqWs3ngVX7tCrxk4cSzcrgUfFZAuEGQLeEpN3CaQRd31gYqH+0ZgUNSwQfipbVFqyHRH7O6o+GVbBiJinZP2ITOBM2aoUaGVoOGGPv4vcGUGIEdyjeppsAp0ard32zbDO63rQXQ1VeuVDVft1pHmMXm6ZJKlbPnvikzwe5CYG"
