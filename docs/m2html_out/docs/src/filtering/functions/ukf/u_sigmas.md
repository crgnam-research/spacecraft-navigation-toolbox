[Home](../../../../../../index.md) \> [..](#) \> [src](../../../../../../documentation.md) \>
[filtering](#) \> [functions](#) \> [ukf](index.md) \> u_sigmas.m



# u_sigmas

## Purpose 

``` 
```

## Overview 

``` 
**function \[SIGMAS,Wm,Wc,L\] = u_sigmas(X_hat,P,alpha,beta,kappa)**
```

## Description 

```
 

```

## Cross-Reference Information 

This function calls:

This function is called by:

   [ukf](ukf.md "function [X_hat, P, y_hat] = ukf(dynamics, measModel, X_hat, dt,P, Q, R, measAvails, meas,alpha, beta, kappa, model_args)")
    % Unscented Kalman Filter:

## Source Code 

```
    0001 function [SIGMAS,Wm,Wc,L] = u_sigmas(X_hat,P,alpha,beta,kappa)
    0002     L = size(X_hat,1);
    0003 
    0004     % Initial calculations:
    0005     lambda = alpha^2*(L + kappa)  L;
    0006     gamma = sqrt(L + lambda);
    0007 
    0008     % Weights (3.259):
    0009     Wm = [lambda/(L+lambda), 1/(2*(L+lambda)) + zeros(1,2*L)]; %Mean
    0010     Wc = Wm;
    0011     Wc(1) = Wc(1) + (1  (alpha^2) + beta); %Covariance
    0012     
    0013     % Calculate matrix square root via Choleksy Decomposition:
    0014     sig = gamma*chol(P)';
    0015 
    0016     % Generate set of sigma points, with estimate as mean (3.253):
    0017     SIGMAS = [X_hat, X_hat(:, ones(1,L))+sig, X_hat(:, ones(1,L))sig];
    0018 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005