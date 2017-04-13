{ Fill in the following sections (removing comment marks ! if necessary),
  and delete those that are unused.}
TITLE 'Planar capacitor heatsink'     { the problem identification }
COORDINATES cartesian2  { coordinate system, 1D,2D,3D, etc }
VARIABLES        { system variables }
  Temp              { choose your own names }
! SELECT         { method controls }
DEFINITIONS    { parameter definitions }

K
hfilm = 1
hsub = 30
s = 6
L = 30
q = 100
T0 = 300
source = 0


! INITIAL VALUES

EQUATIONS        { PDE's, one for each variable }
Temp: div(K*grad(Temp))  + source = 0 { one possibility }


! CONSTRAINTS    { Integral constraints }
BOUNDARIES       { The domain definition }
  REGION 1       { For each material region }
  K=2
  START(0,0)   { Walk the domain boundary }
	NATURAL(Temp)=q LINE TO (0,s/2)
	VALUE(Temp)=T0	LINE TO (0,L/2)
	NATURAL(Temp)=0 LINE TO (hfilm,L/2)
	LINE TO (hfilm,-L/2)
	NATURAL(Temp)=0 LINE TO (0,-L/2)
	VALUE(Temp)=T0	LINE TO (0,-s/2)
	NATURAL(Temp)=q LINE TO CLOSE

  REGION 2       { For each material region }
  K=25
  START(hfilm,0)   { Walk the domain boundary }
	LINE TO (hfilm,L/2)
	NATURAL(Temp)=0 LINE TO (hfilm+hsub,L/2)
	NATURAL(Temp)=0 LINE TO (hfilm+hsub,-L/2)
	NATURAL(Temp)=0 LINE TO (hfilm,-L/2)
	TO CLOSE

! TIME 0 TO 1    { if time dependent }
MONITORS         { show progress }
PLOTS            { save result displays }
  CONTOUR(Temp)
  SURFACE(Temp)
END