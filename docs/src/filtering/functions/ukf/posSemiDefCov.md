[]{#_top}

<div>

[Home](../../../../../index.html) \> [..](#) \> [src](#) \>
[filtering](#) \> [functions](#) \> [ukf](index.html) \> posSemiDefCov.m

</div>

# posSemiDefCov

## []{#_name}PURPOSE [![\^](../../../../../up.png)](#_top)

::: {.box}
**pcov_pos = posSemiDefCov(pcov)**
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../../up.png)](#_top)

::: {.box}
**function pcov_pos = posSemiDefCov(pcov)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
 pcov_pos = posSemiDefCov(pcov)

 This function reads in a covariance matrix and checks if it is positive
 definite.  If it is not, but non-positive eigenvalues are very small in
 magnitude, those eigenvalues are set to a small positive number.
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../../up.png)](#_top)

This function calls:

This function is called by:

-   [ukf](ukf.html "function [X_hat, P, y_hat] = ukf(dynamics, measModel, X_hat, dt,P, Q, R, measAvails, meas,alpha, beta, kappa, model_args)"){.code}
    % Unscented Kalman Filter:

## []{#_source}SOURCE CODE [![\^](../../../../../up.png)](#_top)

::: {.fragment}
    0001 % pcov_pos = posSemiDefCov(pcov)
    0002 %
    0003 % This function reads in a covariance matrix and checks if it is positive
    0004 % definite.  If it is not, but non-positive eigenvalues are very small in
    0005 % magnitude, those eigenvalues are set to a small positive number.
    0006 
    0007 function pcov_pos = posSemiDefCov(pcov)
    0008 
    0009     [~, err] = cholcov(pcov);
    0010 
    0011     if err ~= 0 %the covariance matrix is not positive semidefinite
    0012         [v, d]=eig(pcov);
    0013 
    0014         % set any eigenvalues that are not positive to a small positive number
    0015         for ii=1:size(d,1)
    0016             if d(ii,ii)<=1e-14
    0017                 if abs(d(ii,ii)/max(max(d)))>1e-3 %large negative eigenvalues
    0018                     error('Matrix is negative (semi)definite')
    0019                 end
    0020                 d(ii,ii)=1e-14;
    0021             end
    0022         end
    0023 
    0024         % Reconstruct the covariance matrix, which should now be positive
    0025         % definite
    0026         pcov_pos = real(v*d*v');
    0027     else %already positive definite
    0028         pcov_pos = real(pcov);
    0029     end
    0030 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
