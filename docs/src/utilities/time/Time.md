[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [time](time_index.md)  


# classdef: Time

**SuperClass:** handle



 ***

## Class Attributes

default

[*Default Class Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/class-attributes.html)

 ***

## Properties

| Property | Attributes  | Comment |
| -------- | ----------- | ------- |
| dt | default | (sec) |
| jd | default |  |

[*Default Property Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html)

 ***

## Constructor

| Constructor | Attributes | Inputs | Outputs | Brief Description |
| ----------- | ---------- | ------ | ------- | ----------------- |
| [Time](#time) | default | time_system, start_time, dt | self |  |


 ***

## Methods

| Method | Attributes | Inputs | Outputs | Brief Description |
| ------ | ---------- | ------ | ------- | ----------------- |
| [update](#update) | default | self, dt |  |  |
| [datetime](#datetime) | default | self | matlab_datetime |  |
| [unix](#unix) | default | self | u |  |
| [gregorian](#gregorian) | default | self | greg |  |


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Constructor Description

### Time

**[self] = Time(time_system, start_time, dt)**

DESCRIPTION: 

 ***

## Method Descriptions

### update

**[] = update(self, dt)**

DESCRIPTION: 
### datetime

**[matlab_datetime] = datetime(self)**

DESCRIPTION: 
### unix

**[u] = unix(self)**

DESCRIPTION: 
### gregorian

**[greg] = gregorian(self)**

DESCRIPTION: 

***

*Generated on 01-Mar-2021 17:26:17 by [m2md](https://github.com/crgnam-research/m2md) © 2021*