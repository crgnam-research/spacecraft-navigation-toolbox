[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [time](index.md) \> unix2julianday.m



# unix2julianday

## Purpose 

``` 
```

## Overview 

``` 
**function \[jd\] = unix2julianday(unix)**
```

## Description 

```
 

```

## Cross-Reference Information 

This function calls:

This function is called by:

   [Time](Time.md)

## Source Code 

```
    0001 function [jd] = unix2julianday(unix)
    0002     jd = unix/86400 + 2440587.5;
    0003 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005