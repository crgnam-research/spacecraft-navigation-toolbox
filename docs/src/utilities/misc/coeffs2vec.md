[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [misc](misc_index.md)  


# function: coeffs2vec



**Inputs:** Cnm, Snm

**Outputs:** Cnm_vec, Snm_vec

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
 function [Cnm_vec, Snm_vec] = coeffs2vec(Cnm,Snm)
    %@code{true}
    % Ignore first two rows of Cnm, and Snm.  Also, ignore first column of
    % Snm.  Finally, only consider lower triangular form of both (with
    % above restrictions)
    N = size(Cnm,1);
    Cnm_vec = zeros((1+N)*N/2 - 3,1);
    Snm_vec = zeros((1+N)*N/2 - N -1,1);
    kk = 1;
    for ii = 3:N
       for jj = 1:ii
          Cnm_vec(kk) = Cnm(ii,jj); 
          kk = kk+1;
       end
    end
    
    kk = 1;
    for ii = 3:N
        for jj = 2:ii
            Snm_vec(kk) = Snm(ii,jj);
            kk = kk+1;
        end
    end
end 
``` 
 
***

*Generated on 05-Mar-2021 16:40:51 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
