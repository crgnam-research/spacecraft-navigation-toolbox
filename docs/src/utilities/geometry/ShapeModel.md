[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [geometry](geometry_index.md)  


# classdef: ShapeModel

**SuperClass:** handle



 ***

## Class Attributes

default

[*Default Class Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/class-attributes.html)

 ***

## Properties

| Property | Attributes  | Comment |
| -------- | ----------- | ------- |
| faces | default |  |
| vertices | default |  |
| mass | default |  |
| inertia | default |  |

[*Default Property Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html)

 ***

## Constructor

| Constructor | Attributes | Inputs | Outputs | Brief Description |
| ----------- | ---------- | ------ | ------- | ----------------- |
| [ShapeModel](#shapemodel) | default | filename, varargin | self |  |


 ***

## Methods

| Method | Attributes | Inputs | Outputs | Brief Description |
| ------ | ---------- | ------ | ------- | ----------------- |
| [packSpheres](#packspheres) | default | self, radius | spheres |  |
| [packCubes](#packcubes) | default | self, dimension | cubes |  |
| [draw](#draw) | default | self, varargin | h |  |


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Constructor Description

### ShapeModel

**[self] = ShapeModel(filename, varargin)**

DESCRIPTION: 

 ***

## Method Descriptions

### packSpheres

**[spheres] = packSpheres(self, radius)**

DESCRIPTION: 
### packCubes

**[cubes] = packCubes(self, dimension)**

DESCRIPTION: 
### draw

**[h] = draw(self, varargin)**

DESCRIPTION: 



***

*Generated on 01-Mar-2021 22:23:29 by [m2md](https://github.com/crgnam-research/m2md) © 2021*