[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [attitude](attitude_index.md)  

 
 # classdef: Attitude

**SuperClass:** handle



 ***

## Class Attributes

default

[*Default Class Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/class-attributes.html)

 ***

## Properties

| Property | Attributes  | Comment |
| -------- | ----------- | ------- |
| rotmat | default |  |

[*Default Property Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html)

 ***

## Constructor

| Constructor | Attributes | Inputs | Outputs | Brief Description |
| ----------- | ---------- | ------ | ------- | ----------------- |
| [Attitude](#attitude) | default | format, varargin | self |  |


 ***

## Methods

| Method | Attributes | Inputs | Outputs | Brief Description |
| ------ | ---------- | ------ | ------- | ----------------- |
| [quat](#quat) | default | self | quat |  |
| [quaternion](#quaternion) | default | self | quat |  |


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Constructor Description

### Attitude

**[self] = Attitude(format, varargin)**

DESCRIPTION: 

 ***

## Method Descriptions

### quat

**[quat] = quat(self)**

DESCRIPTION: 
### quaternion

**[quat] = quaternion(self)**

DESCRIPTION: 


 
 *** 

# Source Code:

 ```matlab 
 % INCLUDECODE>{true}
classdef Attitude < handle
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

*Generated on 02-Mar-2021 01:01:23 by [m2md](https://github.com/crgnam-research/m2md) © 2021*