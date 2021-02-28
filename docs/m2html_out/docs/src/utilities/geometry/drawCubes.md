[Home](../../../../../index.md) \> [..](#) \> [src](#) \> [utilities](#)
\> [geometry](index.md) \> drawCubes.m



# drawCubes

## Purpose 

``` 
**Extract locations and dimensions of each sphere:**
```

## Overview 

``` 
**function \[h\] = drawCubes(cubes,varargin)**
```

## Description 

```
 
 Extract locations and dimensions of each sphere:

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

## Source Code 

```
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
```



Generated on Sat 27Feb2021 18:22:26 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005