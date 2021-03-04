[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [attitude](attitude_index.md)  


# function: quatmult



**Inputs:** q, r

**Outputs:** p

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
 function p = quatmult(q, r)
    %@code{true}
    phi = [q(4)*eye(3) - skew(q(1:3)) ; -q(1:3)'];

    p = [phi q]*r;
end 
``` 
 
***

*Generated on 04-Mar-2021 00:23:48 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
