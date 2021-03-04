[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [math](math_index.md)  


# function: rk4



**Inputs:** dynamics, dt, X, varargin

**Outputs:** X

 ***

## Sub-Functions

*No Sub-Functions*

 ***

## Detailed Description



 ***

## Sub-Function Descriptions

*No Sub-Functions*

 
 *** 

# Source Code:

 ```matlab 
 function [X] = rk4(dynamics, dt, X, varargin)
    %@code{true}
    % Solve for Coefficients:
    k1 = dt*dynamics(0,      X,          varargin{:});
    k2 = dt*dynamics(0.5*dt, X + 0.5*k1, varargin{:});
    k3 = dt*dynamics(0.5*dt, X + 0.5*k2, varargin{:});
    k4 = dt*dynamics(dt,     X + k3,     varargin{:});

    % Calculate next state of angular velocities:
    X = X + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
end 
``` 
 
***

*Generated on 04-Mar-2021 00:18:22 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
