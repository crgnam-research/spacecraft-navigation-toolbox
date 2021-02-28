[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [simple_models](index.md) \> Sphere.m



# Sphere

## Purpose 

``` 
```

## Overview 

``` 
**This is a script file.**
```

## Description 

```
 

```

## Cross-Reference Information 

This function calls:

   [Sphere](Sphere.md)

This function is called by:

   [Sphere](Sphere.md)

## Sub-functions 

   [function \[self\] = Sphere(position,radius)](#_sub1)
   [function \[intersects\] =
    rayCast(self,origins,rays)](#_sub2)

## Source Code 

```
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
    0023                 rays_to_intersects = normc(intersects'  origins);
    0024                 dot_prod = sum(rays_to_intersects.*rays,1);
    0025                 intersects(dot_prod<0,:) = nan;
    0026             end
    0027         end
    0028     end
    0029 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005