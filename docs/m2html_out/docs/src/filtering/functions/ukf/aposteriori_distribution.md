[Home](../../../../../../index.md) \> [..](#) \> [src](#) \>
[filtering](#) \> [functions](#) \> [ukf](index.md) \>
aposteriori_distribution.m



# aposteriori_distribution

## Purpose 

``` 
**% Aposteriori Distribution:**
```

## Overview 

``` 
**function \[P, deviations\] = aposteriori_distribution(sigmas, mu, n,
Wc, R)**
```

## Description 

```
 
% Aposteriori Distribution:
 Inputs:
   sigmas  sigma points
   mu      a posteriori updated mean
   n       number of sigma points
   Wc      covariance weights
   R       additional covariance

 Outputs:
   P   a posteriori distribution
   deviations  (mu  x_hat)

 For reference, see:
    Optimal Estimation of Dynamic Systems  Crassidis

 Chris Gnam  2019

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

   [ut](ut.md "function [mu, P, deviations, sigmas_out] = ut(systemModel, dt, sigmas, Wm, Wc, R, n_out, varargin)")
    % Unscented Transform:

## Source Code 

```
    0001 %% Aposteriori Distribution:
    0002 % Inputs:
    0003 %   sigmas  sigma points
    0004 %   mu      a posteriori updated mean
    0005 %   n       number of sigma points
    0006 %   Wc      covariance weights
    0007 %   R       additional covariance
    0008 %
    0009 % Outputs:
    0010 %   P   a posteriori distribution
    0011 %   deviations  (mu  x_hat)
    0012 %
    0013 % For reference, see:
    0014 %    Optimal Estimation of Dynamic Systems  Crassidis
    0015 %
    0016 % Chris Gnam  2019
    0017 
    0018 function [P, deviations] = aposteriori_distribution(sigmas, mu, n, Wc, R)
    0019     % Calculate the deviations:
    0020     deviations = sigmas  mu(:,ones(1,n));
    0021     
    0022     % Recover distribution:
    0023     P  = deviations*diag(Wc)*deviations' + R; 
    0024 end
```



Generated on Sat 27Feb2021 18:22:26 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005