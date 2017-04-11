{ File to be included in (x,y) descriptors }			        {emw_xy.pde }
{ Electric field component: }
   Ep= sqrt(Ezr^2+ Ezi^2)  			{ Peak value, of Ez }    
   phase= sign( Ezi)* arccos( Ezr/Ep)/pi*180 	{ Phase angle of Ez }
{ Instantaneous vector component Bx: }
   Bxr= -dy( Ezi) /omega    		Bxi=  dy( Ezr) /omega
{ Instantaneous vector component By: }
   Byr=  dx( Ezi) /omega 		Byi= -dx(Ezr) /omega
{ Peak values of vector components: }
   Bxp= sqrt( Bxr^2+ Bxi^2)		Byp= sqrt( Byr^2+ Byi^2)
{ Vectors of instantaneous components: }
   Br= vector( Bxr, Byr)			Brm= magnitude( Br)
   Bi= vector( Bxi, Byi)			Bim= magnitude( Bi)
