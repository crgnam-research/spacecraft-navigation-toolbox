[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [earth_utils](earth_utils_index.md)  


# function: ned2eci



**Inputs:** v_ned, lat, lon, eci2ecef

**Outputs:** v_eci

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
 function [v_eci] = ned2eci(v_ned, lat, lon, eci2ecef)
    %@code{true}
    % NED -> ECEF rotation matrix
    cosl = cosd(lon);
    sinl = sind(lon);
    cosp = cosd(lat);
    sinp = sind(lat);
    A = [-sinp*cosl -sinl  -cosp*cosl;
         -sinp*sinl  cosl  -cosp*sinl;
            cosp      0      -sinp];

    % NED -> ECEF -> ECI rotation
    v_eci = eci2ecef'*A*v_ned;
end 
``` 
 
***

*Generated on 04-Mar-2021 12:32:24 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
