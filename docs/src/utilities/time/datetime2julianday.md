[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [time](index.html) \> datetime2julianday.m

</div>

# datetime2julianday

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
**Assumes that the matlab datetime is on UTC time**
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function \[jd\] = datetime2julianday(matlab_datetime)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
 Assumes that the matlab datetime is on UTC time
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

-   [gregorian2julianday](gregorian2julianday.html "function [jd] = gregorian2julianday(gregorian)"){.code}
    First unpack the time array into its components for the sake of
    clarity

This function is called by:

-   [Time](Time.html){.code}

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 function [jd] = datetime2julianday(matlab_datetime)
    0002     % Assumes that the matlab datetime is on UTC time
    0003     gregorian = [year(matlab_datetime),...
    0004                  month(matlab_datetime),...
    0005                  day(matlab_datetime),...
    0006                  hour(matlab_datetime),...
    0007                  minute(matlab_datetime),...
    0008                  second(datetime)];
    0009     jd = gregorian2julianday(gregorian);
    0010 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
