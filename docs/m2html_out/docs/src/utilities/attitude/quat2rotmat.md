[Home](../../../../../index.md) \> [..](#) \> [src](#) \> [utilities](#)
\> [attitude](index.md) \> quat2rotmat.m



# quat2rotmat

## Purpose 

``` 
```

## Overview 

``` 
**function A = quat2rotmat(q)**
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
    0001 function A = quat2rotmat(q)
    0002     A = [q(1)^2q(2)^2q(3)^2+q(4)^2, 2*(q(1)*q(2)+q(3)*q(4)), 2*(q(1)*q(3)q(2)*q(4));
    0003          2*(q(1)*q(2)q(3)*q(4)), q(1)^2+q(2)^2q(3)^2+q(4)^2, 2*(q(2)*q(3)+q(1)*q(4));
    0004          2*(q(1)*q(3)+q(2)*q(4)), 2*(q(2)*q(3)q(1)*q(4)), q(1)^2q(2)^2+q(3)^2+q(4)^2];
    0005 end
```



Generated on Sat 27Feb2021 18:22:26 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005