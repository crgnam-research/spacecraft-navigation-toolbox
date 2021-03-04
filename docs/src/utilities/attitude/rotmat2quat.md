[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [attitude](attitude_index.md)  


# function: rotmat2quat



**Inputs:** rotmat

**Outputs:** q

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
 function q = rotmat2quat(rotmat)
    %@code{true}
    q4 = 0.5*sqrt(1+trace(rotmat));
    q1 = 1/(4*q4)*(rotmat(2,3)-rotmat(3,2));
    q2 = 1/(4*q4)*(rotmat(3,1)-rotmat(1,3));
    q3 = 1/(4*q4)*(rotmat(1,2)-rotmat(2,1));
    q = [q1;q2;q3;q4];
end 
``` 
 
***

*Generated on 03-Mar-2021 23:38:26 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
