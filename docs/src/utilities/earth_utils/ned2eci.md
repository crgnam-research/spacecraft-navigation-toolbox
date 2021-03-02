[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [earth_utils](earth_utils_index.md)  

 
 # function: ned2eci



**Inputs:** v_ned,  lat,  lon,  eci2ecef

**Outputs:** v_eci

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
function [v_eci] = ned2eci(v_ned, lat, lon, eci2ecef) %# codegen
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

*Generated on 02-Mar-2021 00:52:50 by [m2md](https://github.com/crgnam-research/m2md) © 2021*