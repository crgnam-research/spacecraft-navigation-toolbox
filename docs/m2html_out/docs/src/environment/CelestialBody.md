[Home](../../../../index.md) \> [..](#) \> [src](#) \>
[environment](index.md) \> CelestialBody.m



# CelestialBody

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

   [CelestialBody](CelestialBody.md)

This function is called by:

   [CelestialBody](CelestialBody.md)

## Sub-functions 

   [function \[self\] =
    CelestialBody(gravityField,varargin)](#_sub1)
   [function \[accel\] =
    getAccel(self,X,attitude,simpleModel,varargin)](#_sub2)
   [function \[\] = updateAttitude(self,new_attitude)](#_sub3)
   [function \[\] = updateAngularRate(self,new_angRate)](#_sub4)
   [function \[\] = updatePosition(self,new_position)](#_sub5)
   [function \[\] = draw(self)](#_sub6)

## Source Code 

```
    0001 classdef CelestialBody < handle
    0002     properties
    0003         displayModel % This model is used for visualizations
    0004         simpleModel  % This model is used for computations
    0005         
    0006         % States:
    0007         position % Position of the celestial body with respect to the reference frame origin
    0008         attitude % Rotation from the reference frame to this celestial body frame
    0009         angularRate % Rotation rate about the body axes
    0010         
    0011         % Physical Properties:
    0012         gravityField
    0013         atmosphere
    0014         magneticField
    0015         
    0016         % Visualization:
    0017         vis_handle = [];
    0018         body_pts
    0019     end
    0020     
    0021     %% Constructor
    0022     methods
    0023         function [self] = CelestialBody(gravityField,varargin)
    0024             % Setup checks for inputs:
    0025             validGravField  = @(x) isa(x,'GravityField');
    0026             validAtmos      = @(x) isa(x,'Atmosphere');
    0027             validMagField   = @(x) isa(x,'MagneticField');
    0028             validPosition   = @(x) isnumeric(x) && all(size(x) == [3,1]);
    0029             validAttitude   = @(x) isa(x,'Attitude');
    0030             validAngRate    = @(x) isnumeric(x) && all(size(x) == [3,1]);
    0031             
    0032             % Parse the inputs:
    0033             p = inputParser;
    0034                 addRequired(p,'gravityField',validGravField);
    0035                 addOptional(p,'Atmosphere',[],validAtmos);
    0036                 addOptional(p,'MagneticField',[],validMagField);
    0037                 addOptional(p,'Position',[0;0;0],validPosition);
    0038                 addOptional(p,'Attitude',Attitude('rotmat',eye(3)),validAttitude);
    0039                 addOptional(p,'AngularRate',[0;0;0],validAngRate);
    0040                 addOptional(p,'DisplayModel',[]);
    0041                 addOptional(p,'SimpleModel',[]);
    0042             parse(p,gravityField,varargin{:});
    0043             
    0044             % Store the results:
    0045             self.gravityField  = p.Results.gravityField;
    0046             self.atmosphere    = p.Results.Atmosphere;
    0047             self.magneticField = p.Results.MagneticField;
    0048             self.attitude      = p.Results.Attitude;
    0049             self.position      = p.Results.Position;
    0050             self.angularRate   = p.Results.AngularRate;
    0051             self.displayModel  = p.Results.DisplayModel;
    0052             self.simpleModel   = p.Results.SimpleModel;
    0053         end
    0054     end
    0055     
    0056     %% Public Methods
    0057     methods (Access = public)
    0058         % Function to get the acceleration this object imparts on a
    0059         % spacecraft:
    0060         function [accel] = getAccel(self,X,attitude,simpleModel,varargin)            
    0061             % Calculate the relative position:
    0062             r_rel = X(1:3)  self.position;
    0063             
    0064             % Get acceleration due to the gravity:
    0065             accel = self.gravityField.acceleration(r_rel,self.attitude.rotmat,varargin{:});
    0066             
    0067             % Get acceleration due to atmospheric drag:
    0068             if ~isempty(simpleModel) && ~isempty(self.atmosphere)
    0069                 % TODO: Calculate drag for this vehicle with attitude
    0070                 % dependence
    0071             end
    0072         end
    0073         
    0074         % Function to update the attitude of this body:
    0075         function [] = updateAttitude(self,new_attitude)
    0076             assert(isa(new_attitude,'Attitude'),'Input must be a valid Attitude')
    0077             self.attitude = new_attitude;
    0078         end
    0079         
    0080         % Function to update the angular rate of this body:
    0081         function [] = updateAngularRate(self,new_angRate)
    0082             self.angularRate = new_angRate;
    0083         end
    0084         
    0085         % Function to update the position of this body:
    0086         function [] = updatePosition(self,new_position)
    0087             self.position = new_position;
    0088         end
    0089     end
    0090     
    0091     %% Public Visualization Methods:
    0092     methods (Access = public)
    0093         function [] = draw(self)
    0094             if isempty(self.vis_handle)
    0095                 % Create the initial object:
    0096                 if isempty(self.displayModel)
    0097                     error('No was given when this object was created')
    0098                 else
    0099                     self.vis_handle = self.displayModel();
    0100                     self.body_pts = [self.vis_handle.XData(:)';
    0101                                      self.vis_handle.YData(:)';
    0102                                      self.vis_handle.ZData(:)'];
    0103                 end
    0104             end
    0105             frame_pts = self.attitude.rotmat'*self.body_pts;
    0106             dim = sqrt(size(frame_pts,2));
    0107             XData = reshape(frame_pts(1,:),dim,dim);
    0108             YData = reshape(frame_pts(2,:),dim,dim);
    0109             ZData = reshape(frame_pts(3,:),dim,dim);
    0110             
    0111             % Update figure for current orientation:
    0112             set(self.vis_handle,'XData',XData,'YData',YData,'ZData',ZData);
    0113         end
    0114     end
    0115 end
```



Generated on Sat 27Feb2021 18:22:26 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005