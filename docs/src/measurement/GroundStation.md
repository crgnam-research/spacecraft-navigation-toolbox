[Home](../../index.md) > [docs](../../docs_index.md) > [src](../src_index.md) > [measurement](measurement_index.md)  


# classdef: GroundStation

**SuperClass:** handle



 ***

## Class Attributes

default

[*Default Class Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/class-attributes.html)

 ***

## Properties

| Property | Attributes  | Comment |
| -------- | ----------- | ------- |
| celestialBody | default | The celestial body the station is location on |
| position_body | default | (m) The locaiton of the station in the celestial body frame |
| position_frame | default | (m) The location of the station in the overall frame |
| frequency | default | (Hz) The center frequency that the station is communicating at |
| rangeNoise | default | (m) Standard deviation of a range measurement |
| dopplerNoise | default | (Hz) Standard deviation of a doppler measurement |
| posHandle   = []; | default |  |
| rangeHandle = []; | default |  |

[*Default Property Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html)

 ***

## Constructor

| Constructor | Attributes | Inputs | Outputs | Brief Description |
| ----------- | ---------- | ------ | ------- | ----------------- |
| [GroundStation](#groundstation) | default | celestialBody, position, varargin | self |  |


 ***

## Methods

| Method | Attributes | Inputs | Outputs | Brief Description |
| ------ | ---------- | ------ | ------- | ----------------- |
| [update](#update) | default | self |  |  |
| [range](#range) | default | self, vehicle | range_meas, avail |  |
| [doppler](#doppler) | default | self, vehicle | frequency_meas, avail |  |
| [angleOfArrival](#angleofarrival) | default | self, vehicle |  |  |
| [draw](#draw) | default | self, varargin |  |  |
| [drawLink](#drawlink) | default | self, vehicle, varargin |  |  |


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Constructor Description

### GroundStation

**[self] = GroundStation(celestialBody, position, varargin)**

DESCRIPTION: 

 ***

## Method Descriptions

### update

**[] = update(self)**

DESCRIPTION: 
### range

**[range_meas, avail] = range(self, vehicle)**

DESCRIPTION: 
### doppler

**[frequency_meas, avail] = doppler(self, vehicle)**

DESCRIPTION: 
### angleOfArrival

**[] = angleOfArrival(self, vehicle)**

DESCRIPTION: 
### draw

**[] = draw(self, varargin)**

DESCRIPTION: 
### drawLink

**[] = drawLink(self, vehicle, varargin)**

DESCRIPTION: 



***

*Generated on 01-Mar-2021 22:23:28 by [m2md](https://github.com/crgnam-research/m2md) © 2021*