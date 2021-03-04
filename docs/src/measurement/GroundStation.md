[Home](../../index.md) > [docs](../../docs_index.md) > [src](../src_index.md) > [measurement](measurement_index.md)  


# classdef: GroundStation

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
| celestialBody |   |  |  | The celestial body the station is location on |
| position_body |   |  |  | (m) The locaiton of the station in the celestial body frame |
| position_frame |   |  |  | (m) The location of the station in the overall frame |
| frequency |   |  |  | (Hz) The center frequency that the station is communicating at |
| rangeNoise |   |  |  | (m) Standard deviation of a range measurement |
| dopplerNoise |   |  |  | (Hz) Standard deviation of a doppler measurement |
| posHandle |   |  |  |  |
| rangeHandle |   |  |  |  |

[*Default Property Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html)

 ***

## Methods

| Method | Attributes | Inputs | Outputs | Brief Description |
| ------ | ---------- | ------ | ------- | ----------------- |
| [GroundStation](#groundstation) |   | celestialBody, position, varargin | self |  |
| [angleOfArrival](#angleofarrival) |   | self, vehicle |  |  |
| [doppler](#doppler) |   | self, vehicle | frequency_meas, avail |  |
| [range](#range) |   | self, vehicle | range_meas, avail |  |
| [update](#update) |   | self |  |  |
| [drawLink](#drawlink) |   | self, vehicle, varargin |  |  |
| [draw](#draw) |   | self, varargin |  |  |


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Method Descriptions

 ### GroundStation

```matlab
function [self] = GroundStation(celestialBody, position, varargin)
```

 ### angleOfArrival

```matlab
function [] = angleOfArrival(self, vehicle)
```

 ### doppler

```matlab
function [frequency_meas, avail] = doppler(self, vehicle)
```

 ### range

```matlab
function [range_meas, avail] = range(self, vehicle)
```

 ### update

```matlab
function [] = update(self)
```

 ### drawLink

```matlab
function [] = drawLink(self, vehicle, varargin)
```

 ### draw

```matlab
function [] = draw(self, varargin)
```



 
 *** 

# Source Code:

 ```matlab 
 classdef GroundStation < handle
    %@code{true}
    properties
        celestialBody % The celestial body the station is location on
        
        position_body  %(m) The locaiton of the station in the celestial body frame
        position_frame %(m) The location of the station in the overall frame
        
        frequency %(Hz) The center frequency that the station is communicating at
        
        rangeNoise   %(m) Standard deviation of a range measurement
        dopplerNoise %(Hz) Standard deviation of a doppler measurement
        
        % Visualization:
        posHandle   = [];
        rangeHandle = [];
    end
    
    %% Constructor
    methods
        function [self] = GroundStation(celestialBody,position,varargin)
            % Setup checks for inputs:
            validBody     = @(x) isa(x,'CelestialBody');
            validPosition = @(x) isnumeric(x) && all(size(x) == [3,1]);
            validScalar   = @(x) isnumeric(x) && numel(x) == 1;
            
            % Parse the inputs:
            p = inputParser;
                addRequired(p,'celestialBody',validBody);
                addRequired(p,'position',validPosition);
                addOptional(p,'Frequency',nan,validScalar);
                addOptional(p,'RangeNoise',0,validScalar);
                addOptional(p,'DopplerNoise',0,validScalar);
                addOptional(p,'AngleNoise',0,validScalar);
            parse(p,celestialBody,position,varargin{:});
            
            % Store the inputs:
            self.celestialBody = p.Results.celestialBody;
            self.position_body = p.Results.position;
            self.frequency     = p.Results.Frequency;
            self.rangeNoise    = p.Results.RangeNoise;
            self.dopplerNoise  = p.Results.DopplerNoise;
        end
    end
    
    %% Public Methods
    methods (Access = public)
        function [] = update(self)
            self.position_frame = self.celestialBody.attitude.rotmat'*self.position_body;
        end
        
        function [range_meas,avail] = range(self,vehicle)            
            % Check if the satellite is inview:
            avail = true;
            [ray,range] = normc(vehicle.position - self.position_frame);
            intersects = self.celestialBody.simpleModel.rayCast(self.position_frame,ray);
            
            if any(any(~isnan(intersects)))
                avail = false;
                range = nan;
            end
            
            range_meas = range + self.rangeNoise*randn;
        end
        
        function [frequency_meas,avail] = doppler(self,vehicle)
            assert(~isnan(self.frequency),'No assigned to this ground station.  Doppler shift cannot be calculated');
            
            % Check if the satellite is inview:
            ray = normc(vehicle.position - self.position_frame);
            intersects = self.celestialBody.simpleModel.rayCast(self.position_frame,ray);
            
            if any(any(~isnan(intersects)))
                avail = false;
                frequency_meas = nan;
            else
                % Velocity of the ground station:
                vel = cross(self.celestialBody.angularRate,self.position_frame);

                % Relative velocity projected along the line-of-sight:
                v_rel = vehicle.velocity - vel;
                range_rate = scalarProjection(v_rel,ray);

                % Calculate the doppler shift:
                frequency_meas = (1 + range_rate/299792458)*self.frequency;
                avail = true;
            end
            
            frequency_meas = frequency_meas + self.dopplerNoise*randn;
        end
        
        function [] = angleOfArrival(self,vehicle)
            
        end
    end
    
    %% Public Visualization Methods:
    methods (Access = public)
        function [] = draw(self,varargin)
            % Convert position from celestial body fixed frame to overall
            % reference frame
            if isempty(self.posHandle)
                self.posHandle = plot3(self.position_frame(1),...
                                       self.position_frame(2),...
                                       self.position_frame(3),varargin{:});
            else
                try
                    set(self.posHandle,'XData',self.position_frame(1),...
                                       'YData',self.position_frame(2),...
                                       'ZData',self.position_frame(3));
                catch
                    self.posHandle = plot3(self.position_frame(1),...
                                           self.position_frame(2),...
                                           self.position_frame(3),varargin{:});
                end
            end
            
        end
        
        function [] = drawLink(self,vehicle,varargin)            
            % Check if the satellite is inview:
            [ray,mag] = normc(vehicle.position - self.position_frame);
            intersects = self.celestialBody.simpleModel.rayCast(self.position_frame,ray);
            if any(any(~isnan(intersects)))
                ray = nan(size(ray));
            end
            
            XData = self.position_frame(1)+[0 mag*ray(1)];
            YData = self.position_frame(2)+[0 mag*ray(2)];
            ZData = self.position_frame(3)+[0 mag*ray(3)];
            if isempty(self.rangeHandle)
                self.rangeHandle = plot3(XData,YData,ZData,varargin{:});
            else
                try
                    set(self.rangeHandle,'XData',XData,'YData',YData,'ZData',ZData);
                catch
                    self.rangeHandle = plot3(XData,YData,ZData,varargin{:});
                end
            end
        end
    end
end 
``` 
 
***

*Generated on 04-Mar-2021 00:02:13 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
