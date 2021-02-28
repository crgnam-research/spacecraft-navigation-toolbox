[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [time](index.md) \> datetime2julianday.m



# datetime2julianday

## Purpose 

``` 
**Assumes that the matlab datetime is on UTC time**
```

## Overview 

``` 
**function \[jd\] = datetime2julianday(matlab_datetime)**
```

## Description 

```
 
 Assumes that the matlab datetime is on UTC time

```

## Cross-Reference Information 

This function calls:

   [gregorian2julianday](gregorian2julianday.md "function [jd] = gregorian2julianday(gregorian)")
    First unpack the time array into its components for the sake of
    clarity

This function is called by:

   [Time](Time.md)

## Source Code 

```
    0001 function [jd] = datetime2julianday(matlab_datetime)
    0002     % Assumes that the matlab datetime is on UTC time
    0003     gregorian = [year(matlab_datetime),...
    0004                  month(matlab_datetime),...
    0005                  day(matlab_datetime),...
    0006                  hour(matlab_datetime),...
    0007                  minute(matlab_datetime),...
    0008                  second(datetime)];
    0009     jd = gregorian2julianday(gregorian);
    0010 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005