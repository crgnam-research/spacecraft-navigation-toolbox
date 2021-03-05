[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [filtering](../filtering_index.md) > [ukf](ukf_index.md)  


# function: aposteriori_distribution



**Inputs:** sigmas, mu, n, Wc, R

**Outputs:** P, deviations

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
 function [P, deviations] = aposteriori_distribution(sigmas, mu, n, Wc, R)
    %@code{true}
    % Calculate the deviations:
    deviations = sigmas - mu(:,ones(1,n));
    
    % Recover distribution:
    P  = deviations*diag(Wc)*deviations' + R; 
end 
``` 
 
***

*Generated on 05-Mar-2021 16:40:50 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
