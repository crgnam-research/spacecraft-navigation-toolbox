[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [math](index.html) \> normc.m

</div>

# normc

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
**Highly vectorized normalization of columns**
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function \[M,n\] = normc(M)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
 Highly vectorized normalization of columns
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

This function is called by:

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 function [M,n] = normc(M)
    0002     % Highly vectorized normalization of columns
    0003     n = sqrt(sum(M.^2,1));
    0004     M = bsxfun(@rdivide,M,n);
    0005 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
