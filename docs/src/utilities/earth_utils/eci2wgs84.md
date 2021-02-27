[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [earth_utils](index.html) \> eci2wgs84.m

</div>

# eci2wgs84

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
**lla = eci2geodetic(r,JD,coefs)**
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function lla = eci2wgs84(r, eci2ecef)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
 lla = eci2geodetic(r,JD,coefs)
 By Benjamin Reifler
 Inputs:   r (km ECI)
           JD (Julian date)
           coefs (1600x17,1275x17,66x11)
 Outputs:  lla = [lat lon h]' (deg & km geodetic)
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

-   [ecef2wgs84](ecef2wgs84.html "function lla = ecef2wgs84(r) %#codegen"){.code}
    lla = ecef2geodetic(r)
-   [eci2ecef](eci2ecef.html "function rotmat = eci2ecef(jd,coefs)"){.code}
    A = dcmeci2ecef_codegen(JD,coefs)

This function is called by:

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 % lla = eci2geodetic(r,JD,coefs)
    0002 % By Benjamin Reifler
    0003 % Inputs:   r (km ECI)
    0004 %           JD (Julian date)
    0005 %           coefs (1600x17,1275x17,66x11)
    0006 % Outputs:  lla = [lat lon h]' (deg & km geodetic)
    0007 
    0008 function lla = eci2wgs84(r, eci2ecef)
    0009     p = eci2ecef*r;
    0010 
    0011     % convert ECEF to geodetic
    0012     lla = ecef2wgs84(p);
    0013 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
