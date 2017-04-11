TITLE                                                                      { vib13.pde }
   'Plate With Free Boundaries'
{ Eigenstates of in-plane vibration }
{ From "Deformation and Vibration" by Gunnar Backstrom }
SELECT
   modes= 8             errlim= 1e-2            plotintegrate= off
VARIABLES
   ur           vr
DEFINITIONS
   L= 1         h= 0.8
   dens= 7.8e3          mu = 0.3         E = 200e9      { Steel }
#include 'vibuvr.pde'
   freq= sqrt( lambda/ dens)/(2*pi)                             { Frequency }
EQUATIONS               { Eigenvalue= lambda }
   ur:	dx( sxr)+ dy( sxyr)+ lambda*ur= 0
   vr:	dx( sxyr)+ dy( syr)+ lambda*vr= 0
BOUNDARIES
region 'steel'
   start (0,-h/2)
   load( ur)= 0         load( vr)= 0   line to (L,-h/2)                 { Free }
   value( ur)= 0        value( vr)= 0  line to (L,h/2)
   load( ur)= 0      load( vr)= 0   line to (0,h/2)             { Free }
   value( ur)= 0        value( vr)= 0  line to close
MONITORS
   grid( x+0.05*ur, y+0.05*vr)  report( freq)
PLOTS
   contour( ur)                         contour( vr)
   vector( urvr) norm           grid( x+0.05*ur, y+0.05*vr)  report( freq)
END "F+AWzQ6DqGELSXS5O2oC0ToRLKO14dz+Zi5uT77GpXKuJVqOCicM7DsVdnhaz0iUtc7LdIcrrE5Dlw7MbIXMayoGby7GVx/VEmr6JZ52HzqnXdJNxdrEUyidpXeBArlfNuc9OI7JtWI/jFf67KFL8aEiRj8Z5/DDGiG7WjdrXb/"
