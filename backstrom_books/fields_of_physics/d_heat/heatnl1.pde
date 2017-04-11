TITLE                                                    { heatnl1.pde }
   'MgO Plate With a Hole, k(T)'
{ Temperature field in a plate with T-dependent thermal conductivity. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 1e-4
VARIABLES
   temp
DEFINITIONS
   Lx= 0.6              Ly= 0.4                 r0= 0.1
   heat= 0              k= 15000/temp                   { Thermal conductivity k(T) }
   fluxd_x= -k*dx(temp)       fluxd_y= -k*dy(temp)
   fluxd= vector( fluxd_x, fluxd_y)     fluxdm= magnitude( fluxd)
INITIAL VALUES
   temp= 700
EQUATIONS
   div( -k*grad( temp))- heat= 0
BOUNDARIES
region 1
   start (0,0)          natural(temp)= 0                line to (Lx,0)
   value(temp)= 300             line to (Lx,Ly)
   natural(temp)= 0             line to (0,Ly)
   value(temp)= 1000            line to close
   start (Lx/2-r0,Ly/2)                 natural(temp)= 0                { Cut-out }
   arc to (Lx/2,Ly/2+r0)  to (Lx/2+r0,Ly/2)  to (Lx/2,Ly/2-r0) to close
MONITORS
   elevation(temp) from (0,0) to (Lx,0)
PLOTS
   contour( temp)               elevation( temp) from (0,0) to (Lx,0)
   vector( fluxd) norm
   contour( fluxd_x)            contour( fluxd_y)               contour( fluxdm)
   surface( temp)
END "Hk2cCaSruvaLAYWAfpmHW8Zh6YQDLPsGYVmT4lLRdWBD0G/hcQuOv7b9PXjFXtFalY3XyeWTfW+L8v8GlZv/DwhkK6DTxCgaDdhhaCVGYAp0eggeRWM8WioAc9jg8nY1yjlFW5xj8U0r5s+0MyRKdzkzOlw91fc51PnT5Xpjb1w"
