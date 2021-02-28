[Home](../../../../../index.md) \> [..](#) \> [src](#) \> [utilities](#)
\> [math](index.md) \> normc.m



# normc

## Purpose 

``` 
**Highly vectorized normalization of columns**
```

## Overview 

``` 
**function \[M,n\] = normc(M)**
```

## Description 

```
 
 Highly vectorized normalization of columns

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

## Source Code 

```
    0001 function [M,n] = normc(M)
    0002     % Highly vectorized normalization of columns
    0003     n = sqrt(sum(M.^2,1));
    0004     M = bsxfun(@rdivide,M,n);
    0005 end
```



Generated on Sat 27Feb2021 18:22:26 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005