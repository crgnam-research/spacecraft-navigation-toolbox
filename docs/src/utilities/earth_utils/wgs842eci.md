[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [earth_utils](index.html) \> wgs842eci.m

</div>

# wgs842eci

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
**r = geodetic2eci(lla,JD,xCoefs,yCoefs,sCoefs)**
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function r = wgs842eci(lla, eci2ecef) %\# codegen**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
 r = geodetic2eci(lla,JD,xCoefs,yCoefs,sCoefs)
 By Benjamin Reifler
 Inputs:   lla = [lat lon h]' (deg & km geodetic)
           JD (Julian date)
           coefs (1600x17,1275x17,66x11)
 Outputs:  r (km ECI)
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

-   [eci2ecef](eci2ecef.html "function rotmat = eci2ecef(jd,coefs)"){.code}
    A = dcmeci2ecef_codegen(JD,coefs)

This function is called by:

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 % r = geodetic2eci(lla,JD,xCoefs,yCoefs,sCoefs)
    0002 % By Benjamin Reifler
    0003 % Inputs:   lla = [lat lon h]' (deg & km geodetic)
    0004 %           JD (Julian date)
    0005 %           coefs (1600x17,1275x17,66x11)
    0006 % Outputs:  r (km ECI)
    0007 
    0008 function r = wgs842eci(lla, eci2ecef) %# codegen
    0009 
    0010 % convert geodetic to ECEF
    0011 p = geodetic2ecef(lla);
    0012 
    0013 r = eci2ecef'*p;
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
