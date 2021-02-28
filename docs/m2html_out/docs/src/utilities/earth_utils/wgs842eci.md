[Home](../../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [earth_utils](index.md) \> wgs842eci.m



# wgs842eci

## Purpose 

``` 
**r = geodetic2eci(lla,JD,xCoefs,yCoefs,sCoefs)**
```

## Overview 

``` 
**function r = wgs842eci(lla, eci2ecef) %\# codegen**
```

## Description 

```
 
 r = geodetic2eci(lla,JD,xCoefs,yCoefs,sCoefs)
 By Benjamin Reifler
 Inputs:   lla = [lat lon h]' (deg & km geodetic)
           JD (Julian date)
           coefs (1600x17,1275x17,66x11)
 Outputs:  r (km ECI)

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

   [eci2ecef](eci2ecef.md "function rotmat = eci2ecef(jd,coefs)")
    A = dcmeci2ecef_codegen(JD,coefs)

This function is called by:

## Source Code 

```
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
```



Generated on Sat 27Feb2021 18:37:41 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005