TITLE                                                      { elax4.pde }
   'Charged Ellipsoid'
{ Calculate the field around a charged, conducting ellipsoid. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 1e-3
COORDINATES
   ycylinder( 'r', 'z')
VARIABLES
   U
DEFINITIONS
   r1= 0.1                      r2= 0.3                 r3= 1
   eps= 8.854e-12               Q= 1e-9         Dn= Q/(4*pi*r3^2)
   Er= -dr(U)                   Ez= -dz(U)
   E= -grad(U)          Em= magnitude(E)
   Der= eps*Er          Dez= eps*Ez
   D= eps*E                     Dm= magnitude(D)
EQUATIONS
   (1/r)* dr( r*Der)+ dz( Dez)= 0
BOUNDARIES
region 1
   start(r1,0)  natural(U)= 0  line to (r3,0)
      natural(U)= Dn  arc(center= 0,0) to (0,r3)                { Outer }
      natural(U)= 0  line to (0,r2)
      value(U)= 0 arc(center= 0,0) to close            { Quarter ellipse }
feature
   start 'ellipsoid' (0,r2) arc(center= 0,0) to (r1,0)
feature
   start 'outer' (r3,0) arc(center= 0,0) to (0,r3)
PLOTS
   contour(U)           elevation(U) from (r1,0) to (r3,0)
   surface( Dm)  zoom(0,0, 2*r2,2*r2)
   vector( D) norm
   elevation( 2* 2*pi*r* (-normal(D))) on 'ellipsoid'   {  Charge }
   elevation( 2* 2*pi*r* normal(D)) on 'outer'          {  Charge }
END "J5vgxBJ63IBtaw7m+5QXFIDf+V/6QGxvfbyaJ6gUU58inUNggqp4p7JvjzR5rpLHU9eOr7nWyNdT6/cYwzCz62mtJpIo7t8MsGYQD0RjM78mQfxrLM8eYEhuV5GJDH6RS0BVRtDyCGtJWVDA89lnPZW5qxd845RsaRFo6qdHh7/"
