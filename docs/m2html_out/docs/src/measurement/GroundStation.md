[Home](../../../../index.md) \> [..](#) \> [src](#) \>
[measurement](index.md) \> GroundStation.m



# GroundStation

## Purpose 

``` 
```

## Overview 

``` 
**This is a script file.**
```

## Description 

```
 

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

   [GroundStation](GroundStation.md)

This function is called by:

   [GroundStation](GroundStation.md)

## Sub-functions 

   [function \[self\] =
    GroundStation(celestialBody,position,varargin)](#_sub1)
   [function \[\] = update(self)](#_sub2)
   [function \[range_meas,avail\] = range(self,vehicle)](#_sub3)
   [function \[frequency_meas,avail\] =
    doppler(self,vehicle)](#_sub4)
   [function \[\] = angleOfArrival(self,vehicle)](#_sub5)
   [function \[\] = draw(self,varargin)](#_sub6)
   [function \[\] = drawLink(self,vehicle,varargin)](#_sub7)

## Source Code 

```
    0001 classdef GroundStation < handle
    0002     properties
    0003         celestialBody % The celestial body the station is location on
    0004         
    0005         position_body  %(m) The locaiton of the station in the celestial body frame
    0006         position_frame %(m) The location of the station in the overall frame
    0007         
    0008         frequency %(Hz) The center frequency that the station is communicating at
    0009         
    0010         rangeNoise   %(m) Standard deviation of a range measurement
    0011         dopplerNoise %(Hz) Standard deviation of a doppler measurement
    0012         
    0013         % Visualization:
    0014         posHandle   = [];
    0015         rangeHandle = [];
    0016     end
    0017     
    0018     %% Constructor
    0019     methods
    0020         function [self] = GroundStation(celestialBody,position,varargin)
    0021             % Setup checks for inputs:
    0022             validBody     = @(x) isa(x,'CelestialBody');
    0023             validPosition = @(x) isnumeric(x) && all(size(x) == [3,1]);
    0024             validScalar   = @(x) isnumeric(x) && numel(x) == 1;
    0025             
    0026             % Parse the inputs:
    0027             p = inputParser;
    0028                 addRequired(p,'celestialBody',validBody);
    0029                 addRequired(p,'position',validPosition);
    0030                 addOptional(p,'Frequency',nan,validScalar);
    0031                 addOptional(p,'RangeNoise',0,validScalar);
    0032                 addOptional(p,'DopplerNoise',0,validScalar);
    0033                 addOptional(p,'AngleNoise',0,validScalar);
    0034             parse(p,celestialBody,position,varargin{:});
    0035             
    0036             % Store the inputs:
    0037             self.celestialBody = p.Results.celestialBody;
    0038             self.position_body = p.Results.position;
    0039             self.frequency     = p.Results.Frequency;
    0040             self.rangeNoise    = p.Results.RangeNoise;
    0041             self.dopplerNoise  = p.Results.DopplerNoise;
    0042         end
    0043     end
    0044     
    0045     %% Public Methods
    0046     methods (Access = public)
    0047         function [] = update(self)
    0048             self.position_frame = self.celestialBody.attitude.rotmat'*self.position_body;
    0049         end
    0050         
    0051         function [range_meas,avail] = range(self,vehicle)            
    0052             % Check if the satellite is inview:
    0053             avail = true;
    0054             [ray,range] = normc(vehicle.position  self.position_frame);
    0055             intersects = self.celestialBody.simpleModel.rayCast(self.position_frame,ray);
    0056             
    0057             if any(any(~isnan(intersects)))
    0058                 avail = false;
    0059                 range = nan;
    0060             end
    0061             
    0062             range_meas = range + self.rangeNoise*randn;
    0063         end
    0064         
    0065         function [frequency_meas,avail] = doppler(self,vehicle)
    0066             assert(~isnan(self.frequency),'No assigned to this ground station.  Doppler shift cannot be calculated');
    0067             
    0068             % Check if the satellite is inview:
    0069             ray = normc(vehicle.position  self.position_frame);
    0070             intersects = self.celestialBody.simpleModel.rayCast(self.position_frame,ray);
    0071             
    0072             if any(any(~isnan(intersects)))
    0073                 avail = false;
    0074                 frequency_meas = nan;
    0075             else
    0076                 % Velocity of the ground station:
    0077                 vel = cross(self.celestialBody.angularRate,self.position_frame);
    0078 
    0079                 % Relative velocity projected along the lineofsight:
    0080                 v_rel = vehicle.velocity  vel;
    0081                 range_rate = scalarProjection(v_rel,ray);
    0082 
    0083                 % Calculate the doppler shift:
    0084                 frequency_meas = (1 + range_rate/299792458)*self.frequency;
    0085                 avail = true;
    0086             end
    0087             
    0088             frequency_meas = frequency_meas + self.dopplerNoise*randn;
    0089         end
    0090         
    0091         function [] = angleOfArrival(self,vehicle)
    0092             
    0093         end
    0094     end
    0095     
    0096     %% Public Visualization Methods:
    0097     methods (Access = public)
    0098         function [] = draw(self,varargin)
    0099             % Convert position from celestial body fixed frame to overall
    0100             % reference frame
    0101             if isempty(self.posHandle)
    0102                 self.posHandle = plot3(self.position_frame(1),...
    0103                                        self.position_frame(2),...
    0104                                        self.position_frame(3),varargin{:});
    0105             else
    0106                 try
    0107                     set(self.posHandle,'XData',self.position_frame(1),...
    0108                                        'YData',self.position_frame(2),...
    0109                                        'ZData',self.position_frame(3));
    0110                 catch
    0111                     self.posHandle = plot3(self.position_frame(1),...
    0112                                            self.position_frame(2),...
    0113                                            self.position_frame(3),varargin{:});
    0114                 end
    0115             end
    0116             
    0117         end
    0118         
    0119         function [] = drawLink(self,vehicle,varargin)            
    0120             % Check if the satellite is inview:
    0121             [ray,mag] = normc(vehicle.position  self.position_frame);
    0122             intersects = self.celestialBody.simpleModel.rayCast(self.position_frame,ray);
    0123             if any(any(~isnan(intersects)))
    0124                 ray = nan(size(ray));
    0125             end
    0126             
    0127             XData = self.position_frame(1)+[0 mag*ray(1)];
    0128             YData = self.position_frame(2)+[0 mag*ray(2)];
    0129             ZData = self.position_frame(3)+[0 mag*ray(3)];
    0130             if isempty(self.rangeHandle)
    0131                 self.rangeHandle = plot3(XData,YData,ZData,varargin{:});
    0132             else
    0133                 try
    0134                     set(self.rangeHandle,'XData',XData,'YData',YData,'ZData',ZData);
    0135                 catch
    0136                     self.rangeHandle = plot3(XData,YData,ZData,varargin{:});
    0137                 end
    0138             end
    0139         end
    0140     end
    0141 end
```



Generated on Sat 27Feb2021 18:22:26 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005