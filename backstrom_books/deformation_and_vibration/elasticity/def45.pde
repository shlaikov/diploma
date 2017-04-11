TITLE 								   { def45.pde }
   'Torsion and Warping of a Square Bar'
{ From "Deformation and Vibration" by Gunnar Backstrom }
SELECT
   errlim= 1e-4
VARIABLES
   phi		w
DEFINITIONS
   Lx= 1e-2             Ly= 1e-2            L= 1.0		
   G= 80e9			twist= 1e-3          { Twist angle per unit length }
   u= -y*L*twist             	v= x*L*twist
   uv= vector( u, v)	uvm= magnitude( uv)
   sxz= dy(phi)         	syz= -dx(phi)
   tau= vector( sxz, syz)		taum= magnitude( tau)
   moment= x*syz- y*sxz
   exz= (1/G)* sxz              eyz= (1/G)* syz
   mises= sqrt( 3/2*(sxz^2+syz^2))		{ von Mises stress }
EQUATIONS
   phi:	dxx(phi)+ dyy(phi)+ 2*G*twist = 0
   w:	dx( G* dx(w))+ dy( G*dy(w))= 0		{ 2nd PDE }
BOUNDARIES
region 'steel'
   start 'outer' (Lx,-Ly)
   value(phi)= 0    load(w)= dy(phi)+ G*twist*y line to (Lx,Ly)
   load(w)= -dx(phi)- G*twist*x  line to (-Lx,Ly)
   load(w)= -dy(phi)- G*twist*y line to  (-Lx,-Ly)
   load(w)= dx(phi)+ G*twist*x line to close
PLOTS
   surface( phi)		vector( u, v) norm     	
   contour( taum)		contour( mises)
   contour( moment)	
   elevation( tangential( tau)) on 'outer'     report( 2*G*twist* 2*Lx*2*Ly)
   contour( moment)		report( 0.1406*G*twist* (2*Lx)^4)
   surface( w) 		contour( w) painted
END "BiKjQ6K7QQIttUdrTr5zJ6FzotVa1yqg35DFgKPzsztjBtO9kyIHEpYfpIvqRY5J8EOLR9CqybIhEr1EzEoVzyNsvIJcBrmiv4vksS6yBxwSlbOov0l7VfKv0+6pQusMpZJr+iFdtrpHmYnuUicC0Dw5ovJB9R5r6zMd2ybFTeR"
