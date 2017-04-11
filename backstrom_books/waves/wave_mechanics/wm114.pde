TITLE                                                        { wm114.pde }
   'Hydrogen Molecule Ion, m=0'
{ From "Waves by Finite Element Analysis" by Gunnar Backstrom }
SELECT
   errlim= 1e-3      modes= 6            plotintegrate= off
COORDINATES
   ycylinder('r','z')
VARIABLES
   psi
DEFINITIONS
   r0= 0.2e-10        r1= 10e-10
   z0= 1.06e-10/2          { Half-distance between protons }
   m= 0
   e= 1.60219e-19         me= 9.1096e-31          h= 6.6262e-34
   eps0= 8.854e-12  c= (8* pi^2* me)/h^2
   V= e^2/(4*pi*eps0* (2*z0))         { proton - proton }
      -e^2/((4*pi*eps0)*sqrt(r^2+(z-z0)^2))    { e - proton }
      -e^2/((4*pi*eps0)*sqrt(r^2+(z+z0)^2))    { e - proton }
   V0= 50e-19     E_i= lambda- V0
   int_rzphi= integral( 2*pi*r* psi^2)    psi1= psi/ sqrt( int_rzphi)
EQUATIONS
   1/r*dr(r*dr(psi))- m^2/r^2*psi+ dzz(psi)
          -(V+V0)*c*psi+ lambda*c*psi= 0
BOUNDARIES
region 'domain'
   start(0,-r1)          value(psi)= 0
   arc to (r1,0)  to (0,r1)  natural(psi)= 0 line to close
feature            { To densify grid }
   start(0,-r0+z0) arc(center= 0,z0) angle= 180
feature
   start(0,-r0-z0) arc(center= 0,-z0) angle= 180
PLOTS
   contour( psi)   report( E_i)
   surface( psi1^2)  viewpoint(1,-1,20)
   surface( psi1^2)  zoom(0,-r1/4,  r1/4,r1/2)  viewpoint(1,-1,20)
      report( E_i)
END "EU/Sif2z5iywtFYCyVH4/9tIjVoRHzikR6tt4pL2DKDK/0J9pnh1lWqPpTnFfa8BheYVWk5qNKw4gOCOoY45pUbuaV+gQ61+otlY7I72tGzrVSjlf552BzKlzjc1TcpoNDAPHLadcf/vpNRvnD5cHpJ4Zw71cUje/3p2LhTM+/T"
