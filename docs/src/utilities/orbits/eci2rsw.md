[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [orbits](orbits_index.md)  


# function: eci2rsw



**Inputs:** rECI, vECI

**Outputs:** T, rRSW, vRSW

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
 function [T, rRSW, vRSW] = eci2rsw(rECI, vECI)
    %@code{true}
    rvec = rECI/norm(rECI);
    wvec = cross(rECI, vECI)/norm(cross(rECI, vECI));
    svec = cross(wvec, rvec)/norm(cross(wvec, rvec));

    T = [rvec'; svec'; wvec'];

    rRSW = T*rECI;
    vRSW = T*vECI;
end 
``` 
 
***

*Generated on 05-Mar-2021 16:40:51 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
