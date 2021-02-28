[Home](../../../../../index.md) \> [..](#) \> [src](#) \> [utilities](#)
\> [orbits](index.md) \> eci2hill.m



# eci2hill

## Purpose 

``` 
**% Function Description:**
```

## Overview 

``` 
**function \[rHill,vHill\] = eci2hill(rTgt, vTgt, rChase, vChase)**
```

## Description 

```
 
% Function Description:
 Converts position and velocity from ECI J2000 to Hill's frame (using
 target + chase)
    Chris Gnam, 2018

 Reference: Fundamentals of Astrodynamics and Applications  Vallado

 ===============
 INPUT VARIABLES
 ===============
   rTgt    ECI Position vector of reference frame (km)                                         
   vTgt    ECI Velocity vector of reference frame (km/s)                                         
   rChase  ECI Position vector of chase (km)
   vChase  ECI Velocity vector of chase (km/s)

 ================
 OUTPUT VARIABLES
 ================
   rHill   Hill's relative position vector (km)
   vHill   Hill's relative velocity vector (km/s)

 (Radial, InTrack, CrossTrack)

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

   [eci2rsw](eci2rsw.md "function [T, rRSW, vRSW] = eci2rsw(rECI, vECI)")
    % Function Description:

This function is called by:

## Source Code 

```
    0001 function [rHill,vHill] = eci2hill(rTgt, vTgt, rChase, vChase)
    0002 %% Function Description:
    0003 % Converts position and velocity from ECI J2000 to Hill's frame (using
    0004 % target + chase)
    0005 %    Chris Gnam, 2018
    0006 %
    0007 % Reference: Fundamentals of Astrodynamics and Applications  Vallado
    0008 %
    0009 % ===============
    0010 % INPUT VARIABLES
    0011 % ===============
    0012 %   rTgt    ECI Position vector of reference frame (km)
    0013 %   vTgt    ECI Velocity vector of reference frame (km/s)
    0014 %   rChase  ECI Position vector of chase (km)
    0015 %   vChase  ECI Velocity vector of chase (km/s)
    0016 %
    0017 % ================
    0018 % OUTPUT VARIABLES
    0019 % ================
    0020 %   rHill   Hill's relative position vector (km)
    0021 %   vHill   Hill's relative velocity vector (km/s)
    0022 %
    0023 % (Radial, InTrack, CrossTrack)
    0024 
    0025 %% ECI 2 Hill frame Conversion:
    0026 rTgtMag   = sqrt(sum(rTgt.^2,1));
    0027 rChaseMag = sqrt(sum(rChase.^2,1));
    0028 vTgtMag   = sqrt(sum(vTgt.^2,1));
    0029 
    0030 RSW = eci2rsw(rTgt, vTgt);
    0031 
    0032 %Use RSW rotation matrix to convert rChase and vChase to RSW
    0033 r_Chase_RSW = RSW*rChase;
    0034 v_Chase_RSW = RSW*vChase;
    0035 
    0036 %Find Rotation angles to go from target to interceptor
    0037 phi_chase    = asin(r_Chase_RSW(3)/rTgtMag); % OLD > asin(r_Chase_RSW(3)/rChaseMag)
    0038 lambda_chase = atan2(r_Chase_RSW(2),r_Chase_RSW(1));
    0039 CPC = cos(phi_chase);     
    0040 SPC = sin(phi_chase);
    0041 SLC = sin(lambda_chase);  
    0042 CLC = cos(lambda_chase);
    0043 
    0044 %Find Position component rotations
    0045 rHill = cat(1, rChaseMag  rTgtMag, ...
    0046                lambda_chase*rTgtMag, ...
    0047                phi_chase*rTgtMag);
    0048            
    0049 %Find the rotation matrix RSW>SEZ of chaser
    0050 RSW_SEZ(1,1) = SPC*CLC;  RSW_SEZ(1,2) = SPC*SLC;   RSW_SEZ(1,3) = CPC;
    0051 RSW_SEZ(2,1) = SLC;     RSW_SEZ(2,2) = CLC;       RSW_SEZ(2,3) = 0;
    0052 RSW_SEZ(3,1) = CPC*CLC;  RSW_SEZ(3,2) = CPC.*SLC;  RSW_SEZ(3,3) = SPC;
    0053 
    0054 %Find the velocity component of positions using the angular rates in SEZ frame
    0055 v_Chase_SEZ = RSW_SEZ*v_Chase_RSW;
    0056 vHill = [v_Chase_SEZ(3),...
    0057          rTgtMag*(v_Chase_SEZ(2)/(rChaseMag*CPC)vTgtMag/rTgtMag),...
    0058          rTgtMag*v_Chase_SEZ(1)/rChaseMag];
    0059 end
```



Generated on Sat 27Feb2021 18:22:26 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005