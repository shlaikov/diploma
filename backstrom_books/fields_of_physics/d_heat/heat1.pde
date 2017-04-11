TITLE                                                      { heat1.pde }
   'Two Insulated Tubes'
{ Temperature field in an insulator containing two hot-water tubes. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 1e-4
VARIABLES
   temp                         { SI units: m, K, J, s }
DEFINITIONS
   r0= 0.1              d= 0.15          r1= 0.5
   Lx= 0.3              Ly= 0.2
   k= 0.03                              { Thermal conductivity of insulation }
   fluxd_x= -k*dx(temp)         fluxd_y= -k*dy(temp)
   fluxd= -k*grad( temp)                fluxdm= magnitude( fluxd)
   f_angle= sign(fluxd_y)* arccos(fluxd_x/fluxdm)/pi*180
EQUATIONS
   div(-k*grad(temp))= 0
BOUNDARIES
region 1
   start 'outer' (0,-r1)
   	value(temp)= 273                     { Frozen soil, kelvin }
	arc( center= 0,0) angle= 360 close
   start 'left' (-d-r0,0)
   	value(temp)= 323                     { Cutout for hot water tube 2 }
	arc( center= -d,0) angle= -360 close
   start 'right' (d-r0,0)
   	value(temp)= 353             { Cutout for hot water tube 1 }
	arc( center= d,0) angle= -360 close
PLOTS
   contour(temp)                                surface(temp)
   vector(fluxd) norm                   contour(f_angle)
   contour(fluxd_x)                     contour(fluxd_y)
   contour(fluxdm)
   elevation( normal(fluxd)) on 'outer'
   elevation( -normal(fluxd)) on 'left'
   elevation( -normal(fluxd)) on 'right'
END "JPxyzaRovUC9TEYkA94sqzysUWWU8mVsV2tdsbrm65H5+veN1fQfgfty1Od5ZUWNJKU6MJtV85LHc3XLlPdDQRtHV7aQglgo9NFBvXFlM59pAgifzo19q13KTvfeid8mj/Qb88a+7wSgNxnXqZJzKyjLs5TrDKKsdO+iJFvB1Eh"
