TITLE									     { def4.pde }
   'Plate Subjected to Shear Forces'
{ From "Deformation and Vibration" by Gunnar Backstrom }
SELECT
    errlim= 1e-4
VARIABLES
   u  	v(1e-8)
DEFINITIONS
   Lx= 40e-3           	Ly= 30e-3
   mu = 0.3             	E  = 200e9       		{ Steel }
   C= E/(1-mu^2)       G = E/(2*(1+mu))
   uv= vector(u,v)	uvm= magnitude( uv)
   ex= dx(u)            	ey= dy(v)  			{ Strain components }
   exy= dx(v)+ dy(u)	
   sx= C*(ex+ mu*ey)    sy= C*(mu*ex+ ey)      	{ Stress components }
   sxy= G*exy		ez= -mu*(sx+ sy)/E
   shear_f= 2e8					      { Shear force per unit area }
EQUATIONS       					{ No volume forces }
   u:	dx( sx) + dy( sxy)= 0
   v:	dx( sxy)+  dy( sy)= 0
BOUNDARIES
region 'steel'
   start  'outer' (0,0)      	point value(u)= 0
   load(u)= -shear_f      	value(v)= 0             	line to (Lx,0)
   load(u)= 0           	load(v)= shear_f         	line to (Lx,Ly)
   load(u)= shear_f       	load(v)= 0              	line to (0,Ly)
   load(u)= 0           	load(v)= -shear_f         	line to close
PLOTS
   grid( x+200*u, y+200*v)
   contour( u)      contour( v)  	vector( uv) norm
   contour( ex)     contour( ey)         contour( exy)         contour( ez)
   contour( sx)      contour( sy)         contour( sxy)
   elevation( u, v) on 'outer'	
   elevation( sx, sy) on 'outer'
END "KGaVAX1GRRI9mTDMvoxodWeOB8nx6z+XbhXsnZ5DvOgkXfAVk8nuuCqpkTvcei6JV1QgkreEDsuKc7lmCqNQcOqkgO6u3EGY9Ysj85Qp3La1kFsEUpu2imb2xfWmcisaqovid2wKh852X/8DeXTxhzVrEtEU1QiidJO/XPr6dld"
