[Home](../../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [math](index.md) \> rk4.m



# rk4

## Purpose 

``` 
**% Function Description:**
```

## Overview 

``` 
**function \[X\] = rk4(dynamics, dt, X, varargin)**
```

## Description 

```
 
% Function Description:
 This is a simple implementation of an RK4 numerical integrator.  This
 uses the classical RungeKutta method to numerically integrate dynamics
 forward in time.clc
    Chris Gnam, 2018

 ===============
 INPUT VARIABLES
 ===============
   dynamics  Function handle for state space dynamic model
   dt        Time Step Size
   X         Input State Vector
   varargin  Additional values that need to be set for dynamics

 ================
 OUTPUT VARIABLES
 ================
   X         Updated State Vector

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

## Source Code 

```
    0001 function [X] = rk4(dynamics, dt, X, varargin)
    0002 %% Function Description:
    0003 % This is a simple implementation of an RK4 numerical integrator.  This
    0004 % uses the classical RungeKutta method to numerically integrate dynamics
    0005 % forward in time.clc
    0006 %    Chris Gnam, 2018
    0007 %
    0008 % ===============
    0009 % INPUT VARIABLES
    0010 % ===============
    0011 %   dynamics  Function handle for state space dynamic model
    0012 %   dt        Time Step Size
    0013 %   X         Input State Vector
    0014 %   varargin  Additional values that need to be set for dynamics
    0015 %
    0016 % ================
    0017 % OUTPUT VARIABLES
    0018 % ================
    0019 %   X         Updated State Vector
    0020 %
    0021 
    0022 %% RungeKutta 4th Order Solver:
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
```



Generated on Sat 27Feb2021 18:37:41 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005