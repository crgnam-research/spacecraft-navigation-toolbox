[Home](../../../../../../index.md) \> [..](#) \> [src](../../../../../../documentation.md) \>
[filtering](#) \> [functions](#) \> [ukf](index.md) \> ut.m



# ut

## Purpose 

``` 
**% Unscented Transform:**
```

## Overview 

``` 
**function \[mu, P, deviations, sigmas_out\] = ut(systemModel, dt,
sigmas, Wm, Wc, R, n_out, varargin)**
```

## Description 

```
 
% Unscented Transform:
 This is a simple implementation of the Unscented Transform (UT).  It is
 primarily meant for use in propagating states/covariances in the UKF.

 Inputs:
   systemModel  function handle to the system model used for propagation
   dt      time step size
   sigmas  sigma points to be propagated
   Wm      mean weights
   Wc      covariance weights
   R       additional covariance
   n       number of sigma points
   varargin  arguments needed for the system model

 Outputs:
   mu  updated mean
   P   a posteriori distribution
   deviations  (mu  x_hat)
   sigmas      propagated sigma points

 Requirements:
     aposteriori_distribution()  constructs the aposteriori distribution

 For reference, see:
    Optimal Estimation of Dynamic Systems  Crassidis

 Chris Gnam  2019

```

## Cross-Reference Information 

This function calls:

   [aposteriori_distribution](aposteriori_distribution.md "function [P, deviations] = aposteriori_distribution(sigmas, mu, n, Wc, R)")
    % Aposteriori Distribution:

This function is called by:

   [ukf](ukf.md "function [X_hat, P, y_hat] = ukf(dynamics, measModel, X_hat, dt,P, Q, R, measAvails, meas,alpha, beta, kappa, model_args)")
    % Unscented Kalman Filter:

## Source Code 

```
    0001 %% Unscented Transform:
    0002 % This is a simple implementation of the Unscented Transform (UT).  It is
    0003 % primarily meant for use in propagating states/covariances in the UKF.
    0004 %
    0005 % Inputs:
    0006 %   systemModel  function handle to the system model used for propagation
    0007 %   dt      time step size
    0008 %   sigmas  sigma points to be propagated
    0009 %   Wm      mean weights
    0010 %   Wc      covariance weights
    0011 %   R       additional covariance
    0012 %   n       number of sigma points
    0013 %   varargin  arguments needed for the system model
    0014 %
    0015 % Outputs:
    0016 %   mu  updated mean
    0017 %   P   a posteriori distribution
    0018 %   deviations  (mu  x_hat)
    0019 %   sigmas      propagated sigma points
    0020 %
    0021 % Requirements:
    0022 %     aposteriori_distribution()  constructs the aposteriori distribution
    0023 %
    0024 % For reference, see:
    0025 %    Optimal Estimation of Dynamic Systems  Crassidis
    0026 %
    0027 % Chris Gnam  2019
    0028 
    0029 function [mu, P, deviations, sigmas_out] = ut(systemModel, dt, sigmas, Wm, Wc, R, n_out, varargin)
    0030     
    0031     num_sigmas = size(sigmas,2);
    0032     sigmas_out = zeros(n_out, num_sigmas);
    0033     
    0034     % Propagate sigma points through dynamics:
    0035     for ii = 1:num_sigmas
    0036         sigmas_out(:,ii) = systemModel(dt, sigmas(:,ii), varargin{:});
    0037     end
    0038     
    0039     % Calculate new mean:
    0040     mu = sigmas_out*Wm'; 
    0041     
    0042     % Recover a posteriori distribution:
    0043     [P, deviations] = aposteriori_distribution(sigmas_out, mu, num_sigmas, Wc, R);
    0044 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005