[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [time](time_index.md)  


# function: julianday2datetime



**Inputs:** jd

**Outputs:** matlab_datetime

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
 function [matlab_datetime] = julianday2datetime(jd)
    %@code{true}
    greg = julianday2gregorian(jd);
    matlab_datetime = datetime(greg(1),greg(2),greg(3),greg(4),greg(5),greg(6));
end 
``` 
 
***

*Generated on 05-Mar-2021 16:40:51 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
