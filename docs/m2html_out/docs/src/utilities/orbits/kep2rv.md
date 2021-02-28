[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [orbits](index.md) \> kep2rv.m



# kep2rv

## Purpose 

``` 
**Created 7/11/2014 by Chris Shelton**
```

## Overview 

``` 
**function \[R_eci,V_eci\] = kep2rv(a,e,i,omega,Omega,theta,mu)**
```

## Description 

```
 
Created 7/11/2014 by Chris Shelton
Given the orbital elements this function will find the positition and
velocity in ECI

```

## Cross-Reference Information 

This function calls:

This function is called by:

## Source Code 

```
    0001 function [R_eci,V_eci] = kep2rv(a,e,i,omega,Omega,theta,mu)
    0002     %Created 7/11/2014 by Chris Shelton
    0003     %Given the orbital elements this function will find the positition and
    0004     %velocity in ECI
    0005 
    0006     % Define Orbit Parameters
    0007     h = sqrt(mu.*a.*(1e.*e));
    0008     r = ((h.*h)./mu).*(1./(1+(e.*cos(theta))));
    0009     % Calculate R,V in PQW coordinates
    0010     R_pqw(:,1) = r.*cos(theta);
    0011     R_pqw(:,2) = r.*sin(theta);
    0012     R_pqw(:,3) = 0;
    0013     V_pqw(:,1) = (mu./h).*sin(theta);
    0014     V_pqw(:,2) = (mu./h).* (e+cos(theta));
    0015     V_pqw(:,3) = 0;
    0016 
    0017     % Define the transfomation matrix from PQW to ECI
    0018     a1 = (sin(Omega).*cos(i).*sin(omega) + cos(Omega).*cos(omega));
    0019     a2 = (sin(Omega).*cos(i).*cos(omega)  cos(Omega).*sin(omega));          
    0020     % a3 = (sin(i)*sin(omega));
    0021     a4 = (cos(Omega).*cos(i).*sin(omega) + sin(Omega).*cos(omega));
    0022     a5 = (cos(Omega).*cos(i).*cos(omega)  sin(Omega).*sin(omega));
    0023     % a6 = (sin(i)*cos(omega));
    0024     a7 = (sin(omega).*sin(i));
    0025     a8 = (cos(omega).*sin(i));
    0026     % a9 = (cos(i));
    0027 
    0028     % Transform the vectors from PQW into ECI
    0029     R_eci = [(a1.*R_pqw(:,1))+(a2.*R_pqw(:,2));(a4.*R_pqw(:,1)+a5.*R_pqw(:,2));(a7.*R_pqw(:,1) + a8.*R_pqw(:,2))];
    0030     V_eci = [(a1.*V_pqw(:,1))+(a2.*V_pqw(:,2));(a4.*V_pqw(:,1)+a5.*V_pqw(:,2));(a7.*V_pqw(:,1) + a8.*V_pqw(:,2))];
    0031 end
    0032
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005