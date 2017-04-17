TITLE 'Heat transport'

SELECT
errlim = 1e-4

VARIABLES
temp
U

DEFINITIONS
k
eps
tand

q = 10
T0 = 300
U0 = 10
eps0 =  8.85418782 * 10^(-6)
omega = 3 * 10^9 * 2 * pi
L = 800


EQUATIONS
temp: div(k * grad(temp)) + omega * eps * eps0 * tand * (grad(U))^2 = 0
U: del2(U) = 0


BOUNDARIES
REGION 1 'substrate'
k = 25
eps = 10
tand = 1e-4
start( 100, 100)
    natural(U) = 0 natural(temp) = 0 line to ( 130, 100 )
    natural(U) = 0 natural(temp) = 0 line to ( 130, 120 )
    line to ( 100, 120 )
	natural(U) = 0 natural(temp) = 0 line to ( 100, 100 )
    line to close
REGION 2 'contact1'
k = 2
eps = 500
tand = 1e-2
start( 100, 120)
    natural(U) = 0 natural(temp) = 0 line to ( 100, 121 )
    value(U) = 0 value(temp) = T0 line to ( 112.5, 121 )
    natural(U) = 0 natural(temp) = 0 line to ( 112.5, 120 )
	line to ( 100, 120 )
    line to close
REGION 3 'contact2'
k = 2
eps = 500
tand = 1e-2
start( 117.5, 120)
    natural(U) = 0 natural(temp) = 0 line to ( 117.5, 121)
    value(U) = U0 value(temp) = T0 line to ( 130, 121)
	natural(U) = 0 natural(temp) = 0 line to ( 130, 120 )
	line to ( 117.5, 120 )
    line to close

{Geometry for a gap in a planar capacitor}
REGION 4 'gap'
k = 2
eps = 500
tand = 1e-2
start( 112.5, 120 )
    line to ( 112.5, 121)
    natural(U) = 0 natural(temp) = 0 line to ( 117.5, 121 )
	line to ( 117.5, 120 )
	line to ( 112.5, 120 )
    line to close


MONITORS
PLOTS
contour(temp)
surface(temp) 
contour(U)
surface(U) 
END 
