[Home](../../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [time](index.md) \> julianday2unix.m



# julianday2unix

## Purpose 

``` 
```

## Overview 

``` 
**function \[unix\] = julianday2unix(jd)**
```

## Description 

```
 

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

   [Time](Time.md)

## Source Code 

```
    0001 function [unix] = julianday2unix(jd)
    0002     unix = (jd  2440587.5)*86400;
    0003 end
```



Generated on Sat 27Feb2021 18:37:41 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005