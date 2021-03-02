[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [earth_utils](earth_utils_index.md)  

 
 # function: wgs842ecef



**Inputs:** lla

**Outputs:** r

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
function r = wgs842ecef(lla)
    a = 6378.1370;          % Radius at the Equator
    b = 6356.7523142;       % Radius at the Pole
    f = (a - b)/a;
    e = sqrt(f*(2 - f));
    N = a/sqrt(1 - e^2*sind(lla(1))^2);
    r = [(N + lla(3))*cosd(lla(1))*cosd(lla(2));...
         (N + lla(3))*cosd(lla(1))*sind(lla(2));...
         (N*(1 - e^2) + lla(3))*sind(lla(1))];
end
 
 ``` 
  
 ***

*Generated on 02-Mar-2021 01:01:23 by [m2md](https://github.com/crgnam-research/m2md) © 2021*