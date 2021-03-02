[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [earth_utils](earth_utils_index.md)  

 
 # function: eci2wgs84



**Inputs:** r,  eci2ecef

**Outputs:** lla

 ***

## Sub-Functions

*No Sub-Functions*

[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Sub-Function Descriptions

*No Sub-Functions*

 
 *** 

# Source Code:

 ```matlab 
 % INCLUDECODE>{true}
function lla = eci2wgs84(r, eci2ecef)
    p = eci2ecef*r;

    % convert ECEF to geodetic
    lla = ecef2wgs84(p);
end 
 ``` 
  
 ***

*Generated on 02-Mar-2021 01:01:23 by [m2md](https://github.com/crgnam-research/m2md) © 2021*