[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [time](time_index.md)  


# function: unix2julianday



**Inputs:** unix

**Outputs:** jd

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
 function [jd] = unix2julianday(unix)
    %@code{true}
    jd = unix/86400 + 2440587.5;
end 
``` 
 
***

*Generated on 04-Mar-2021 00:18:22 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
