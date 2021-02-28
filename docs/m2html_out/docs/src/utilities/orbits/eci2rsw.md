[Home](../../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [orbits](index.md) \> eci2rsw.m



# eci2rsw

## Purpose 

``` 
**% Function Description:**
```

## Overview 

``` 
**function \[T, rRSW, vRSW\] = eci2rsw(rECI, vECI)**
```

## Description 

```
 
% Function Description:
 Convert a position in ECI to RSW.
    Chris Gnam, 2018

 Reference: Fundamentals of Astrodynamics and Applications  Vallado

 ===============
 INPUT VARIABLES
 ===============
   rECI    ECI Position vector of reference frame (km)                                           
   vECI    ECI Velocity vector of reference frame (km/s)                                          

 ================
 OUTPUT VARIABLES
 ================
   T      Transformation matrix between ECI and this RSW
   rRSW   Hill's relative position vector (km)
   vRSW   Hill's relative velocity vector (km/s)

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

   [eci2hill](eci2hill.md "function [rHill,vHill] = eci2hill(rTgt, vTgt, rChase, vChase)")
    % Function Description:

## Source Code 

```
    0001 function [T, rRSW, vRSW] = eci2rsw(rECI, vECI)
    0002 %% Function Description:
    0003 % Convert a position in ECI to RSW.
    0004 %    Chris Gnam, 2018
    0005 %
    0006 % Reference: Fundamentals of Astrodynamics and Applications  Vallado
    0007 %
    0008 % ===============
    0009 % INPUT VARIABLES
    0010 % ===============
    0011 %   rECI    ECI Position vector of reference frame (km)
    0012 %   vECI    ECI Velocity vector of reference frame (km/s)
    0013 %
    0014 % ================
    0015 % OUTPUT VARIABLES
    0016 % ================
    0017 %   T      Transformation matrix between ECI and this RSW
    0018 %   rRSW   Hill's relative position vector (km)
    0019 %   vRSW   Hill's relative velocity vector (km/s)
    0020 
    0021 %% ECI 2 RSW Conversion:
    0022 rvec = rECI/norm(rECI);
    0023 wvec = cross(rECI, vECI)/norm(cross(rECI, vECI));
    0024 svec = cross(wvec, rvec)/norm(cross(wvec, rvec));
    0025 
    0026 T = [rvec'; svec'; wvec'];
    0027  
    0028 rRSW = T*rECI;
    0029 vRSW = T*vECI;
    0030 
    0031 end
    0032
```



Generated on Sat 27Feb2021 18:37:41 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005