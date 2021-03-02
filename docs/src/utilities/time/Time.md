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

# Source Code:

 ```matlab 
 % INCLUDECODE>{true}
classdef Time < handle
    properties
        % Tracked for the simulation:
        dt %(sec)
        
        % Time tracked internally via julianday
        jd
    end
    
    %% Constructor
    methods
        function [self] = Time(time_system,start_time,dt)
            self.dt = dt;
            switch lower(time_system)
                case 'datetime'
                    self.jd = datetime2julianday(start_time);
                case 'julianday'
                    self.jd = start_time;
                case 'unix'
                    self.jd = unix2julianday(start_time);
                case 'gregorian'
                    self.jd = gregorian2julianday(start_time);
                case 'gmst'
                    error('GMST NOT YET IMPLEMENTED')
                otherwise
                    error(['The specified time_system must be one of the following: \n',...
                           'julianday | unix | gregorian | gmst'])
            end
        end
    end
    
    %% Public Methods
    methods (Access = public)
        function [] = update(self,dt)
            % If a new timestep has been provided, save it:
            if nargin == 2
                self.dt = dt;
            end
            
            % Update the julian day:
            self.jd = self.jd + self.dt/86400;
            
        end
        
        function [matlab_datetime] = datetime(self)
            matlab_datetime = julianday2datetime(self.jd);
        end
        
        function [u] = unix(self)
           u = julianday2unix(self.jd); 
        end
        
        function [greg] = gregorian(self)
            greg = julianday2gregorian(self.jd);
        end
    end
end 
 ``` 
  
 ***

*Generated on 02-Mar-2021 01:01:24 by [m2md](https://github.com/crgnam-research/m2md) © 2021*