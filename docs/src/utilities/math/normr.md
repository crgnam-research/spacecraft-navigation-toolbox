[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [math](math_index.md)  


# function: normr



**Inputs:** M

**Outputs:** M, n

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
 function [M,n] = normr(M)
    %@code{true}
    % Highly vectorized normalization of rows
    n = sqrt(sum(M.^2,2));
    M = bsxfun(@rdivide,M,n);
end 
``` 
 
***

*Generated on 04-Mar-2021 00:23:48 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
