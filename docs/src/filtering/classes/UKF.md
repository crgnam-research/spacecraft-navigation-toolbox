# classdef: UKF

**SuperClass:** handle

****: 

 ***

## Class Attributes

default

[*Default Class Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/class-attributes.html)

 ***

## Properties

| Property | Attributes  | Comment |
| -------- | ----------- | ------- |
| x_hat | default | Estimate |
| P | default | Estimate Covariance Matrix |
| Q | default | Process Noise Covariance Matrix |
| R | default | Measurement Noise Covariance Matrix |
| measurement | default | The actual measurement |
| predicted_measurement | default | The filter's predicted measurement |
| measAvails | default |  |
| dynamics_model | default |  |
| measurement_model | default |  |
| model_args | default |  |
| alpha | default |  |
| beta | default |  |
| kappa | default |  |
| x_hat_log | default |  |
| P_log | default |  |
| sig3_log | default |  |
| measurement_log | default |  |
| predicted_log | default |  |
| measAvail_log | default |  |

[*Default Property Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html)

 ***

## Constructor

| Constructor | Attributes | Inputs | Outputs | Brief Description |
| ----------- | ---------- | ------ | ------- | ----------------- |
| [UKF](#ukf) | default | x_hat, P, Q, R, alpha, beta, kappa, tspan, dynamics_model, dynamics_args, measurement_model, measurement_args | self |  |


 ***

## Methods

| Method | Attributes | Inputs | Outputs | Brief Description |
| ------ | ---------- | ------ | ------- | ----------------- |
| [estimate](#estimate) | default | self,  dt,  measurement,  measAvails |  |  |
| [update_args](#update_args) | default | self, dynamics_args, measurement_args |  |  |
| [log](#log) | default | self, ii |  |  |


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Constructor Description

### UKF

**[self] = UKF(x_hat, P, Q, R, alpha, beta, kappa, tspan, dynamics_model, dynamics_args, measurement_model, measurement_args)**

DESCRIPTION: 

 ***

## Method Descriptions

### estimate

**[] = estimate(self,  dt,  measurement,  measAvails)**

DESCRIPTION: 
### update_args

**[] = update_args(self, dynamics_args, measurement_args)**

DESCRIPTION: 
### log

**[] = log(self, ii)**

DESCRIPTION: 
