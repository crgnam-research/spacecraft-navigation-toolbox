[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [time](time_index.md)  


# classdef: Time

**SuperClasses:** handle



 ***

## Class Attributes

| Attribute         | Status   | 
| ----------------- | -------- | 
| Abstract | false | 
| ConstructOnLoad | false | 
| HandleCompatible | true | 
| Hidden | false | 
| Sealed | false | 


[*Default Class Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/class-attributes.html)

 ***

## Properties

| Property | Attributes  | Type | Default Value | Description |
| -------- | ----------- | ---- | ------------- | ----------- |
| dt |   |  |  | (sec) |
| jd |   |  |  |  |

[*Default Property Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html)

 ***

## Methods

| Method | Attributes | Inputs | Outputs | Brief Description |
| ------ | ---------- | ------ | ------- | ----------------- |
| [Time](#time) |   | time_system, start_time, dt | self |  |
| [gregorian](#gregorian) |   | self | greg |  |
| [unix](#unix) |   | self | u |  |
| [datetime](#datetime) |   | self | matlab_datetime |  |
| [update](#update) |   | self, dt |  |  |


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Method Descriptions

 ### Time

```matlab
function [self] = Time(time_system, start_time, dt)
```

 ### gregorian

```matlab
function [greg] = gregorian(self)
```

 ### unix

```matlab
function [u] = unix(self)
```

 ### datetime

```matlab
function [matlab_datetime] = datetime(self)
```

 ### update

```matlab
function [] = update(self, dt)
```



 
 *** 

# Source Code:

 ```matlab 
 classdef Time < handle
    %@code{true}
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

*Generated on 04-Mar-2021 00:02:13 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
