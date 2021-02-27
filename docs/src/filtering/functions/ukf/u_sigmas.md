[]{#_top}

<div>

[Home](../../../../../index.html) \> [..](#) \> [src](#) \>
[filtering](#) \> [functions](#) \> [ukf](index.html) \> u_sigmas.m

</div>

# u_sigmas

## []{#_name}PURPOSE [![\^](../../../../../up.png)](#_top)

::: {.box}
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../../up.png)](#_top)

::: {.box}
**function \[SIGMAS,Wm,Wc,L\] = u_sigmas(X_hat,P,alpha,beta,kappa)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../../up.png)](#_top)

This function calls:

This function is called by:

-   [ukf](ukf.html "function [X_hat, P, y_hat] = ukf(dynamics, measModel, X_hat, dt,P, Q, R, measAvails, meas,alpha, beta, kappa, model_args)"){.code}
    % Unscented Kalman Filter:

## []{#_source}SOURCE CODE [![\^](../../../../../up.png)](#_top)

::: {.fragment}
    0001 function [SIGMAS,Wm,Wc,L] = u_sigmas(X_hat,P,alpha,beta,kappa)
    0002     L = size(X_hat,1);
    0003 
    0004     % Initial calculations:
    0005     lambda = alpha^2*(L + kappa) - L;
    0006     gamma = sqrt(L + lambda);
    0007 
    0008     % Weights (3.259):
    0009     Wm = [lambda/(L+lambda), 1/(2*(L+lambda)) + zeros(1,2*L)]; %Mean
    0010     Wc = Wm;
    0011     Wc(1) = Wc(1) + (1 - (alpha^2) + beta); %Covariance
    0012     
    0013     % Calculate matrix square root via Choleksy Decomposition:
    0014     sig = gamma*chol(P)';
    0015 
    0016     % Generate set of sigma points, with estimate as mean (3.253):
    0017     SIGMAS = [X_hat, X_hat(:, ones(1,L))+sig, X_hat(:, ones(1,L))-sig];
    0018 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
