[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [time](index.html) \> julianday2unix.m

</div>

# julianday2unix

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function \[unix\] = julianday2unix(jd)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

This function is called by:

-   [Time](Time.html){.code}

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 function [unix] = julianday2unix(jd)
    0002     unix = (jd - 2440587.5)*86400;
    0003 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
