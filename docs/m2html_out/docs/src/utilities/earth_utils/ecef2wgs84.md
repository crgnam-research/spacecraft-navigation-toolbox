[Home](../../../../../index.md) \> [..](#) \> [src](#) \> [utilities](#)
\> [earth_utils](index.md) \> ecef2wgs84.m



# ecef2wgs84

## Purpose 

``` 
**lla = ecef2geodetic(r)**
```

## Overview 

``` 
**function lla = ecef2wgs84(r) %\#codegen**
```

## Description 

```
 
 lla = ecef2geodetic(r)
 By Benjamin Reifler 2017
 Modified by Chris Gnam 2019
 Adapted From Fundamentals of Spacecraft Attitude Determination and
   Control by J. L. Crassidis and F. L. Markley
 Inputs:   r (km ECEF)
 Outputs:  lla = [lam phi h]' (deg & km geodetic)

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

   [eci2wgs84](eci2wgs84.md "function lla = eci2wgs84(r, eci2ecef)")
    lla = eci2geodetic(r,JD,coefs)

## Source Code 

```
    0001 % lla = ecef2geodetic(r)
    0002 % By Benjamin Reifler 2017
    0003 % Modified by Chris Gnam 2019
    0004 % Adapted From Fundamentals of Spacecraft Attitude Determination and
    0005 %   Control by J. L. Crassidis and F. L. Markley
    0006 % Inputs:   r (km ECEF)
    0007 % Outputs:  lla = [lam phi h]' (deg & km geodetic)
    0008 
    0009 function lla = ecef2wgs84(r) %#codegen
    0010 
    0011 % preallocate
    0012 lla = zeros(3,1);
    0013 
    0014 % calculate
    0015 a = 6378.1370;              % REquator
    0016 b = 6356.7523142;           % RPole
    0017 e = 0.081819190928905;      % sqrt(1  b^2/a^2)
    0018 eps = 0.082094438036852;    % sqrt(a^2/b^2  1)
    0019 rho = sqrt(r(1)^2 + r(2)^2);
    0020 p = abs(r(3))/eps^2;
    0021 s = rho^2/(e^2*eps^2);
    0022 q = p^2  b^2 + s;
    0023 u = p/sqrt(q);
    0024 v = b^2*u^2/q;
    0025 P = 27*v*s/q;
    0026 Q = (sqrt(P + 1) + sqrt(P))^(2/3);
    0027 t = (1 + Q + 1/Q)/6;
    0028 c = sqrt(u^2  1 + 2*t);
    0029 w = (c  u)/2;
    0030 
    0031 % NEED TO INCLUDE abs() CALL HERE TO KEEP FROM GOING IMAGINARY WHEN r(3)~0
    0032 X = abs(sqrt(t^2 + v)  u*w  t/2  0.25);
    0033 d = sign(r(3))*sqrt(q)*(w + sqrt(X));
    0034 N = a*sqrt(1 + eps^2*d^2/b^2);
    0035 lla(1) = asind((eps^2 + 1)*d/N);
    0036 lla(2) = atan2(r(2), r(1))*180/pi;
    0037 lla(3) = rho*cosd(lla(1)) + r(3)*sind(lla(1))  a^2/N;
    0038 
    0039 end
```



Generated on Sat 27Feb2021 18:22:26 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005