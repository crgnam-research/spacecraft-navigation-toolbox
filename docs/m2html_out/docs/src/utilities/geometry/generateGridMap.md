[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [geometry](index.md) \> generateGridMap.m



# generateGridMap

## Purpose 

``` 
```

## Overview 

``` 
**function \[longitude,latitude,r\] =
generateGridMap(num_long,num_lat,rho)**
```

## Description 

```
 

```

## Cross-Reference Information 

This function calls:

This function is called by:

## Source Code 

```
    0001 function [longitude,latitude,r] = generateGridMap(num_long,num_lat,rho)
    0002     longitude = linspace(pi,pi,num_long)';
    0003     latitude = linspace(pi/2,pi/2,num_lat)';
    0004     r = zeros(length(longitude),length(latitude),3);
    0005     for ii = 1:length(longitude)
    0006         for jj = 1:length(latitude)
    0007             [x,y,z] = sph2cart(longitude(ii),latitude(jj),rho);
    0008             r(ii,jj,:) = [x;y;z];
    0009         end
    0010     end
    0011     [latitude,longitude] = meshgrid(latitude,longitude);
    0012 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005