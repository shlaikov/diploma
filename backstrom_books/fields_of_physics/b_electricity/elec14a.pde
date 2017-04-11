TITLE                                                      { elec14a.pde }
   'Metal and Dielectric Rod Across a Parallel Field'
{ Field around one metallic and one dielectric rod. Mutual force. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 1e-5         plotintegrate= off
VARIABLES
   U
DEFINITIONS                                             { SI units }
   L= 4                         r0= 0.15                d0= 0.17
   eps0= 8.854e-12              epsr                    eps= epsr*eps0
   Ex0= 1e5                     Dx0= eps0*Ex0           { Far Field }
   Ex= -dx(U)                   Ey= -dy(U)
   E= -grad(U)          Em= magnitude(E)
   Dex= eps*Ex          Dey= eps*Ey
   D= eps*E                     Dm= magnitude(D)                P= (eps- eps0)*E
   F1= bintegral( -0.5*normal(D)*Ex, 'rod 1')   { Force on metal rod }
   fn= normal( P)* normal(E)*(epsr+1)/2         { Normal force / area }
   ft= normal( P)* tangential(E)                        { Tangential force }
   unitx= vector(1,0)                                   { Direction of x }
   f= fn* normal( unitx)+ ft* tangential( unitx)        { With direction cosines }
   F2= bintegral( f, 'rod 2')                           { Force on dielectric rod }
   Rel_dev= -(F1+F2)/F1
EQUATIONS
   div( D)= 0
BOUNDARIES
region 1        epsr= 1                         { Vacuum outside }
   start(-L,-L)         natural(U)= 0     line to (0,-L)  to (L,-L)
      natural(U)= Dx0           line to (L,L)
      natural(U)= 0                     line to (-L,L)
      natural(U)= -Dx0          line to close
   start 'rod 1' (-d0-r0,0)   value(U)= 0               { Metal }
      arc( center= -d0,0) angle= -360
region  'glass'         epsr= 7.0
   start 'rod 2' (d0+r0,0)                              { Elliptic }
   arc( center= d0,0) to (d0,2*r0) to (d0-r0,0) to (d0,-2*r0) close
PLOTS
   contour( U)   zoom(-2.5*d0,-2.5*d0,  5*d0,5*d0)
   contour( Dm)  zoom(-2.5*d0,-2.5*d0,  5*d0,5*d0)
   vector( D)  norm  zoom(-2.5*d0,-2.5*d0,  5*d0,5*d0)
      report( F1) as 'F1 on metal'      report( F2)             report( Rel_dev)
END "JvKE7UsiLifKGgjRprDypWuU8MNDx4snI4UsrmjeZ1sHTrH0l6KV48sB+JtrRR31CussykoUKx6OfCazGvlJRYDvLofQwUQHO49grHrruh8xK/FDIds6ibPva2nIvzyRJoL0IZxqSAalaUjLXvZv5zBvjIfhmjTmiPY6HYGaN5P"
