[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [orbits](index.html) \> rv2kep.m

</div>

# rv2kep

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
**This function calculates the orbital elements for a given a set of
state**
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function \[OE\] = rv2kep(r,v,mu)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
 This function calculates the orbital elements for a given a set of state
 vectors.

 This algorithm comes directly from "Fundamentals of Astrodynamics and
 Applications" by Vallado.
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

This function is called by:

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 function [OE] = rv2kep(r,v,mu)
    0002 % This function calculates the orbital elements for a given a set of state
    0003 % vectors.
    0004 %
    0005 % This algorithm comes directly from "Fundamentals of Astrodynamics and
    0006 % Applications" by Vallado.
    0007 
    0008 % Calculate Angular Momentum:
    0009 H = cross(r,v);
    0010 
    0011 % Calculate node vector:
    0012 n = cross([0 0 1],H);
    0013 
    0014 % Calculate eccentricity:
    0015 evec = ((norm(v)^2-mu/norm(r))*r - dot(r,v)*v)/mu;
    0016 e    = norm(evec);
    0017 
    0018 % Calculate specific energy:
    0019 energy = (norm(v)^2)/2 - mu/norm(r);
    0020 
    0021 % Calculate semi-major axis:
    0022 a = -mu/(2*energy);
    0023 
    0024 % Calculate inclination:
    0025 inc = acosd(H(3)/norm(H));
    0026 
    0027 % Calculate RAAN:
    0028 RAAN = acosd(n(1)/norm(n));
    0029 if n(2) < 0
    0030    RAAN = 360-RAAN;
    0031 end
    0032 
    0033 % Calculate Argument of Perigee:
    0034 argp = acos(dot(n,evec)/(norm(n)*e));
    0035 if evec(3) < 0
    0036    argp = 360-argp;
    0037 end
    0038 
    0039 % Calculate true anomaly:
    0040 nu = acosd(dot(evec,r)/(e*norm(r)));
    0041 if dot(r,v)<0
    0042    nu = 360 - nu;
    0043 end
    0044 
    0045 % Calculate true anomaly (Approximation):
    0046 M0 = nu - 2*e*sind(nu) + ((3/4)*(e^2) + (1/8)*e^4)*sind(2*nu) -...
    0047      (1/3)*(e^3)*sind(3*nu) + (5/32)*(e^4)*sind(4*nu);
    0048 
    0049 % Format output:
    0050 OE(1) = a;
    0051 OE(2) = e;
    0052 OE(3) = deg2rad(inc);
    0053 OE(4) = deg2rad(argp);
    0054 OE(5) = deg2rad(RAAN);
    0055 OE(6) = deg2rad(M0);
    0056 
    0057 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
