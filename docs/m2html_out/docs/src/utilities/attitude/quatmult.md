[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [attitude](index.md) \> quatmult.m



# quatmult

## Purpose 

``` 
```

## Overview 

``` 
**function p = quatmult(q, r)**
```

## Description 

```
 

```

## Cross-Reference Information 

This function calls:

This function is called by:

## Source Code 

```
    0001 function p = quatmult(q, r)
    0002 
    0003 phi = [q(4)*eye(3)  skew(q(1:3)) ; q(1:3)'];
    0004 
    0005 p = [phi q]*r;
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005