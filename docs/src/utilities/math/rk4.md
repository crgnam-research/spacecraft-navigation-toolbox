[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [math](index.html) \> rk4.m

</div>

# rk4

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
**% Function Description:**
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function \[X\] = rk4(dynamics, dt, X, varargin)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
% Function Description:
 This is a simple implementation of an RK4 numerical integrator.  This
 uses the classical Runge-Kutta method to numerically integrate dynamics
 forward in time.clc
   - Chris Gnam, 2018

 ===============
 INPUT VARIABLES
 ===============
   dynamics - Function handle for state space dynamic model
   dt       - Time Step Size
   X        - Input State Vector
   varargin - Additional values that need to be set for dynamics

 ================
 OUTPUT VARIABLES
 ================
   X        - Updated State Vector
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

This function is called by:

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 function [X] = rk4(dynamics, dt, X, varargin)
    0002 %% Function Description:
    0003 % This is a simple implementation of an RK4 numerical integrator.  This
    0004 % uses the classical Runge-Kutta method to numerically integrate dynamics
    0005 % forward in time.clc
    0006 %   - Chris Gnam, 2018
    0007 %
    0008 % ===============
    0009 % INPUT VARIABLES
    0010 % ===============
    0011 %   dynamics - Function handle for state space dynamic model
    0012 %   dt       - Time Step Size
    0013 %   X        - Input State Vector
    0014 %   varargin - Additional values that need to be set for dynamics
    0015 %
    0016 % ================
    0017 % OUTPUT VARIABLES
    0018 % ================
    0019 %   X        - Updated State Vector
    0020 %
    0021 
    0022 %% Runge-Kutta 4th Order Solver:
    0023 
    0024 % Solve for Coefficients:
    0025 k1 = dt*dynamics(0,      X,          varargin{:});
    0026 k2 = dt*dynamics(0.5*dt, X + 0.5*k1, varargin{:});
    0027 k3 = dt*dynamics(0.5*dt, X + 0.5*k2, varargin{:});
    0028 k4 = dt*dynamics(dt,     X + k3,     varargin{:});
    0029 
    0030 % Calculate next state of angular velocities:
    0031 X = X + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
    0032 
    0033 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
