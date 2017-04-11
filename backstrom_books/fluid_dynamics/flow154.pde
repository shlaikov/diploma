TITLE								        { flow154.pde }
   'Natural Convection in (x,y), Simplified'
SELECT
   errlim=2e-2	
VARIABLES
   vx(1e-5)      	vy(1e-5)   	p(1e-5)	Tp(1)		{ Temperature excess }
DEFINITIONS
   Lx=1.0          	Ly= 1.5		visc=1.0		dens=1e3	
   cond=0.5		rcp=3e6 	vy0= 1e-5
   rad=sqrt(x^2+y^2)	  v=vector( vx, vy) 	vm=magnitude( v)	
   Re= dens*globalmax(vm)*2*Lx/visc		{ Reynolds number }
   div_v= dx( vx)+ dy( vy)	curl_z= dx( vy)- dy( vx)		
   unit_x= vector(1,0)		unit_y= vector(0,1)
   natp= visc* ( normal( unit_x)* del2( vx)+ normal( unit_y)* del2( vy))
   Fy= 1e-2*Tp				{ Volume force with g*alpha=1e-2 }
   y_shift= integral( y*Tp)/ integral( Tp)
INITIAL VALUES
   vx=0	 vy=0	    	p=0	   Tp=0
EQUATIONS							
   vx:	dx( p)- visc* del2( vx)= 0
   vy:	dy( p) - Fy - visc* del2( vy)= 0		
   p:	del2( p)- dy(Fy)- 1e4*visc/Lx^2* div_v= 0		{ 3rd PDE }
   Tp:	div(-cond*grad( Tp))+ rcp* dt( Tp)+ rcp*( vx*dx( Tp)+ vy*dy( Tp))=0
BOUNDARIES
region 'domain'  start 'outer' (-Lx,-Ly/3)   value( vx)=0   value( vy)=0
      value( p)=0  value( Tp)= exp(-(10*x/Lx)^2)
   line to (Lx,-Ly/3)  natural( p)=natp  natural( Tp)=0
   line to (Lx,Ly)  to (-Lx,Ly) to close
TIME
   0 by 1e3 to 1e5
PLOTS
   for t= 1e3,  2e4 by 2e4 to endtime
   contour( Tp) painted report( Re)     	vector(v) norm report( Re)
   contour(p)
HISTORIES
   history( y_shift)
END "GVUEWj0wJBookzjU8cJZb2TMJnALNR78E9wFm5zaHcSY5u5FvPVb3+UJboSTJKJAYUvr/tI0Lc4MToP4U6i+tm3kyuFPNe+Mgl3bg1sHzAKgr1AgbRhmR82TtF6een8QBwTncDCHdD5Kc2o8AO4eGVXRUTqsjoxN9qFlKTuKWKz"
