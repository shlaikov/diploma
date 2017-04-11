TITLE                                                    { heats2.pde }
   'Radiating and Conducting Foil'
{ Potential and temperature in a rectangular foil heated by an applied voltage. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 1e-3                         stages= 8
VARIABLES
   U    temp
DEFINITIONS
   Lx= 0.6                      Ly=0.2                  d= 1e-4
   temp0= 300           U1= stage* 0.2
   k= 400                                                               { Copper }
   cond0= 1/1.67e-8             cond= cond0*temp0/abs(temp)          { Copper }
   fluxd_x= -k*dx(temp)         fluxd_y= -k*dy(temp)
   fluxd= -k*grad( temp)                fluxdm= magnitude( fluxd)
   E_x= -dx( U)                 E_y= -dy( U)
   E= -grad( U)                 Em= magnitude( E)
   J_x= cond*E_x        J_y= cond*E_y   J= cond*E       Jm= cond*Em
INITIAL VALUES
   U= 0         temp= 400
EQUATIONS
   U:  div( J)= 0
   temp:  div( fluxd)- Jm*Em- 2* 0.3* 5.67e-8* (300^4-temp^4)/ d= 0
                        { Emissivity= 0.3, power per m^3, both sides }
BOUNDARIES
region 1
   start (0,0)
   natural(U)= 0                natural(temp)= 0                        line to (Lx,0)
   value(U)= U1/2       value(temp)= temp0              line to (Lx,Ly)
   natural(U)= 0        natural(temp)= 0                        line to (0,Ly)
   value(U)= -U1/2              value(temp)= temp0              line to close
MONITORS
   elevation(temp) from (0,Ly/2) to (Lx,Ly/2)
PLOTS
   contour(temp)                elevation(temp) from (0,Ly/2) to (Lx,Ly/2)
END "COD6g/RPgFAnBdIOZA4VaPWvLXiNMDdAr0ablN913H/NLbnp6kHRbsUIUy65Pi8LgR+SHWHBiU/EWDgBteLcMVElXTJ9Gtm47ESMq7Na4rW/CAOqpRQO9tiKhJu/id+xbtq6dNlS6kp6UjjrRw3ZQnNRNeCRxrsqdTjmnSuOvyT"
