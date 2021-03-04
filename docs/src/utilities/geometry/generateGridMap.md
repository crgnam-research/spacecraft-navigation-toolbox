[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [geometry](geometry_index.md)  


# function: generateGridMap



**Inputs:** num_long, num_lat, rho

**Outputs:** longitude, latitude, r

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
 function [longitude,latitude,r] = generateGridMap(num_long,num_lat,rho)
    %@code{true}
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

*Generated on 03-Mar-2021 23:38:26 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
