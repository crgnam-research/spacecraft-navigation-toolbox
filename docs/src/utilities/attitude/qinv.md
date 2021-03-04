[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [attitude](attitude_index.md)  


# function: qinv



**Inputs:** q

**Outputs:** invq

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
 function invq = qinv(q)
    %@code{true}
    invq = [-q(1:3) ; q(4)];
end 
``` 
 
***

*Generated on 03-Mar-2021 23:38:26 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
