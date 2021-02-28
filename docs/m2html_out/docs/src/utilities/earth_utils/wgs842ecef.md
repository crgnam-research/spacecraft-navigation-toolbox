[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [earth_utils](index.md) \> wgs842ecef.m



# wgs842ecef

## Purpose 

``` 
**Adapted From Fundamentals of Spacecraft Attitude Determination and**
```

## Overview 

``` 
**function r = wgs842ecef(lla)**
```

## Description 

```
 
 Adapted From Fundamentals of Spacecraft Attitude Determination and
   Control by J. L. Crassidis and F. L. Markley
 Inputs:   lla = [lam phi h]' (deg & km geodetic)
 Outputs:  r (km ECEF)

```

## Cross-Reference Information 

This function calls:

This function is called by:

## Source Code 

```
    0001 % Adapted From Fundamentals of Spacecraft Attitude Determination and
    0002 %   Control by J. L. Crassidis and F. L. Markley
    0003 % Inputs:   lla = [lam phi h]' (deg & km geodetic)
    0004 % Outputs:  r (km ECEF)
    0005 function r = wgs842ecef(lla)
    0006     a = 6378.1370;          % Radius at the Equator
    0007     b = 6356.7523142;       % Radius at the Pole
    0008     f = (a  b)/a;
    0009     e = sqrt(f*(2  f));
    0010     N = a/sqrt(1  e^2*sind(lla(1))^2);
    0011     r = [(N + lla(3))*cosd(lla(1))*cosd(lla(2));...
    0012          (N + lla(3))*cosd(lla(1))*sind(lla(2));...
    0013          (N*(1  e^2) + lla(3))*sind(lla(1))];
    0014 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005