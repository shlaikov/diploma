TITLE                                                      { elec12.pde }
   'Plate Capacitor in (x,y) Space'
{ Find the field in and around a capacitor consisting of slats extending in the z direction. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 1e-3
VARIABLES
   U
DEFINITIONS                                     { SI units }
   L= 1            xx= 0.25     d0= 0.1      dd0= 0.4*d0
   Ex= -dx(U)        Ey= -dy(U)         U0= 1e4
   E= -grad(U)  Em= magnitude(E)
   eps0= 8.854e-12         eps                          { eps reserved }
   Dex= eps*Ex          Dey= eps*Ey
   D= eps*E                     Dm= magnitude(D)
EQUATIONS
   div( D)= 0                                           { No volume charge }
BOUNDARIES
region 1            eps= eps0                   { Vacuum }
   start 'outer' (-L,-L)   natural(U)= 0        { Outer boundary }
   line to (L,-L) to (L,L)  to (-L,L) to close
   start 'upper' (-xx,d0+dd0)                   { Upper plate }
   value(U)= U0  line to (xx,d0+dd0) to (xx,d0)  to (-xx,d0) to close
   start 'lower' (-xx,-d0)                            { Lower plate, ground }
   value(U)= 0.0  line to (xx,-d0) to (xx,-d0-dd0) to (-xx,-d0-dd0) to close
region 2           eps= 7.0*eps0                { Glass }
   start(-xx,-d0)  line to (xx,-d0)  to (xx,d0) to (-xx,d0) to close
PLOTS
   contour( U)
   contour( Dm) log             vector( D) norm
   elevation( Dm) on 'upper'                            { Integral   charge }
   elevation( Dm) on 'lower'                            { Integral   charge }
   elevation( Dey) from (-L,0) to (L,0)         { Integral   charge }
   elevation( normal(D)) on 'outer'                     {   Total charge }
   surface( Dm) log
END "HFh+354ABSvb2HFAmci9umL4D2m70P02jwM3CzjV2VGSqEeVife1lDAs7uoz0v9t0JAovoJpyYgjCovHsLz2Dam7Qoue3bYb+DyPNkU/zu3RAdp9WKxN0XdeLNeLoXg+1YM3M6aYETHapI+rWNHlKJh1qwtdgMWA199jdlWYJ4n"
