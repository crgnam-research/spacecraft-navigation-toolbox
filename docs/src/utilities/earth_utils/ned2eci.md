[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [earth_utils](index.html) \> ned2eci.m

</div>

# ned2eci

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
**By Benjamin Reifler**
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function \[v_eci\] = ned2eci(v_ned, lat, lon, eci2ecef) %\# codegen**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
 By Benjamin Reifler
 Note that this is for direction vectors, to use position vectors,
   subtract the reference point first
 Inputs:   ned (3x1 vector in NED)
           lat (deg)
           lon (deg)
           JD (Julian date)
           coefs (1600x17,1275x17,66x11)
 Outputs:  A (DCM)
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

-   [eci2ecef](eci2ecef.html "function rotmat = eci2ecef(jd,coefs)"){.code}
    A = dcmeci2ecef_codegen(JD,coefs)

This function is called by:

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 % By Benjamin Reifler
    0002 % Note that this is for direction vectors, to use position vectors,
    0003 %   subtract the reference point first
    0004 % Inputs:   ned (3x1 vector in NED)
    0005 %           lat (deg)
    0006 %           lon (deg)
    0007 %           JD (Julian date)
    0008 %           coefs (1600x17,1275x17,66x11)
    0009 % Outputs:  A (DCM)
    0010 
    0011 function [v_eci] = ned2eci(v_ned, lat, lon, eci2ecef) %# codegen
    0012     % NED -> ECEF rotation matrix
    0013     cosl = cosd(lon);
    0014     sinl = sind(lon);
    0015     cosp = cosd(lat);
    0016     sinp = sind(lat);
    0017     A = [-sinp*cosl -sinl  -cosp*cosl;
    0018          -sinp*sinl  cosl  -cosp*sinl;
    0019             cosp      0      -sinp];
    0020 
    0021     % NED -> ECEF -> ECI rotation
    0022     v_eci = eci2ecef'*A*v_ned;
    0023 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
