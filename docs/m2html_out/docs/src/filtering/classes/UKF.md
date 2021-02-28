[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [filtering](#)
\> [classes](index.md) \> UKF.m



# UKF

## Purpose 

``` 
```

## Overview 

``` 
**This is a script file.**
```

## Description 

```
 

```

## Cross-Reference Information 

This function calls:

   [UKF](UKF.md)

This function is called by:

   [UKF](UKF.md)

## Sub-functions 

   [function \[self\] = UKF(x_hat,P,Q,R,alpha,beta,kappa,
    tspan,](#_sub1)
   [function \[\] = estimate(self, dt, measurement,
    measAvails)](#_sub2)
   [function \[\] =
    update_args(self,dynamics_args,measurement_args)](#_sub3)
   [function \[\] = log(self,ii)](#_sub4)

## Source Code 

```
    0001 classdef UKF < handle
    0002     properties (Access = public)
    0003         % Estimator:
    0004         x_hat % Estimate
    0005         P % Estimate Covariance Matrix
    0006         Q % Process Noise Covariance Matrix
    0007         R % Measurement Noise Covariance Matrix
    0008 
    0009         measurement % The actual measurement
    0010         predicted_measurement % The filter's predicted measurement
    0011         measAvails
    0012         
    0013         % Models:
    0014         dynamics_model
    0015         measurement_model
    0016         model_args        
    0017         
    0018         % Tuning parameters:
    0019         alpha
    0020         beta
    0021         kappa
    0022         
    0023         % Logs:
    0024         x_hat_log
    0025         P_log
    0026         sig3_log
    0027         measurement_log
    0028         predicted_log
    0029         measAvail_log
    0030     end
    0031     
    0032     %% Constructor
    0033     methods
    0034         function [self] = UKF(x_hat,P,Q,R,alpha,beta,kappa, tspan,...
    0035                               dynamics_model,dynamics_args,...
    0036                               measurement_model,measurement_args)
    0037             % Format appropriately:
    0038             if isrow(x_hat)
    0039                 x_hat = x_hat';
    0040             end
    0041             
    0042             % Check the inputs for inconsistencies:
    0043             assert(all(size(P)==size(Q)), 'P and Q must be the same size')
    0044             assert(size(x_hat,1)==size(P,1), 'P must have the same number of rows as x_hat')
    0045             assert(isa(dynamics_model,'function_handle'), 'dynamics_model must be a function_handle')
    0046             assert(isa(measurement_model,'function_handle'), 'measurement_model must be a function_handle')
    0047             
    0048             % Store values:
    0049             self.x_hat = x_hat;
    0050             self.P = P;
    0051             self.Q = Q;
    0052             self.R = R;
    0053             self.dynamics_model = dynamics_model;
    0054             self.measurement_model = measurement_model;
    0055             self.model_args  = {dynamics_args, measurement_args};
    0056             self.alpha = alpha;
    0057             self.beta  = beta;
    0058             self.kappa = kappa;
    0059             
    0060             % Preallocate Logs:
    0061             L = length(tspan);
    0062             self.x_hat_log       = zeros(size(self.x_hat,1),L);
    0063             self.P_log           = zeros(size(self.P,1),size(self.P,2),L);
    0064             self.sig3_log        = zeros(size(self.x_hat,1),L);
    0065             self.measurement_log = nan(size(self.R,1),L);
    0066             self.predicted_log   = nan(size(self.R,1),L);
    0067             self.measAvail_log   = false(size(self.R,1),L);
    0068             
    0069             % Initial log values:
    0070             self.x_hat_log(:,1) = self.x_hat;
    0071             self.P_log(:,:,1)   = self.P;
    0072             self.sig3_log(:,1)  = 3*sqrt(diag(self.P));
    0073         end
    0074     end
    0075     
    0076     %% Public Methods:
    0077     methods (Access = public)
    0078         % Run the unscented kalman filter to obtain an new estimate:
    0079         function [] = estimate(self, dt, measurement, measAvails)
    0080             [x_hat2,P2,y_hat] = ukf(self.dynamics_model, self.measurement_model,...
    0081                                     self.x_hat, dt,...
    0082                                     self.P, self.Q, self.R, measAvails, measurement,...
    0083                                     self.alpha, self.beta, self.kappa, self.model_args);
    0084             self.x_hat = x_hat2;
    0085             self.P = P2;
    0086             self.measurement = measurement;
    0087             self.predicted_measurement = y_hat;
    0088             self.measAvails = measAvails;
    0089         end
    0090         
    0091         % Update the model arguments:
    0092         function [] = update_args(self,dynamics_args,measurement_args)
    0093             self.model_args = {dynamics_args, measurement_args};
    0094         end
    0095         
    0096         % Log data for a given timestep:
    0097         function [] = log(self,ii)
    0098             self.x_hat_log(:,ii) = self.x_hat;
    0099             self.P_log(:,:,ii)   = self.P;
    0100             self.sig3_log(:,ii)  = 3*sqrt(diag(self.P));
    0101             self.measurement_log(self.measAvails,ii) = self.measurement;
    0102             self.predicted_log(self.measAvails,ii)   = self.predicted_measurement;
    0103             self.measAvail_log(:,ii)   = self.measAvails;
    0104         end
    0105     end
    0106 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005