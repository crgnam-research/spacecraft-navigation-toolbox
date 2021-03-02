[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [geometry](geometry_index.md)  

 
 # function: generateGridMap



**Inputs:** num_long, num_lat, rho

**Outputs:** longitude, latitude, r

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
function [longitude,latitude,r] = generateGridMap(num_long,num_lat,rho)
    longitude = linspace(-pi,pi,num_long)';
    latitude = linspace(-pi/2,pi/2,num_lat)';
    r = zeros(length(longitude),length(latitude),3);
    for ii = 1:length(longitude)
        for jj = 1:length(latitude)
            [x,y,z] = sph2cart(longitude(ii),latitude(jj),rho);
            r(ii,jj,:) = [x;y;z];
        end
    end
    [latitude,longitude] = meshgrid(latitude,longitude);
end 
 ``` 
  
 ***

*Generated on 02-Mar-2021 01:01:24 by [m2md](https://github.com/crgnam-research/m2md) © 2021*