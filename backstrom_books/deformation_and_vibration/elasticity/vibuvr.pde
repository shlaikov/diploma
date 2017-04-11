{ Commands pertaining to vibration }				  { vibuvr.pde }
   C = E/(1-mu^2)       	G = E/2/(1+mu)
   urvr= vector( ur, vr)	urvrm= magnitude( urvr)
   exr= dx(ur)            	eyr= dy(vr)             		{ Strains }        
   exyr= dx(vr)+ dy(ur)
   sxr= C*(exr+ mu*eyr)    syr= C*(mu*exr+ eyr) 	{ Stresses }
   sxyr= G*exyr
   energy_d= 0.5*(sxr*exr+ syr*eyr+ sxyr*exyr)   	{ Energy density }
