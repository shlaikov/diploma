TITLE 'Heat transport'

SELECT
errlim = 1e-4

VARIABLES
temp
U

DEFINITIONS
k
q = 10
T0 = 300
U0 = 10
source

EQUATIONS
temp: div(k * grad(temp)) + source = 0
U: del2(U) = 0


BOUNDARIES
REGION 1 'substrate'
k = 25
source = 0
start( 100, 100)
    natural(U) = 0 natural(temp) = 0 line to ( 130, 100)
    natural(U) = 0 natural(temp) = 0 line to ( 130, 120)
    line to ( 100, 120)
	natural(U) = 0 natural(temp) = 0 line to ( 100, 100)
    line to close
REGION 2 'contact1'
k = 2
source = 0
start( 100, 120)
    natural(U) = 0 natural(temp) = 0 line to ( 100, 121)
    value(U) = 0 value(temp) = T0 line to ( 112.5, 121)
    natural(U) = 0 natural(temp) = 0 line to ( 112.5, 120)
	line to ( 100, 120 )
    line to close
REGION 3 'contact2'
k = 2
source = 0
start( 117.5, 120)
    natural(U) = 0 natural(temp) = 0 line to ( 117.5, 121)
    value(U) = U0 value(temp) = T0 line to ( 130, 121)
	natural(U) = 0 natural(temp) = 0 line to ( 130, 120)
	line to ( 117.5, 120 )
    line to close

{Geometry for a gap in a planar capacitor}
REGION 4 'gap'
k = 2
source = 40
start( 112.5, 120)
    line to ( 112.5, 121)
    natural(U) = 0 natural(temp) = 0 line to ( 117.5, 121)
	line to ( 117.5, 120)
	line to ( 112.5, 120)
    line to close


MONITORS
PLOTS
contour(temp)
surface(temp) 
contour(U) export FORMAT "#x #y #1"
surface(U) 
END 
