[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [filtering](../filtering_index.md) > [ukf](ukf_index.md)  

 
 # function: posSemiDefCov



**Inputs:** pcov

**Outputs:** pcov_pos

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
function pcov_pos = posSemiDefCov(pcov)

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

*Generated on 02-Mar-2021 01:01:23 by [m2md](https://github.com/crgnam-research/m2md) © 2021*