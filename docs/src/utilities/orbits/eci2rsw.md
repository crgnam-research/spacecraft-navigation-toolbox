[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [orbits](orbits_index.md)  

 
 # function: eci2rsw



**Inputs:** rECI,  vECI

**Outputs:** T,  rRSW,  vRSW

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
function [T, rRSW, vRSW] = eci2rsw(rECI, vECI)
    rvec = rECI/norm(rECI);
    wvec = cross(rECI, vECI)/norm(cross(rECI, vECI));
    svec = cross(wvec, rvec)/norm(cross(wvec, rvec));

    T = [rvec'; svec'; wvec'];

    rRSW = T*rECI;
    vRSW = T*vECI;
end

 
 ``` 
  
 ***

*Generated on 02-Mar-2021 01:01:24 by [m2md](https://github.com/crgnam-research/m2md) © 2021*