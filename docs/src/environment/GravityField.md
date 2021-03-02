[Home](../../index.md) > [docs](../../docs_index.md) > [src](../src_index.md) > [environment](environment_index.md)  


# classdef: GravityField

**SuperClass:** handle



 ***

## Class Attributes

default

[*Default Class Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/class-attributes.html)

 ***

## Properties

| Property | Attributes  | Comment |
| -------- | ----------- | ------- |
| mu | default | (m^3/s^2) |
| Cnm | default |  |
| Snm | default |  |
| ref_radius | default | (m) |
| defaultMethod | default |  |
| G = 6.67430*10^-11; | default |  |
| spheres | default |  |
| cubes | default |  |
| polygons | default |  |

[*Default Property Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html)

 ***

## Constructor

| Constructor | Attributes | Inputs | Outputs | Brief Description |
| ----------- | ---------- | ------ | ------- | ----------------- |
| [GravityField](#gravityfield) | default | fieldType, varargin | self |  |


 ***

## Methods

| Method | Attributes | Inputs | Outputs | Brief Description |
| ------ | ---------- | ------ | ------- | ----------------- |
| [acceleration](#acceleration) | default | self, r, rotmat, method | accel |  |
| [accelFiniteSphere](#accelfinitesphere) | default | self, r, rotmat | accel_vec, accel_mag |  |
| [accelSphHarm](#accelsphharm) | default | self,  r,  rotmat | accel_vec, accel_mag |  |
| [batchAcceleration](#batchacceleration) | default | self, r, rotmat, varargin | accel, accel_mag |  |
| [generateSphHarm](#generatesphharm) | default | self, N, M, ref_radius, truthType, options |  |  |
| [Legendre](#legendre) | (Access = *private*) | ~, n, m, fi | pnm,  dpnm |  |
| [cost](#cost) | (Access = *private*) | self, x, accel_ref, r | eval |  |


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Constructor Description

### GravityField

**[self] = GravityField(fieldType, varargin)**

DESCRIPTION: 

 ***

## Method Descriptions

### acceleration

**[accel] = acceleration(self, r, rotmat, method)**

DESCRIPTION: 
### accelFiniteSphere

**[accel_vec, accel_mag] = accelFiniteSphere(self, r, rotmat)**

DESCRIPTION: 
### accelSphHarm

**[accel_vec, accel_mag] = accelSphHarm(self,  r,  rotmat)**

DESCRIPTION: 
### batchAcceleration

**[accel, accel_mag] = batchAcceleration(self, r, rotmat, varargin)**

DESCRIPTION: 
### generateSphHarm

**[] = generateSphHarm(self, N, M, ref_radius, truthType, options)**

DESCRIPTION: 
### Legendre

**[pnm,  dpnm] = Legendre(~, n, m, fi)**

DESCRIPTION: 
### cost

**[eval] = cost(self, x, accel_ref, r)**

DESCRIPTION: 



***

*Generated on 01-Mar-2021 22:23:28 by [m2md](https://github.com/crgnam-research/m2md) © 2021*