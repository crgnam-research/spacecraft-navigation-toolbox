[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [geometry](geometry_index.md)  

 
 # function: drawCubes



**Inputs:** cubes, varargin

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
function [h] = drawCubes(cubes,varargin)
    % Extract locations and dimensions of each sphere:
    h = gobjects(sum(cubes(:,5)),1);
    iter = 1;
    for ii = 1: size(cubes,1)
        if cubes(ii,5)
            h(iter) = drawCube(cubes(ii,1:4),varargin{:}); hold on
            iter = iter+1;
        end
    end
end 
 ``` 
  
 ***

*Generated on 02-Mar-2021 01:01:24 by [m2md](https://github.com/crgnam-research/m2md) © 2021*