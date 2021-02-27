[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [math](index.html) \> cpm.m

</div>

# cpm

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
**Function cpm computes the standard cross-product matrix for a given**
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function outmat = cpm(invec)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
 Function cpm computes the standard cross-product matrix for a given
 3-vector.
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

This function is called by:

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 function outmat = cpm(invec)
    0002     % Function cpm computes the standard cross-product matrix for a given
    0003     % 3-vector.
    0004 
    0005     i1 = invec(1);
    0006     i2 = invec(2);
    0007     i3 = invec(3);
    0008 
    0009     outmat = [0, -i3, i2;
    0010               i3, 0, -i1;
    0011               -i2, i1, 0];
    0012 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
