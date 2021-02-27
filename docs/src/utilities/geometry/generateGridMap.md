[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [geometry](index.html) \> generateGridMap.m

</div>

# generateGridMap

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function \[longitude,latitude,r\] =
generateGridMap(num_long,num_lat,rho)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

This function is called by:

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 function [longitude,latitude,r] = generateGridMap(num_long,num_lat,rho)
    0002     longitude = linspace(-pi,pi,num_long)';
    0003     latitude = linspace(-pi/2,pi/2,num_lat)';
    0004     r = zeros(length(longitude),length(latitude),3);
    0005     for ii = 1:length(longitude)
    0006         for jj = 1:length(latitude)
    0007             [x,y,z] = sph2cart(longitude(ii),latitude(jj),rho);
    0008             r(ii,jj,:) = [x;y;z];
    0009         end
    0010     end
    0011     [latitude,longitude] = meshgrid(latitude,longitude);
    0012 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
