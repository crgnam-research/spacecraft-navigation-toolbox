[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [earth_utils](earth_utils_index.md)  


# function: eci2wgs84



**Inputs:** r, eci2ecef

**Outputs:** lla

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
 function lla = eci2wgs84(r, eci2ecef)
    %@code{true}
    p = eci2ecef*r;

    % convert ECEF to geodetic
    lla = ecef2wgs84(p);
end 
``` 
 
***

*Generated on 04-Mar-2021 12:32:24 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
