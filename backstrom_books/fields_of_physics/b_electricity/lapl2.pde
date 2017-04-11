TITLE                                                           { lapl2.pde }
   'Laplace Equation'
{ Solve a simple Laplace equation and compare to the analytic solution. }
{ From "Fields of Physics" by Gunnar Backstrom }
SELECT
   errlim= 1e-5                         { Requested relative accuracy }
VARIABLES
   U                                            { Unknown }
DEFINITIONS
   Lx= 1           Ly= 1
   U_ex= x^2- y^2                       { Exact solution }
EQUATIONS
   dxx(U)+ dyy(U)= 0                    { Laplace PDE }
BOUNDARIES
region 1
   start(-Lx,-Ly)
   natural(U)= 2*y   line to (Lx,-Ly)                  { Outward derivative }
   value(U)= U_ex   line to (Lx,Ly)
   value(U)= U_ex   line to (-Lx,Ly)
   value(U)= U_ex   line to close
PLOTS
   contour(U)                   surface(U)
   contour(U_ex)                contour(U-U_ex)
END "FSe6hFwvzet18hITUq1KPNXzKP1PyL9nxPbj9RQq2HV2AzcsdUCSDoklZS1IWVSkyhflgjzRCPdSzB+rM1VPLajRVfG2INSix0Ov/co3FgzxXkRbRWh9BID5Go8b2vrPOGDSAuBBLOh4K7XbENycxR3nemP7dz0JYEa6zndMMDa"
 
 
 
