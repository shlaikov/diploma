TITLE                                                                          { curl1.pde }
   'Rotating Disk'
{ A solid, circular disk rotates about its center. Plot the velocity and its differentials }
{ From "Fields of Physics" by Gunnar Backstrom }
DEFINITIONS                                                     { SI units... }
   r1= 1.0
   rad= sqrt(x^2+y^2)                   omega= 1.0
   vx= -omega*y          vy= omega*x                    { Velocity... }
   v= vector( vx, vy)
   vm= sqrt(vx^2+vy^2)                                          { Magnitude of v }
BOUNDARIES
region 1
   start(r1,0)
   arc to (0,r1) to (-r1,0) to (0,-r1) to close        { Circular arc }
PLOTS
   contour(vx)                  contour(vy)                     contour(vm)
   contour( dx(vy) - dy(vx) )  as 'curl_z'
   contour( dx(vx)+ dy(vy) )  as 'div_v'
   vector( v)
END "CItB0iXF+hlzXxnYLo4buw2Y5qhJcxeSTHe/OH0PZuZJqkuHQi/Zdl+CnUG4+UST2BZHgS2r3X81AGGN+tpk1up3rav4rD1LKXw3SUMKQNACufcAsO2F8u41xZvAtn1kpPgMvLgWLyugAn6sfAch+9PiCrRm1iQD3mhW1kPcCKc"
