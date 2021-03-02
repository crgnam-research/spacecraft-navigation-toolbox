[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [filtering](../filtering_index.md) > [ukf](ukf_index.md)  


# script: UKF_class



## Sub-Functions

| Function | Inputs | Outputs | Brief Description |
| -------- | ------ | ------- | ----------------- |
| [UKF](#ukf) | x_hat, P, Q, R, alpha, beta, kappa, tspan, ...dynamics_model, dynamics_args, ...measurement_model, measurement_args | self |  |
| [estimate](#estimate) | self,  dt,  measurement,  measAvails |  |  |
| [update_args](#update_args) | self, dynamics_args, measurement_args |  |  |
| [log](#log) | self, ii |  |  |


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Sub-Function Descriptions

### UKF

**[self] = UKF(x_hat, P, Q, R, alpha, beta, kappa, tspan, ...dynamics_model, dynamics_args, ...measurement_model, measurement_args)**

DESCRIPTION: 
### estimate

**[] = estimate(self,  dt,  measurement,  measAvails)**

DESCRIPTION: 
### update_args

**[] = update_args(self, dynamics_args, measurement_args)**

DESCRIPTION: 
### log

**[] = log(self, ii)**

DESCRIPTION: 



***

*Generated on 01-Mar-2021 22:23:28 by [m2md](https://github.com/crgnam-research/m2md) © 2021*