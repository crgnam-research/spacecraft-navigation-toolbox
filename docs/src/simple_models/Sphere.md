[]{#_top}

<div>

[Home](../../../index.html) \> [..](#) \> [src](#) \>
[simple_models](index.html) \> Sphere.m

</div>

# Sphere

## []{#_name}PURPOSE [![\^](../../../up.png)](#_top)

::: {.box}
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../up.png)](#_top)

::: {.box}
**This is a script file.**
:::

## []{#_description}DESCRIPTION [![\^](../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../up.png)](#_top)

This function calls:

-   [Sphere](Sphere.html){.code}

This function is called by:

-   [Sphere](Sphere.html){.code}

## []{#_subfunctions}SUBFUNCTIONS [![\^](../../../up.png)](#_top)

-   [function \[self\] = Sphere(position,radius)](#_sub1){.code}
-   [function \[intersects\] =
    rayCast(self,origins,rays)](#_sub2){.code}

## []{#_source}SOURCE CODE [![\^](../../../up.png)](#_top)

::: {.fragment}
    0001 classdef Sphere < handle
    0002     properties
    0003         position
    0004         radius
    0005     end
    0006     
    0007     %% Constructor
    0008     methods
    0009         function [self] = Sphere(position,radius)
    0010             self.position = position;
    0011             self.radius   = radius;
    0012         end
    0013     end
    0014     
    0015     %% Public Methods:
    0016     methods (Access = public)
    0017         function [intersects] = rayCast(self,origins,rays)
    0018             intersects = intersectLineSphere([origins', rays'],...
    0019                                              [self.position', self.radius]);
    0020             
    0021             % Check if intersects happened in direction of ray cast
    0022             if any(any(~isnan(intersects)))
    0023                 rays_to_intersects = normc(intersects' - origins);
    0024                 dot_prod = sum(rays_to_intersects.*rays,1);
    0025                 intersects(dot_prod<0,:) = nan;
    0026             end
    0027         end
    0028     end
    0029 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
