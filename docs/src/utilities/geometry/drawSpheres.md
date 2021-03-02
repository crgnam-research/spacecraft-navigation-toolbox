[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [geometry](geometry_index.md)  

 
 # function: drawSpheres



**Inputs:** spheres, varargin

**Outputs:** h

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
function [h] = drawSpheres(spheres,varargin)
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

*Generated on 02-Mar-2021 01:01:24 by [m2md](https://github.com/crgnam-research/m2md) © 2021*