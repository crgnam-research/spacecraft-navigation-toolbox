[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [time](index.html) \> julianday2datetime.m

</div>

# julianday2datetime

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function \[matlab_datetime\] = julianday2datetime(jd)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

-   [julianday2gregorian](julianday2gregorian.html "function [gregorian] = julianday2gregorian(jd)"){.code}

This function is called by:

-   [Time](Time.html){.code}

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 function [matlab_datetime] = julianday2datetime(jd)
    0002     greg = julianday2gregorian(jd);
    0003     matlab_datetime = datetime(greg(1),greg(2),greg(3),greg(4),greg(5),greg(6));
    0004 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
