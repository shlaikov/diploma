TITLE                                                                                { grav2.pde }
   'Earth-Moon Gravitation, Zoomed'
{ Plot quantities relevant to the gravitational field around the Earth and the Moon. }
{ From "Fields of Physics" by Gunnar Backstrom }
DEFINITIONS                                                     { Basic SI units: m, kg }
   d= 3.84e8            Lx= d                   Ly= 2*d
   r1= 6.37e6                   r2= 1.74e6                      { Radii }
   m1= 5.98e24        m2= 7.35e22                       { Masses }
   U= -6.67e-11* (m1/sqrt(x^2+y^2)+ m2/sqrt(x^2+(y-d)^2))
   gx= -dx(U)                   gy= -dy(U)                      { Field strength }
   gm= sqrt(gx^2+gy^2)                                  { Magnitude of g }
BOUNDARIES
region 1
   start(-Lx,-Ly/4)
        line to (Lx,-Ly/4) to (Lx, 3/4*Ly) to (-Lx, 3/4*Ly) to close
   start(r1,0)                                          { Cut-out for the Earth }
      arc to (0,-r1) to (-r1,0) to (0,r1) to close
   start(r2,d)                                          { Cut-out for the Moon }
      arc to (0,d-r2) to (-r2,d) to (0,d+r2) to close
PLOTS
   grid(x,y)
   contour( gm) zoom(-2*r1,-2*r1,4*r1,4*r1)  as 'Magnitude of g'
   contour( gm) zoom(-10*r2,d-10*r2,20*r2,20*r2)
   contour( arctan( gy/gx)/ pi*180)
      zoom(-50*r2,d-50*r2,100*r2,100*r2)  as 'G_field direction'
   vector( gx/gm, gy/gm) zoom(-25*r2,d-25*r2,50*r2,50*r2)
   elevation( arctan( gy/gx)/ pi*180) from (r2,d) to (5*r2,d)
     as 'G_field direction, degrees'
   surface( log10( gm)) zoom(-50*r2,d-50*r2,100*r2,100*r2)
END "DvpghW5PpMHCHI9NX2W4VdESYHVejblqdOWsApKqJ0pv/4V+F4WFOtSBmOh5xHQPSK+QWJoRGtyx4+aX9A0VSUYXEN0I9VtbWymfiyksZn1e0wmU4IKdT4/eJ+5zNLDbZIfDZXFfndrWehIUJuIX66uO1I/EYm2ohyG8hbJ5ZJ3"
 
