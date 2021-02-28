[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [math](index.md) \> normr.m



# normr

## Purpose 

``` 
**Highly vectorized normalization of rows**
```

## Overview 

``` 
**function \[M,n\] = normr(M)**
```

## Description 

```
 
 Highly vectorized normalization of rows

```

## Cross-Reference Information 

This function calls:

This function is called by:

## Source Code 

```
    0001 function [M,n] = normr(M)
    0002     % Highly vectorized normalization of rows
    0003     n = sqrt(sum(M.^2,2));
    0004     M = bsxfun(@rdivide,M,n);
    0005 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005