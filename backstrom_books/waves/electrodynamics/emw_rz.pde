{					emw_rz.pde}
   Jphir= sigma*Ephir		Jphii= sigma*Ephii
   Ep= sqrt( Ephir^2+ Ephii^2)	
   Brhor= 1/omega*dz( Ephii)    	Brhoi=  -1 /omega*dz( Ephir)
   Bzr=  -1/(omega*r)* dr( r*Ephii) 	Bzi= 1/(omega*r)* dr( r*Ephir)   
   Br= vector( Brhor, Bzr)		Bi= vector( Brhoi, Bzi)
   Brm= magnitude( Br)		Bim= magnitude( Bi)
