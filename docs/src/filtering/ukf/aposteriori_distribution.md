[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [filtering](../filtering_index.md) > [ukf](ukf_index.md)  

 
 # function: aposteriori_distribution



**Inputs:** sigmas,  mu,  n,  Wc,  R

**Outputs:** P,  deviations

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
function [P, deviations] = aposteriori_distribution(sigmas, mu, n, Wc, R)
    % Calculate the deviations:
    deviations = sigmas - mu(:,ones(1,n));
    
    % Recover distribution:
    P  = deviations*diag(Wc)*deviations' + R; 
end 
 ``` 
  
 ***

*Generated on 02-Mar-2021 00:52:50 by [m2md](https://github.com/crgnam-research/m2md) © 2021*