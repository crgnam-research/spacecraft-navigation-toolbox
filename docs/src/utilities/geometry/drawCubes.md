[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [geometry](index.html) \> drawCubes.m

</div>

# drawCubes

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
**Extract locations and dimensions of each sphere:**
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function \[h\] = drawCubes(cubes,varargin)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
 Extract locations and dimensions of each sphere:
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

This function is called by:

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 function [h] = drawCubes(cubes,varargin)
    0002     % Extract locations and dimensions of each sphere:
    0003     h = gobjects(sum(cubes(:,5)),1);
    0004     iter = 1;
    0005     for ii = 1: size(cubes,1)
    0006         if cubes(ii,5)
    0007             h(iter) = drawCube(cubes(ii,1:4),varargin{:}); hold on
    0008             iter = iter+1;
    0009         end
    0010     end
    0011 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
