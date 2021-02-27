[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [attitude](index.html) \> quatmult.m

</div>

# quatmult

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function p = quatmult(q, r)**
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
    0001 function p = quatmult(q, r)
    0002 
    0003 phi = [q(4)*eye(3) - skew(q(1:3)) ; -q(1:3)'];
    0004 
    0005 p = [phi q]*r;
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
