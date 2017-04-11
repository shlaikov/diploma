TITLE                                                    { heatr3.pde }
   'Transient Conduction in Cu/Fe'
{ Temperature field in a composite rod of copper and iron. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 1e-3
VARIABLES
   temp
DEFINITIONS
   Lx= 1                        Ly= 0.1
   k            rcp                             { Conductivity and heat capacity }
   tempi= 300                   temp0= 400
   fluxd_x= -k*dx(temp)
INITIAL VALUES
   temp= tempi
EQUATIONS
   div(-k*grad(temp))+ rcp* dt(temp)= 0
BOUNDARIES
region 1                k= 82                   rcp= 7.87e3* 449                { Fe }
   start (0,0)   natural(temp)= 0  line to (Lx,0) to (Lx,Ly) to (0,Ly)
   value(temp)= temp0   line to close
region 2
   k= 400                     rcp= 8.96e3* 385                          { Cu }
   start (0,0)   line to (0.2*Lx,0) to (0.2*Lx,Ly)  to (0,Ly) to close
TIME
   0 to 10000
PLOTS
   for t= 100, 300, 1000, 3000, 10000
      elevation( temp) from (0,Ly/2) to (Lx,Ly/2)
      elevation( fluxd_x) from (0,Ly/2) to (Lx,Ly/2)
HISTORIES
   history( temp) at (0.1*Lx,Ly/2) at (0.2*Lx,Ly/2) at (0.3*Lx,Ly/2)
      at (0.4*Lx,Ly/2) at (0.5*Lx,Ly/2)
END "C2moAvQpLcM7wdQl/WFSa6Zxd1K3sdC9zFA04BXKxWm10TUCJPAgs45W0HS5OKLOb8kom6PkeFZZyqWcgEOB9YnZ4zMMzkk/rz7KMufiwuCRyOgAg6p1eXBnZEgoWEMeXHkZVjcnkRjLlwpXilmL4buAN8cZoqNqXN54v30UJKP"
 
