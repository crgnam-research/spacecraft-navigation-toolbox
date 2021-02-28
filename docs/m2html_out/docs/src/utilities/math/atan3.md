[Home](../../../../../index.md) \> [..](#) \> [src](#) \> [utilities](#)
\> [math](index.md) \> atan3.m



# atan3

## Purpose 

``` 
**four quadrant inverse tangent**
```

## Overview 

``` 
**function y = atan3 (a, b)**
```

## Description 

```
 
 four quadrant inverse tangent

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

## Source Code 

```
    0001 function y = atan3 (a, b)
    0002 % four quadrant inverse tangent
    0003 
    0004 % input
    0005 
    0006 %  a = sine of angle
    0007 %  b = cosine of angle
    0008 
    0009 % output
    0010 
    0011 %  y = angle (radians; 0 =< c <= 2 * pi)
    0012 
    0013 % Celestial Computing with MATLAB
    0014 
    0015 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    0016 
    0017 epsilon = 0.0000000001;
    0018 
    0019 pidiv2 = 0.5 * pi;
    0020 
    0021 if (abs(a) < epsilon)
    0022    y = (1  sign(b)) * pidiv2;
    0023    return;
    0024 else
    0025    c = (2  sign(a)) * pidiv2;
    0026 end
    0027 
    0028 if (abs(b) < epsilon)
    0029    y = c;
    0030    return;
    0031 else
    0032    y = c + sign(a) * sign(b) * (abs(atan(a / b))  pidiv2);
    0033 end
    0034 
    0035 end
```



Generated on Sat 27Feb2021 18:22:26 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005