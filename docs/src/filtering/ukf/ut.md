[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [filtering](../filtering_index.md) > [ukf](ukf_index.md)  


# function: ut



**Inputs:** systemModel, dt, sigmas, Wm, Wc, R, n_out, varargin

**Outputs:** mu, P, deviations, sigmas_out

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
 function [mu, P, deviations, sigmas_out] = ut(systemModel, dt, sigmas, Wm, Wc, R, n_out, varargin)
    %@code{true}
    num_sigmas = size(sigmas,2);
    sigmas_out = zeros(n_out, num_sigmas);
    
    % Propagate sigma points through dynamics:
    for ii = 1:num_sigmas
        sigmas_out(:,ii) = systemModel(dt, sigmas(:,ii), varargin{:});
    end
    
    % Calculate new mean:
    mu = sigmas_out*Wm'; 
    
    % Recover a posteriori distribution:
    [P, deviations] = aposteriori_distribution(sigmas_out, mu, num_sigmas, Wc, R);
end 
``` 
 
***

*Generated on 04-Mar-2021 12:32:24 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
