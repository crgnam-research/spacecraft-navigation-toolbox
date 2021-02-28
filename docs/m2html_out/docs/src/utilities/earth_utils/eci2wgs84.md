[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [earth_utils](index.md) \> eci2wgs84.m



# eci2wgs84

## Purpose 

``` 
**lla = eci2geodetic(r,JD,coefs)**
```

## Overview 

``` 
**function lla = eci2wgs84(r, eci2ecef)**
```

## Description 

```
 
 lla = eci2geodetic(r,JD,coefs)
 By Benjamin Reifler
 Inputs:   r (km ECI)
           JD (Julian date)
           coefs (1600x17,1275x17,66x11)
 Outputs:  lla = [lat lon h]' (deg & km geodetic)

```

## Cross-Reference Information 

This function calls:

   [ecef2wgs84](ecef2wgs84.md "function lla = ecef2wgs84(r) %#codegen")
    lla = ecef2geodetic(r)
   [eci2ecef](eci2ecef.md "function rotmat = eci2ecef(jd,coefs)")
    A = dcmeci2ecef_codegen(JD,coefs)

This function is called by:

## Source Code 

```
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
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005