[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [time](index.html) \> julianday2gmst.m

</div>

# julianday2gmst

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function \[gmst\] = julianday2gmst(jd)**
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
    0001 function [gmst] = julianday2gmst(jd)
    0002     t_ut1 = (jd - 2451545.0)/36525.0;
    0003 
    0004     gmst = -6.2e-6*t_ut1^3 + 0.093104*t_ut1^2 +...
    0005            (876600.0*3600.0 + 8640184.812866)*t_ut1 + 67310.54841;
    0006 
    0007     gmst = rem(deg2rad(gmst)/240.0, 2*pi);
    0008 
    0009     if (gmst < 0)
    0010         gmst = gmst + 2*pi;
    0011     end
    0012 end
    0013
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
