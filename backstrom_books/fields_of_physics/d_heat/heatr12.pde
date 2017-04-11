TITLE                                                   { heatr12.pde }
   'Scanning calorimetry, polymer in Al'
{ Transient temperature field in an Al capsule containing a polymer sample. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 1e-2
COORDINATES
   ycylinder( 'r', 'z')
VARIABLES
   temp(threshold=300)
DEFINITIONS
   D= 0.1e-3          r0= 3.3e-3          Ly= 1.6e-3
   k                    rcp                  rate= 10
   tempi= 300
   fluxd_r= -k*dr(temp)      fluxd_z= -k*dz(temp)
   fluxd= -k*grad(temp)         fluxdm= magnitude( fluxd)
INITIAL VALUES
   temp= tempi
EQUATIONS
   (1/r)*dr( r*fluxd_r)+ dz( fluxd_z)+ rcp* dt(temp)= 0
BOUNDARIES
region 1
   k= 0.3         rcp= 3e6                { Polymer specimen }
   start (0,0)
   value(temp)= tempi+ rate*t          line to (r0,0)
   natural(temp)= 0        line to (r0,Ly) to (0,Ly) to close
region 2
   k= 238         rcp= 3e6                { Aluminum }
   start (0,0)  line to (r0,0) to (r0,Ly) to (0,Ly)
        to (0,Ly-D) to (r0-D,Ly-D) to (r0-D,D) to (0,D) to close
TIME
   0 to 100
PLOTS
   for t= 1, 3, 10, 30, 100
      elevation(temp) from (0,0) to (0,Ly)
      contour(temp)
      surface(temp)  viewpoint(-r0,Ly/2,0)
END "GBUsWBaCcgfs0BjZ4/gVLkfWMKw+WP1BDRRkvDd6siaiNbr1cMZfvvAQpo1SZVU9IkfWy8nxtFtVCiGpSvi59GNfuyQodbHX+hdGegXeD/HldpiIXK0+JH7pwg+EDsATsAak66dtqeMdhz5hCiFg8mk/XClHmVCTE2jdApwi8/5"
