[Home](../../../../index.md) \> [..](#) \> [src](#) \>
[vehicles](index.md) \> Spacecraft.m



# Spacecraft

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

   [Spacecraft](Spacecraft.md)

This function is called by:

   [Spacecraft](Spacecraft.md)

## Sub-functions 

   [function \[self\] = Spacecraft(r,v,tspan,varargin)](#_sub1)
   [function \[self\] =
    propagateOrbit(self,dt,varargin)](#_sub2)
   [function \[dX\] = cowell(self,\~,X,varargin)](#_sub3)
   [function \[\] = log(self,ii)](#_sub4)
   [function \[self\] = draw(self,varargin)](#_sub5)
   [function \[self\] = drawTraj(self,varargin)](#_sub6)

## Source Code 

```
    0001 classdef Spacecraft < handle
    0002     properties
    0003         % States of the spacecraft:
    0004         position
    0005         velocity
    0006         attitude
    0007         angularRate
    0008         
    0009         displayModel % This model is used for visualizations
    0010         simpleModel  % This model is used for computations
    0011         
    0012         integrator
    0013         
    0014         % visualization stuff:
    0015         plottedTraj = false;
    0016         plotted = false;
    0017         trajHandle
    0018         plotHandle
    0019         
    0020         % Logs:
    0021         position_log
    0022         velocity_log
    0023         attitude_log
    0024         angularRate_log
    0025     end
    0026     
    0027     %% Constructor
    0028     methods (Access = public)
    0029         function [self] = Spacecraft(r,v,tspan,varargin)
    0030             % Setup checks for inputs:
    0031             validPosition  = @(x) isnumeric(x) && all(size(x) == [3,1]);
    0032             validVelocity  = @(x) isnumeric(x) && all(size(x) == [3,1]);
    0033             validAttitude  = @(x) isa(x,'Attitude');
    0034             validAngRate   = @(x) isnumeric(x) && all(size(x) == [3,1]);
    0035             
    0036             expectedIntegrators = {'rk4','ode45'};
    0037             validIntegrator = @(x) any(validatestring(x,expectedIntegrators));
    0038             
    0039             % Parse the inputs:
    0040             p = inputParser;
    0041                 addRequired(p,'r',validPosition);
    0042                 addRequired(p,'v',validVelocity);
    0043                 addOptional(p,'Attitude',Attitude('rotmat',eye(3)),validAttitude)
    0044                 addOptional(p,'AngularRate',zeros(3,1),validAngRate);
    0045                 addOptional(p,'DisplayModel',[]);
    0046                 addOptional(p,'SimpleModel',[]);
    0047                 addOptional(p,'Integrator','rk4',validIntegrator);
    0048             parse(p,r,v,varargin{:});
    0049             
    0050             % Store the results:
    0051             self.position     = p.Results.r;
    0052             self.velocity     = p.Results.v;
    0053             self.attitude     = p.Results.Attitude;
    0054             self.angularRate  = p.Results.AngularRate;
    0055             self.displayModel = p.Results.DisplayModel;
    0056             self.simpleModel  = p.Results.SimpleModel;
    0057             self.integrator   = p.Results.Integrator;
    0058             
    0059             % Preallocate Logs:
    0060             L = length(tspan);
    0061             self.position_log = zeros(3,L);
    0062             self.velocity_log = zeros(3,L);
    0063             self.attitude_log = zeros(4,L);
    0064             self.angularRate_log = zeros(3,L);
    0065             
    0066             % Initial log values:
    0067             self.position_log(:,1) = self.position;
    0068             self.velocity_log(:,1) = self.velocity;
    0069             self.attitude_log(:,1) = self.attitude.quat;
    0070             self.angularRate_log(:,1) = self.angularRate;
    0071         end
    0072     end
    0073     
    0074     %% Public Methods
    0075     methods (Access = public)
    0076         % Propagate the spacecraft forward in time:
    0077         function [self] = propagateOrbit(self,dt,varargin)
    0078             % Integrate using the correct integrator:
    0079             X = [self.position;self.velocity];
    0080             switch self.integrator
    0081                 case 'rk4'
    0082                     X = rk4(@self.cowell,dt,X,varargin{:});
    0083                 case 'ode45'
    0084                     [~,X] = ode45(@(t,y) self.cowell(t,y,varargin{:}),[0 dt],X);
    0085                     X = X(end,:)';
    0086             end
    0087             
    0088             % Store the resuts:
    0089             self.position = X(1:3);
    0090             self.velocity = X(4:6);
    0091         end
    0092         
    0093         % Cowell's method for orbit propagation:
    0094         function [dX] = cowell(self,~,X,varargin)
    0095             accel = zeros(3,1);
    0096             for ii = 1:length(varargin)
    0097                 accel = accel + varargin{ii}.getAccel(X,self.attitude,self.simpleModel);
    0098             end
    0099             dX = [X(4:6); accel];
    0100         end
    0101         
    0102         % Log data for a given timestep:
    0103         function [] = log(self,ii)
    0104             self.position_log(:,ii) = self.position;
    0105             self.velocity_log(:,ii) = self.velocity;
    0106             self.attitude_log(:,ii) = self.attitude.quat;
    0107             self.angularRate_log(:,ii) = self.angularRate;
    0108         end
    0109     end
    0110     
    0111     %% Public Methods for Visualizations
    0112     methods (Access = public)       
    0113         function [self] = draw(self,varargin)
    0114             if ~self.plotted
    0115                 self.plotHandle = plot3(self.position(1),...
    0116                                         self.position(2),...
    0117                                         self.position(3), varargin{:});
    0118                 self.plotted = true;
    0119             else
    0120                 try
    0121                     set(self.plotHandle,'XData',self.position(1),...
    0122                                         'YData',self.position(2),...
    0123                                         'ZData',self.position(3))
    0124                 catch
    0125                     self.plotHandle = plot3(self.position(1),...
    0126                                             self.position(2),...
    0127                                             self.position(3), varargin{:});
    0128                 end
    0129             end
    0130         end
    0131         
    0132         % Draw the trajectory history of the spacecraft:
    0133         function [self] = drawTraj(self,varargin)
    0134             if ~self.plottedTraj
    0135                 self.trajHandle = plot3(self.position(1),...
    0136                                         self.position(2),....
    0137                                         self.position(3),...
    0138                                         varargin{:}); hold on
    0139                 self.plottedTraj = true;
    0140             else
    0141                 try
    0142                     set(self.trajHandle,'XDAta',[self.trajHandle.XData,self.position(1)],...
    0143                                         'YData',[self.trajHandle.YData,self.position(2)],...
    0144                                         'ZData',[self.trajHandle.ZData,self.position(3)])
    0145                 catch
    0146                     self.trajHandle = plot3(self.position(1),...
    0147                                             self.position(2),....
    0148                                             self.position(3),...
    0149                                             varargin{:}); hold on
    0150                 end
    0151             end
    0152         end
    0153     end
    0154 end
```



Generated on Sat 27Feb2021 18:22:26 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005