[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [geometry](index.md) \> drawSpheres.m



# drawSpheres

## Purpose 

``` 
```

## Overview 

``` 
**function \[h\] = drawSpheres(spheres,varargin)**
```

## Description 

```
 

```

## Cross-Reference Information 

This function calls:

This function is called by:

## Source Code 

```
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
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005