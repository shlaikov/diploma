TITLE                                                    { magn2.pde }
   'Field Around Two Wires'
{ Magnetic field around two circular wires with opposite currents. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 1e-3
VARIABLES
   Az
DEFINITIONS                                                     { SI units }
   mu0= 4*pi*1e-7      mu= mu0          Jz              { Current density }
   r0= 0.05             d0= 3*r0        r1= 1.0
   Bex= dy(Az)                          Bey= -dx(Az)
   B= vector( Bex, Bey)         Bm= magnitude( B)
EQUATIONS
   div( 1/mu* grad(Az))+ Jz= 0
BOUNDARIES
region 1                Jz= 0
   start(-r1,0)      value(Az) = 0      arc(center= 0,0) angle= 360 close
region                  'Lower'         Jz=  -1.0
   start (r0,-d0/2)   arc(center= 0,-d0/2)  angle= 360 close
region                  'Upper'         Jz=  +1.0
   start (r0,d0/2) arc(center= 0, d0/2)  angle= 360 close
PLOTS
   contour( abs(Az)) log                surface( Az)
   contour( Bm)  log            vector( B) norm
   contour( Bm)  zoom(-d0,-d0,  2*d0,2*d0)
   vector( B)  norm  zoom(-d0,-d0,  2*d0,2*d0)
END "J1ahZN+DYzo094mePcDJslCiUwjdf9yiMIUX50szjdQ4zbp8MZldWgRHYPQTiCwYBrJfEptycGLU7+GuR0oJlwCxLqY7JUi7+zNs8Sh5w76F+ZhglBpzlRKUR74giGykKj7UrTX4WIbiZG+8O3/KXMSTzkwrt+OU2pxmHpjsMp1"
