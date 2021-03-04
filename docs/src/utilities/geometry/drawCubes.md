[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [geometry](geometry_index.md)  


# function: drawCubes



**Inputs:** cubes, varargin

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
 function [h] = drawCubes(cubes,varargin)
    %@code{true}
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

*Generated on 04-Mar-2021 12:32:24 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
