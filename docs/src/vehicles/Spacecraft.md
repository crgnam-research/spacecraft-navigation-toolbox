[Home](../../index.md) > [docs](../../docs_index.md) > [src](../src_index.md) > [vehicles](vehicles_index.md)  


# classdef: Spacecraft

**SuperClass:** handle



 ***

## Class Attributes

default

[*Default Class Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/class-attributes.html)

 ***

## Properties

| Property | Attributes  | Comment |
| -------- | ----------- | ------- |
| position | default |  |
| velocity | default |  |
| attitude | default |  |
| angularRate | default |  |
| displayModel | default | This model is used for visualizations |
| simpleModel | default | This model is used for computations |
| integrator | default |  |
| plottedTraj = false; | default |  |
| plotted = false; | default |  |
| trajHandle | default |  |
| plotHandle | default |  |
| position_log | default |  |
| velocity_log | default |  |
| attitude_log | default |  |
| angularRate_log | default |  |

[*Default Property Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html)

 ***

## Constructor

| Constructor | Attributes | Inputs | Outputs | Brief Description |
| ----------- | ---------- | ------ | ------- | ----------------- |
| [Spacecraft](#spacecraft) | default | r, v, tspan, varargin | self |  |


 ***

## Methods

| Method | Attributes | Inputs | Outputs | Brief Description |
| ------ | ---------- | ------ | ------- | ----------------- |
| [propagateOrbit](#propagateorbit) | default | self, dt, varargin | self |  |
| [cowell](#cowell) | default | self, ~, X, varargin | dX |  |
| [log](#log) | default | self, ii |  |  |
| [draw](#draw) | default | self, varargin | self |  |
| [drawTraj](#drawtraj) | default | self, varargin | self |  |


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Constructor Description

### Spacecraft

**[self] = Spacecraft(r, v, tspan, varargin)**

DESCRIPTION: 

 ***

## Method Descriptions

### propagateOrbit

**[self] = propagateOrbit(self, dt, varargin)**

DESCRIPTION: 
### cowell

**[dX] = cowell(self, ~, X, varargin)**

DESCRIPTION: 
### log

**[] = log(self, ii)**

DESCRIPTION: 
### draw

**[self] = draw(self, varargin)**

DESCRIPTION: 
### drawTraj

**[self] = drawTraj(self, varargin)**

DESCRIPTION: 

***

*Generated on 01-Mar-2021 17:26:18 by [m2md](https://github.com/crgnam-research/m2md) © 2021*