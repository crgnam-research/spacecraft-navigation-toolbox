[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [filtering](../filtering_index.md) > [ukf](ukf_index.md)  


# function: posSemiDefCov



**Inputs:** pcov

**Outputs:** pcov_pos

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
 function pcov_pos = posSemiDefCov(pcov)
    %@code{true}
    [~, err] = cholcov(pcov);

    if err ~= 0 %the covariance matrix is not positive semidefinite
        [v, d]=eig(pcov);

        % set any eigenvalues that are not positive to a small positive number
        for ii=1:size(d,1)
            if d(ii,ii)<=1e-14
                if abs(d(ii,ii)/max(max(d)))>1e-3 %large negative eigenvalues
                    error('Matrix is negative (semi)definite')
                end
                d(ii,ii)=1e-14;
            end
        end

        % Reconstruct the covariance matrix, which should now be positive
        % definite
        pcov_pos = real(v*d*v');
    else %already positive definite
        pcov_pos = real(pcov);
    end
end 
``` 
 
***

*Generated on 03-Mar-2021 23:38:26 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
