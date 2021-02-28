[Home](../../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [time](index.md) \> julianday2gregorian.m



# julianday2gregorian

## Purpose 

``` 
```

## Overview 

``` 
**function \[gregorian\] = julianday2gregorian(jd)**
```

## Description 

```
 

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

   [Time](Time.md)
   [julianday2datetime](julianday2datetime.md "function [matlab_datetime] = julianday2datetime(jd)")

## Source Code 

```
    0001 function [gregorian] = julianday2gregorian(jd)
    0002     t_1900 = (jd  2415019.5)/365.25;
    0003     year = 1900 + floor(t_1900);
    0004     leapYears = floor((year19001)/4);
    0005     days = (jd  2415019.5)  ((year1900)*365 + leapYears);
    0006 
    0007     if days < 1.0
    0008         year = year  1;
    0009         leapYears = floor( (year19001)/4 );
    0010         days = (jd  2415019.5)  ((year1900)*365 + leapYears);
    0011     end
    0012 
    0013     LMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    0014     if mod(year, 4) == 0
    0015         LMonth(2) = 29;
    0016     end
    0017 
    0018     dayOfYear = floor(days);
    0019     daySum = 0;
    0020     monthFound = false;
    0021     month = 0;
    0022     day = 0;
    0023     for i = 1:11
    0024         daySum = daySum + LMonth(i);
    0025         if ((daySum+1) > dayOfYear) && (monthFound == false)
    0026             month = i;
    0027             day = dayOfYear  sum( LMonth(1:i1) );
    0028             monthFound = true;
    0029         end
    0030     end
    0031 
    0032     tau = (days  dayOfYear)*24;
    0033     hour = floor( tau );
    0034     minute = floor( (tauhour)*60 );
    0035     second = (tau  hour  minute/60)*3600;
    0036 
    0037     % Compile Results into output
    0038     gregorian = [year, month, day, hour, minute, second];
    0039 end
```



Generated on Sat 27Feb2021 18:37:41 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005