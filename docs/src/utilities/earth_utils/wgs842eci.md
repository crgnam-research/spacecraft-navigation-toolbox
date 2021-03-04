[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [earth_utils](earth_utils_index.md)  


# function: wgs842eci



**Inputs:** lla, eci2ecef

**Outputs:** r

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
 function r = wgs842eci(lla, eci2ecef)
    %@code{true}
    % convert geodetic to ECEF
    p = geodetic2ecef(lla);

    r = eci2ecef'*p;
end 
``` 
 
***

*Generated on 04-Mar-2021 00:18:22 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
