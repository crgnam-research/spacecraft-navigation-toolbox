[Home](../../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [math](index.md) \> cpm.m



# cpm

## Purpose 

``` 
**Function cpm computes the standard crossproduct matrix for a given**
```

## Overview 

``` 
**function outmat = cpm(invec)**
```

## Description 

```
 
 Function cpm computes the standard crossproduct matrix for a given
 3vector.

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

## Source Code 

```
    0001 function outmat = cpm(invec)
    0002     % Function cpm computes the standard crossproduct matrix for a given
    0003     % 3vector.
    0004 
    0005     i1 = invec(1);
    0006     i2 = invec(2);
    0007     i3 = invec(3);
    0008 
    0009     outmat = [0, i3, i2;
    0010               i3, 0, i1;
    0011               i2, i1, 0];
    0012 end
```



Generated on Sat 27Feb2021 18:37:41 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005