[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [time](time_index.md)  


# function: julianday2unix



**Inputs:** jd

**Outputs:** unix

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
 function [unix] = julianday2unix(jd)
    %@code{true}
    unix = (jd - 2440587.5)*86400;
end 
``` 
 
***

*Generated on 03-Mar-2021 23:38:27 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
