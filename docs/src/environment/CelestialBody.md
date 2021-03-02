[Home](../../index.md) > [docs](../../docs_index.md) > [src](../src_index.md) > [environment](environment_index.md)  


# classdef: CelestialBody

**SuperClass:** handle



 ***

## Class Attributes

default

[*Default Class Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/class-attributes.html)

 ***

## Properties

| Property | Attributes  | Comment |
| -------- | ----------- | ------- |
| displayModel | default | This model is used for visualizations |
| simpleModel | default | This model is used for computations |
| position | default | Position of the celestial body with respect to the reference frame origin |
| attitude | default | Rotation from the reference frame to this celestial body frame |
| angularRate | default | Rotation rate about the body axes |
| gravityField | default |  |
| atmosphere | default |  |
| magneticField | default |  |
| vis_handle = []; | default |  |
| body_pts | default |  |

[*Default Property Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html)

 ***

## Constructor

| Constructor | Attributes | Inputs | Outputs | Brief Description |
| ----------- | ---------- | ------ | ------- | ----------------- |
| [CelestialBody](#celestialbody) | default | gravityField, varargin | self |  |


 ***

## Methods

| Method | Attributes | Inputs | Outputs | Brief Description |
| ------ | ---------- | ------ | ------- | ----------------- |
| [getAccel](#getaccel) | default | self, X, attitude, simpleModel, varargin | accel |  |
| [updateAttitude](#updateattitude) | default | self, new_attitude |  |  |
| [updateAngularRate](#updateangularrate) | default | self, new_angRate |  |  |
| [updatePosition](#updateposition) | default | self, new_position |  |  |
| [draw](#draw) | default | self |  |  |


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Constructor Description

### CelestialBody

**[self] = CelestialBody(gravityField, varargin)**

DESCRIPTION: 

 ***

## Method Descriptions

### getAccel

**[accel] = getAccel(self, X, attitude, simpleModel, varargin)**

DESCRIPTION: 
### updateAttitude

**[] = updateAttitude(self, new_attitude)**

DESCRIPTION: 
### updateAngularRate

**[] = updateAngularRate(self, new_angRate)**

DESCRIPTION: 
### updatePosition

**[] = updatePosition(self, new_position)**

DESCRIPTION: 
### draw

**[] = draw(self)**

DESCRIPTION: 

***

*Generated on 01-Mar-2021 17:26:17 by [m2md](https://github.com/crgnam-research/m2md) © 2021*