[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [time](time_index.md)  

 
 # function: julianday2gmst



**Inputs:** jd

**Outputs:** gmst

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
function [gmst] = julianday2gmst(jd)
    t_ut1 = (jd - 2451545.0)/36525.0;

    gmst = -6.2e-6*t_ut1^3 + 0.093104*t_ut1^2 +...
           (876600.0*3600.0 + 8640184.812866)*t_ut1 + 67310.54841;

    gmst = rem(deg2rad(gmst)/240.0, 2*pi);

    if (gmst < 0)
        gmst = gmst + 2*pi;
    end
end

 
 ``` 
  
 ***

*Generated on 02-Mar-2021 00:52:51 by [m2md](https://github.com/crgnam-research/m2md) © 2021*