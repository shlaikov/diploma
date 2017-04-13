TITLE 'Heat transport'

SELECT
errlim = 1e-4

VARIABLES
temp

DEFINITIONS
k
q = 10
T0 = 300

EQUATIONS
temp: div(k * grad(temp)) = 0


BOUNDARIES
REGION 1 'substrate'
k = 25
start( 100, 100)
    natural(temp) = 0 line to ( 130, 100)
    natural(temp) = 0 line to ( 130, 120)
    line to ( 100, 120)
    natural(temp) = 0 line to ( 100, 100)
    line to close
REGION 2 'contact'
k = 2
start( 100, 120)
    natural(temp) = 0 line to ( 100, 121)
    value(temp) = T0 line to ( 112.5, 121)
    natural(temp) =  q/k line to ( 117.5, 121)
    value(temp) = T0 line to ( 130, 121)
	natural(temp) = 0 line to ( 130, 120)
    line to close


MONITORS
PLOTS
contour(temp)
END 