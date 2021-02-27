[]{#_top}

<div>

[Home](../../../../../index.html) \> [..](#) \> [src](#) \>
[filtering](#) \> [functions](#) \> [ukf](index.html) \> ukf.m

</div>

# ukf

## []{#_name}PURPOSE [![\^](../../../../../up.png)](#_top)

::: {.box}
**% Unscented Kalman Filter:**
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../../up.png)](#_top)

::: {.box}
**function \[X_hat, P, y_hat\] = ukf(dynamics, measModel, X_hat, dt,P,
Q, R, measAvails, meas,alpha, beta, kappa, model_args)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
% Unscented Kalman Filter:
 This is a simple implementation of a general purpose Unscented Kalman
 Filter (UKF).  It is meant to be a simple tool for quick and easy
 filtering of a wide range of systems.

 Improvement may be made, including adding the ability to handle different
 types of measurements, or varying numbers of measurements per time step

 Inputs:
   dynamics   - function handle to the system dynamics
   measModel  - function handle to the measurement model
   X_hat      - current state estimate
   dt         - time step size
   P, Q, R    - vovariance, Process Noise, and Measurement Covariances
   measAvail  - is a measurement available
   meas       - measurement vector
   alpha,beta,kappa - UKF tunable parameters
   model_args - cell array containing dynamics_args, and measurement_args,
               both of which are also cell arrays, and correspond to the
               necessary inputs for the respective function handles

 Outputs:
   X_hat - Updated state estimate
   P     - Updated covariance

 Requirements:
     ut() - Unscented Transform function
     u_sigmas() - Generate sigma points
     posSemiDefCov() - forces positive definite
     cholcov_codegen

 For reference, see:
    Optimal Estimation of Dynamic Systems - Crassidis

 Chris Gnam - 2019
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../../up.png)](#_top)

This function calls:

-   [posSemiDefCov](posSemiDefCov.html "function pcov_pos = posSemiDefCov(pcov)"){.code}
    pcov_pos = posSemiDefCov(pcov)
-   [u_sigmas](u_sigmas.html "function [SIGMAS,Wm,Wc,L] = u_sigmas(X_hat,P,alpha,beta,kappa)"){.code}
-   [ut](ut.html "function [mu, P, deviations, sigmas_out] = ut(systemModel, dt, sigmas, Wm, Wc, R, n_out, varargin)"){.code}
    % Unscented Transform:

This function is called by:

## []{#_source}SOURCE CODE [![\^](../../../../../up.png)](#_top)

::: {.fragment}
    0001 %% Unscented Kalman Filter:
    0002 % This is a simple implementation of a general purpose Unscented Kalman
    0003 % Filter (UKF).  It is meant to be a simple tool for quick and easy
    0004 % filtering of a wide range of systems.
    0005 %
    0006 % Improvement may be made, including adding the ability to handle different
    0007 % types of measurements, or varying numbers of measurements per time step
    0008 %
    0009 % Inputs:
    0010 %   dynamics   - function handle to the system dynamics
    0011 %   measModel  - function handle to the measurement model
    0012 %   X_hat      - current state estimate
    0013 %   dt         - time step size
    0014 %   P, Q, R    - vovariance, Process Noise, and Measurement Covariances
    0015 %   measAvail  - is a measurement available
    0016 %   meas       - measurement vector
    0017 %   alpha,beta,kappa - UKF tunable parameters
    0018 %   model_args - cell array containing dynamics_args, and measurement_args,
    0019 %               both of which are also cell arrays, and correspond to the
    0020 %               necessary inputs for the respective function handles
    0021 %
    0022 % Outputs:
    0023 %   X_hat - Updated state estimate
    0024 %   P     - Updated covariance
    0025 %
    0026 % Requirements:
    0027 %     ut() - Unscented Transform function
    0028 %     u_sigmas() - Generate sigma points
    0029 %     posSemiDefCov() - forces positive definite
    0030 %     cholcov_codegen
    0031 %
    0032 % For reference, see:
    0033 %    Optimal Estimation of Dynamic Systems - Crassidis
    0034 %
    0035 % Chris Gnam - 2019
    0036 
    0037 function [X_hat, P, y_hat] = ukf(dynamics, measModel, X_hat, dt,...
    0038                                  P, Q, R, measAvails, meas,...
    0039                                  alpha, beta, kappa, model_args)
    0040                       
    0041     % Process the variable inputs:
    0042     dynamics_args    = model_args{1};
    0043     measurement_args = model_args{2};
    0044     
    0045     % Extract important values:
    0046     n = sum(measAvails,1);
    0047 
    0048     [SIGMAS,Wm,Wc,L] = u_sigmas(X_hat,P,alpha,beta,kappa);
    0049     
    0050     % Propagate estimate through dynamics:
    0051     [X_hat, P, X_dev, SIGMAS] = ut(dynamics, dt, SIGMAS, Wm, Wc, Q, L, dynamics_args{:});
    0052     
    0053     % Establish which measurements to process:
    0054     if any(measAvails)
    0055         measAvail = true;
    0056         Rdiag = diag(R);
    0057         Rdiag = Rdiag(measAvails);
    0058         R = diag(Rdiag);       
    0059     else
    0060         measAvail = false;
    0061     end
    0062     
    0063     % If measurement is available, perform kalman update:
    0064     measurement_args{end+1} = measAvails;
    0065     if measAvail
    0066         % Calculate predicted measurement:
    0067         [y_hat, Pyy, y_dev]  = ut(measModel, dt, SIGMAS, Wm, Wc, R, n, measurement_args{:});
    0068         
    0069         % Calculate cross-correlation covariance (3.266):
    0070         Pxy = X_dev*diag(Wc)*y_dev';
    0071 
    0072         % Kalman Gain (3.251):
    0073         K = Pxy*Pyy^-1;
    0074         
    0075         % State and Covariance Update (3.249):
    0076         X_hat = X_hat + K*(meas - y_hat);
    0077         P = P - K*Pxy';
    0078     else
    0079         y_hat = nan;
    0080     end
    0081     
    0082     % Make sure covariance is positive semidefinite.
    0083     P = posSemiDefCov(P);
    0084 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
