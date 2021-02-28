[Home](../../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [attitude](index.md) \> rotmat2quat.m



# rotmat2quat

## Purpose 

``` 
```

## Overview 

``` 
**function q = rotmat2quat(rotmat)**
```

## Description 

```
 

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

   [Attitude](Attitude.md)

## Source Code 

```
    0001 function q = rotmat2quat(rotmat)
    0002     q4 = 0.5*sqrt(1+trace(rotmat));
    0003     q1 = 1/(4*q4)*(rotmat(2,3)rotmat(3,2));
    0004     q2 = 1/(4*q4)*(rotmat(3,1)rotmat(1,3));
    0005     q3 = 1/(4*q4)*(rotmat(1,2)rotmat(2,1));
    0006     q = [q1;q2;q3;q4];
    0007 end
    0008
```



Generated on Sat 27Feb2021 18:37:41 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005