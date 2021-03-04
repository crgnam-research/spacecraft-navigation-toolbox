[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [attitude](attitude_index.md)  


# classdef: Attitude

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
| rotmat |   |  |  |  |


</div>

[*Default Property Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html)

 ***

## Methods

<div class="table-wrapper" markdown="block">

| Method | Attributes | Inputs | Outputs | Brief Description |
| ------ | ---------- | ------ | ------- | ----------------- |
| [Attitude](#attitude) |   | format, varargin | self |  |
| [quaternion](#quaternion) |   | self | quat |  |
| [quat](#quat) |   | self | quat |  |


</div>


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Method Descriptions

### Attitude

```matlab
function [self] = Attitude(format, varargin)
```

### quaternion

```matlab
function [quat] = quaternion(self)
```

### quat

```matlab
function [quat] = quat(self)
```



 
 *** 

# Source Code:

 ```matlab 
 classdef Attitude < handle
    %@code{true}
    properties
        rotmat
    end
    
    %% Constructor
    methods
        function [self] = Attitude(format,varargin)
            switch lower(format)
                case {'quaternion','quat'}
                    self.rotmat = quat2rotmat(varargin{1});
                case {'rotmat'}
                    self.rotmat = varargin{1};
                case {'euler'}
                    sequence = varargin{1};
                    assert(ischar(sequence) && length(sequence)==3,...
                           'A valid euler angle sequence must be provided (example: ''321'')')
                    angles = varargin{2};
                    self.rotmat = ea2rotmat(angles(1),angles(2),angles(3),sequence);
            end
        end
    end
    
    %% Public Methods
    methods (Access = public)
        function [quat] = quat(self)
            quat = rotmat2quat(self.rotmat);
        end
        
        function [quat] = quaternion(self)
            quat = rotmat2quat(self.rotmat);
        end
    end
    
end 
``` 
 
***

*Generated on 04-Mar-2021 12:32:24 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
