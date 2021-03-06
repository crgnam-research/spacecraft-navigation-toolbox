[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [simple_models](simple_models_index.md)  


# classdef: Sphere

**SuperClasses:** handle



 ***

## Class Attributes

<div class="table-wrapper" markdown="block">

| Attribute         | Status   |
| ----------------- | -------- |
| Abstract | false | 
| ConstructOnLoad | false | 
| HandleCompatible | true | 
| Hidden | false | 
| Sealed | false | 


</div>


[*Default Class Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/class-attributes.html)

 ***

## Properties

<div class="table-wrapper" markdown="block">

| Property | Attributes  | Type | Default Value | Description |
| -------- | ----------- | ---- | ------------- | ----------- |
| position |   |  |  |  |
| radius |   |  |  |  |


</div>

[*Default Property Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html)

 ***

## Methods

<div class="table-wrapper" markdown="block">

| Method | Attributes | Inputs | Outputs | Brief Description |
| ------ | ---------- | ------ | ------- | ----------------- |
| [Sphere](#sphere) |   | position, radius | self |  |
| [rayCast](#raycast) |   | self, origins, rays | intersects |  |


</div>


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Method Descriptions

### Sphere

```matlab
function [self] = Sphere(position, radius)
```

### rayCast

```matlab
function [intersects] = rayCast(self, origins, rays)
```



 
 *** 

# Source Code:

 ```matlab 
 classdef Sphere < handle
    %@code{true}
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

*Generated on 05-Mar-2021 16:40:51 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
