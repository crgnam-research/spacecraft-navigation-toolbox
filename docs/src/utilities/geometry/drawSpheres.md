[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [geometry](index.html) \> drawSpheres.m

</div>

# drawSpheres

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function \[h\] = drawSpheres(spheres,varargin)**
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
    0001 function [h] = drawSpheres(spheres,varargin)
    0002     h = gobjects(sum(spheres(:,5)),1);
    0003     iter = 1;
    0004     for ii = 1: size(spheres,1)
    0005         if spheres(ii,5)
    0006             h(iter) = drawSphere(spheres(ii,1:4),'nPhi',16,'nTheta',8,varargin{:}); hold on
    0007             iter = iter+1;
    0008         end
    0009     end
    0010 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
