[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [geometry](geometry_index.md)  


# function: drawSpheres



**Inputs:** spheres, varargin

**Outputs:** h

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
 function [h] = drawSpheres(spheres,varargin)
    %@code{true}
    h = gobjects(sum(spheres(:,5)),1);
    iter = 1;
    for ii = 1: size(spheres,1)
        if spheres(ii,5)
            h(iter) = drawSphere(spheres(ii,1:4),'nPhi',16,'nTheta',8,varargin{:}); hold on
            iter = iter+1;
        end
    end
end 
``` 
 
***

*Generated on 04-Mar-2021 00:23:48 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
