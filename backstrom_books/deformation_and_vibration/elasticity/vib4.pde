TITLE                                                                        { vib4.pde }
   'Wobbling Ends'
{ Beam under forced vibration at increasing frequency }
{ From "Deformation and Vibration" by Gunnar Backstrom }
SELECT
   stages= 15           errlim= 1e-4                    plotintegrate= off
VARIABLES
   ur           vr
DEFINITIONS
   dens= 7.8e3       mu = 0.3        E = 200e9                  { Steel }
   L= 1         h= 0.1
   omega= 5350+ 10*stage
   freq= omega/ (2*pi)                          { Frequency }
#include 'vibuvr.pde'
EQUATIONS
   ur:	dx( sxr)+ dy( sxyr)+ dens*omega^2*ur= 0
   vr:	dx( sxyr)+ dy( syr)+ dens*omega^2*vr= 0
BOUNDARIES
region 'steel'
   start 'outer' (0,-h/2)
   load(ur)= 0          load(vr)= 0             line to (L,-h/2)
   load(ur)= 0          value(vr)= 0            line to (L,h/2)         { Fixed }
   load(ur)= 0          load(vr)= 0             line to (0,h/2)
   load(ur)= 0          value(vr)= 1e-3         line to close  { Driven }
PLOTS
   grid(x+0.5*ur, y+0.5*vr)     report( freq)
END "Jn5duN/SrQSa6w7HW4yV73qzZ3XI7oQV7nxtuUfqBGDDm3qF8SLbFybP6K+GXP73Z/tP7WcBTkMhOxhMjLpKKHK9SLGkaXLAA4mzFdK01EkTrT8OSPmeuEnO2tuJOePsO4k7MzUFIHlQWoS3ro+DRHG9uX6hWjU4KWB5Mn+otT1"
