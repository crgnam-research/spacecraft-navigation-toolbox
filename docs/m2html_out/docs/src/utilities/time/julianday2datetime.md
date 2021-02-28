[Home](../../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [time](index.md) \> julianday2datetime.m



# julianday2datetime

## Purpose 

``` 
```

## Overview 

``` 
**function \[matlab_datetime\] = julianday2datetime(jd)**
```

## Description 

```
 

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

   [julianday2gregorian](julianday2gregorian.md "function [gregorian] = julianday2gregorian(jd)")

This function is called by:

   [Time](Time.md)

## Source Code 

```
    0001 function [matlab_datetime] = julianday2datetime(jd)
    0002     greg = julianday2gregorian(jd);
    0003     matlab_datetime = datetime(greg(1),greg(2),greg(3),greg(4),greg(5),greg(6));
    0004 end
```



Generated on Sat 27Feb2021 18:37:41 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005