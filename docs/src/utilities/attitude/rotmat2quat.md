[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [attitude](index.html) \> rotmat2quat.m

</div>

# rotmat2quat

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function q = rotmat2quat(rotmat)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

This function is called by:

-   [Attitude](Attitude.html){.code}

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 function q = rotmat2quat(rotmat)
    0002     q4 = 0.5*sqrt(1+trace(rotmat));
    0003     q1 = 1/(4*q4)*(rotmat(2,3)-rotmat(3,2));
    0004     q2 = 1/(4*q4)*(rotmat(3,1)-rotmat(1,3));
    0005     q3 = 1/(4*q4)*(rotmat(1,2)-rotmat(2,1));
    0006     q = [q1;q2;q3;q4];
    0007 end
    0008
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
