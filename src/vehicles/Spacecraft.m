classdef Spacecraft < handle
    properties
        % States of the spacecraft:
        position
        velocity
        attitude
        angularRate
        
        displayModel % This model is used for visualizations
        simpleModel  % This model is used for computations
        
        % visualization stuff:
        plottedTraj = false;
        trajHandle
    end
    
    %% Constructor
    methods (Access = public)
        function [self] = Spacecraft(r,v,varargin)
            % Setup checks for inputs:
            validPosition  = @(x) isnumeric(x) && all(size(x) == [3,1]);
            validVelocity  = @(x) isnumeric(x) && all(size(x) == [3,1]);
            validAttitude  = @(x) isa(x,'Attitude');
            validAngRate   = @(x) isnumeric(x) && all(size(x) == [3,1]);
            
            % Parse the optional inputs:
            p = inputParser;
                addRequired(p,'r',validPosition);
                addRequired(p,'v',validVelocity);
                addOptional(p,'Attitude',Attitude('rotmat',eye(3)),validAttitude)
                addOptional(p,'AngularRate',zeros(3,1),validAngRate);
                addOptional(p,'DisplayModel',[]);
                addOptional(p,'SimpleModel',[]);
            parse(p,r,v,varargin{:});
            
            % Store the results:
            self.position     = p.Results.r;
            self.velocity     = p.Results.v;
            self.attitude     = p.Results.Attitude;
            self.displayModel = p.Results.DisplayModel;
            self.simpleModel  = p.Results.SimpleModel;
        end
    end
    
    %% Public Methods
    methods (Access = public)
        % Propagate the spacecraft forward in time:
        function [self] = propagateOrbit(self,dt,varargin)
            X = rk4(@self.cowell,dt,[self.position;self.velocity],varargin{:});
            self.position = X(1:3);
            self.velocity = X(4:6);
        end
        
        % Cowell's method for orbit propagation:
        function [dX] = cowell(self,~,X,varargin)
            accel = zeros(3,1);
            for ii = 1:length(varargin)
                accel = accel + varargin{ii}.getAccel(X,self.attitude,self.simpleModel);
            end
            dX = [X(4:6); accel];
        end
    end
    
    %% Public Methods for Visualizations
    methods (Access = public)       
        % Draw the trajectory history of the spacecraft:
        function [self] = drawTraj(self,varargin)
            if ~self.plottedTraj
                self.trajHandle = plot3(self.position(1),...
                                        self.position(2),....
                                        self.position(3),...
                                        varargin{:}); hold on
                self.plottedTraj = true;
            else
                set(self.trajHandle,'XDAta',[self.trajHandle.XData,self.position(1)],...
                                    'YData',[self.trajHandle.YData,self.position(2)],...
                                    'ZData',[self.trajHandle.ZData,self.position(3)])
            end
        end
    end
end