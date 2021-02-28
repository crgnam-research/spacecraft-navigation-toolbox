[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [math](index.md) \> normw.m



# normw

## Purpose 

``` 
```

## Overview 

``` 
**function \[M,n\] = normw(M)**
```

## Description 

```
 

```

## Cross-Reference Information 

This function calls:

This function is called by:

## Source Code 

```
    0001 function [M,n] = normw(M)
    0002     n = sqrt(sum(M.^2,3));
    0003     M = bsxfun(@rdivide,M,n);
    0004 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005