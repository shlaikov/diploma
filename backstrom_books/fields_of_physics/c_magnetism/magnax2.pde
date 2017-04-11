TITLE                                                 { magnax2.pde }
   'Helmholtz Coil'
{ A system of two coils yielding a highly constant internal field. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 3e-4
COORDINATES
   ycylinder( 'r', 'z')
VARIABLES
   A_phi
DEFINITIONS
   r1= 0.3                      r2= 0.5                         r3= 2.0
   z0= 0.1              L= 1.0                          d0= 0.2
   mu0= 4*pi*1e-7                       mu= mu0                         J_phi
   Br= -dz(A_phi)                       Bz= (1/r)* dr(r*A_phi)
   B= vector( Br, Bz)           Bm= magnitude( B)
   Hr= Br/mu    Hz= Bz/mu                 H= B/mu             Hm= Bm/mu
EQUATIONS
   dr( Hz)-dz( Hr)+ J_phi= 0
BOUNDARIES
region 1                                J_phi= 0
   start(0,-L)         value(A_phi)= 0
   line to (r3,-L)    to (r3,L)   to (0,L) to close
region  'coil 1'                J_phi= 1
   start(r1,-d0-z0)
   line to (r2,-d0-z0) to (r2,-d0+z0) to (r1,-d0+z0) to close
region  'coil 2'                J_phi= 1
   start(r1,d0-z0)
   line to (r2,d0-z0) to (r2,d0+z0) to (r1,d0+z0) to close
PLOTS
   contour( A_phi)
   contour( Bm)                 vector( B)  norm
   surface( Bm)  zoom(0,-r2/6,  r2/3,r2/3)
   vector( B)  norm  zoom(0,-r2/6,  r2/3,r2/3)
END "HoIgOCBX4uheS0P4j5XotjLVMwkX8YL0W55n/nyWiBKdqd3oFHYKiKh9fRw/ZEi1rxgwbkWTp08+Ee/dVzXWg3QuRK1AI1L5b0uCwCqGp5WX91ITg+L4w+KVuKVr+eWqS5QM+LpqEIsOFLpKK63pQJ5HRlOjMuv/OhQhyCPWsu0"
