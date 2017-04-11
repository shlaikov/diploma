TITLE                                                           { elec4.pde }
   'Positive and Negative Charges'
{ Plot the potential and the electric field around two point charges. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   ngrid= 20
COORDINATES
   ycylinder( 'r', 'z')
DEFINITIONS                                             { SI units }
   Lr= 2                Lz= 1                d0= 1e-6*Lz
   q1= -1               q2= 1                           { Charges }
   eps0= 8.85e-12               c= 1/(4*pi*eps0)
   U= c* (q1/sqrt(r^2+(z+d0)^2)+ q2/sqrt(r^2+(z-d0)^2))
   Er= -dr(U)           Ez= -dz(U)              { Field components }
   E= -grad(U)          Em= magnitude(E)
   E_angle= sign(Ez)* arccos(Er/Em)/pi*180              { Degrees }
   D= eps0*E                                                    { Field D }
BOUNDARIES
region 1
   start(0,-Lz)   line to (Lr,-Lz) to (Lr,Lz)  to (0,Lz) to close
feature
   start 'can' (0,-Lz) line to (Lr,-Lz) to (Lr,Lz) to (0,Lz) to (0,-Lz)
PLOTS
   contour( abs(U)) log
   contour( Er)                 contour( Ez)
   contour( abs(Er)) log                contour( abs(Ez)) log
   contour( Em)  log
   vector( Er/Em, Ez/Em)                contour( E_angle)
   elevation( 2*pi*r*normal( D)) on 'can'
   contour( curl(E))                                    { curl_z }
END "HoexUyaPCprY9uAdOtvk1WuHWc+iELb2q7pINJmqBjUemD3nuVZRrvgo7Xi+96o9vCiGc+ngfj69fdpe7QIV+wFLif4P633Oqf3SDvCQxNkbgphXD92olkpdss8GV+NDeW9IpZRmRG0oDeftahiCRpOSYQNT6f6aEox6hTuHuCI"
