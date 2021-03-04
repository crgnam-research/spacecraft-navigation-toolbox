[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [time](time_index.md)  


# function: julianday2tut1



**Inputs:** jd

**Outputs:** t_ut1

 ***

## Sub-Functions

*No Sub-Functions*

 ***

## Detailed Description



 ***

## Sub-Function Descriptions

*No Sub-Functions*

 
 *** 

# Source Code:

 ```matlab 
 function [t_ut1] = julianday2tut1(jd)
    %@code{true}
    t_ut1 = (jd - 2451545.0)/36525;
end 
``` 
 
***

*Generated on 04-Mar-2021 12:32:25 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
