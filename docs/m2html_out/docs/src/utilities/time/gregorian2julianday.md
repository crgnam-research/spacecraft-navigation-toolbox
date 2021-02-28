[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [time](index.md) \> gregorian2julianday.m



# gregorian2julianday

## Purpose 

``` 
**First unpack the time array into its components for the sake of
clarity**
```

## Overview 

``` 
**function \[jd\] = gregorian2julianday(gregorian)**
```

## Description 

```
 
 First unpack the time array into its components for the sake of clarity

```

## Cross-Reference Information 

This function calls:

This function is called by:

   [Time](Time.md)
   [datetime2julianday](datetime2julianday.md "function [jd] = datetime2julianday(matlab_datetime)")
    Assumes that the matlab datetime is on UTC time

## Source Code 

```
    0001 function [jd] = gregorian2julianday(gregorian)
    0002     % First unpack the time array into its components for the sake of clarity
    0003     year   = gregorian(1);
    0004     month  = gregorian(2);
    0005     day    = gregorian(3);
    0006     hour   = gregorian(4);
    0007     minute = gregorian(5);
    0008     sec    = gregorian(6);
    0009 
    0010     % Now break the conversion up into different terms
    0011     term2 = floor(7*(year + floor((month+9)/12))/4);
    0012     term3 = floor(275*month/9);
    0013 
    0014     % Perform the calculation
    0015     jd = 367*year  term2 + term3 + day + 1721013.5 + hour/24 + minute/1440 + sec/86400;
    0016 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005