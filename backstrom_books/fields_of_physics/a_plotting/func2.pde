TITLE                                                                             { func2.pde }
   'x^2+ 2*y^2'
{ Plot a simple function of x and y. Study the gradient and the Laplacian. }
{ From "Fields of Physics" by Gunnar Backstrom }
DEFINITIONS
   Lx=1       Ly=1       f= x^2+ 2*y^2
   gradf= vector( dx(f), dy(f))        laplacef= dxx(f)+ dyy(f)
BOUNDARIES
region 1
   start(-Lx,-Ly) line to (Lx,-Ly) to (Lx,Ly)  to (-Lx,Ly) to close
PLOTS
   grid( x, y)                          { Triangular mesh }
   surface( f)                  { Surface in 3 dimensions }
   contour( f)                                  { Contour plot of function }
   vector( gradf) as 'Gradient' { Arrow plot with a title }
   contour( laplacef)                           { Test if f(x) is harmonic }
END "H6DCx3XoLFi87iwptE0Lj0XCIVBd3mKmO+ApvU36UIj/m1pondZ45mIZOjUW9DYHx6WZDv9+p6iQGHuMlvxJxlwFB7fXml7hIuwvdt25l4WWIJfrMcvo7bNL9nE4JJCHaOICS32wqYZUov0CPuhHyuRhXCupnoPypJ2vj2FqsoN"
 
 
 
