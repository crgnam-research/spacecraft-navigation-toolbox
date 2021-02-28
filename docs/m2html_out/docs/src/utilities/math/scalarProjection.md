[Home](../../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [math](index.md) \> scalarProjection.m



# scalarProjection

## Purpose 

``` 
```

## Overview 

``` 
**function \[scalar\] = scalarProjection(a,b)**
```

## Description 

```
 

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

## Source Code 

```
    0001 function [scalar] = scalarProjection(a,b)
    0002     scalar = dot(a,b/norm(b));
    0003 end
```



Generated on Sat 27Feb2021 18:37:41 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005