[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [simple_models](simple_models_index.md)  

 
 # classdef: Sphere

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
| radius | default |  |

[*Default Property Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html)

 ***

## Constructor

| Constructor | Attributes | Inputs | Outputs | Brief Description |
| ----------- | ---------- | ------ | ------- | ----------------- |
| [Sphere](#sphere) | default | position, radius | self |  |


 ***

## Methods

| Method | Attributes | Inputs | Outputs | Brief Description |
| ------ | ---------- | ------ | ------- | ----------------- |
| [rayCast](#raycast) | default | self, origins, rays | intersects |  |


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Constructor Description

### Sphere

**[self] = Sphere(position, radius)**

DESCRIPTION: 

 ***

## Method Descriptions

### rayCast

**[intersects] = rayCast(self, origins, rays)**

DESCRIPTION: 


 
 *** 

# Source Code:

 ```matlab 
 % INCLUDECODE>{true}
classdef Sphere < handle
    properties
        position
        radius
    end
    
    %% Constructor
    methods
        function [self] = Sphere(position,radius)
            self.position = position;
            self.radius   = radius;
        end
    end
    
    %% Public Methods:
    methods (Access = public)
        function [intersects] = rayCast(self,origins,rays)
            intersects = intersectLineSphere([origins', rays'],...
                                             [self.position', self.radius]);
            
            % Check if intersects happened in direction of ray cast
            if any(any(~isnan(intersects)))
                rays_to_intersects = normc(intersects' - origins);
                dot_prod = sum(rays_to_intersects.*rays,1);
                intersects(dot_prod<0,:) = nan;
            end
        end
    end
end 
 ``` 
  
 ***

*Generated on 02-Mar-2021 01:01:24 by [m2md](https://github.com/crgnam-research/m2md) © 2021*