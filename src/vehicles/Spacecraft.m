classdef Spacecraft < handle
    %@code{true}
    properties
        % States of the spacecraft:
        position
        velocity
        inert2self Attitude % Rotation from inertial space to the body frame
        angularRate
        
        displayModel % This model is used for visualizations
        simpleModel  % This model is used for computations
        
        integrator
        
        % visualization stuff:
        plottedTraj = false;
        plotted = false;
        trajHandle
        plotHandle
        
        % Logs:
        position_log
        velocity_log
        attitude_log
        angularRate_log
    end
    
    %% Constructor
    methods (Access = public)
        function [self] = Spacecraft(r,v,tspan,varargin)
            % Setup checks for inputs:
            validPosition  = @(x) isnumeric(x) && all(size(x) == [3,1]);
            validVelocity  = @(x) isnumeric(x) && all(size(x) == [3,1]);
            validAttitude  = @(x) isa(x,'Attitude');
            validAngRate   = @(x) isnumeric(x) && all(size(x) == [3,1]);
            
            expectedIntegrators = {'rk4','ode45'};
            validIntegrator = @(x) any(validatestring(x,expectedIntegrators));
            
            % Parse the inputs:
            p = inputParser;
                addRequired(p,'r',validPosition);
                addRequired(p,'v',validVelocity);
                addOptional(p,'Attitude',Attitude('rotmat',eye(3)),validAttitude)
                addOptional(p,'AngularRate',zeros(3,1),validAngRate);
                addOptional(p,'DisplayModel',[]);
                addOptional(p,'SimpleModel',[]);
                addOptional(p,'Integrator','rk4',validIntegrator);
            parse(p,r,v,varargin{:});
            
            % Store the results:
            self.position     = p.Results.r;
            self.velocity     = p.Results.v;
            self.inert2self   = p.Results.Attitude;
            self.angularRate  = p.Results.AngularRate;
            self.displayModel = p.Results.DisplayModel;
            self.simpleModel  = p.Results.SimpleModel;
            self.integrator   = p.Results.Integrator;
            
            % Preallocate Logs:
            L = length(tspan);
            self.position_log = zeros(3,L);
            self.velocity_log = zeros(3,L);
            self.attitude_log = zeros(4,L);
            self.angularRate_log = zeros(3,L);
            
            % Initial log values:
            self.position_log(:,1) = self.position;
            self.velocity_log(:,1) = self.velocity;
            self.attitude_log(:,1) = self.inert2self.quat;
            self.angularRate_log(:,1) = self.angularRate;
        end
    end
    
    %% Public Methods
    methods (Access = public)
        % Propagate the spacecraft forward in time:
        function [self] = propagateOrbit(self,dt,varargin)
            % Integrate using the correct integrator:
            X = [self.position;self.velocity];
            switch self.integrator
                case 'rk4'
                    X = rk4(@self.cowell,dt,X,varargin{:});
                case 'ode45'
                    [~,X] = ode45(@(t,y) self.cowell(t,y,varargin{:}),[0 dt],X);
                    X = X(end,:)';
            end
            
            % Store the resuts:
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
        
        % Log data for a given timestep:
        function [] = log(self,ii)
            self.position_log(:,ii) = self.position;
            self.velocity_log(:,ii) = self.velocity;
            self.attitude_log(:,ii) = self.inert2self.quat;
            self.angularRate_log(:,ii) = self.angularRate;
        end
    end
    
    %% Public Methods for Visualizations
    methods (Access = public)       
        function [self] = draw(self,varargin)
            if ~self.plotted
                self.plotHandle = plot3(self.position(1),...
                                        self.position(2),...
                                        self.position(3), varargin{:});
                self.plotted = true;
            else
                try
                    set(self.plotHandle,'XData',self.position(1),...
                                        'YData',self.position(2),...
                                        'ZData',self.position(3))
                catch
                    self.plotHandle = plot3(self.position(1),...
                                            self.position(2),...
                                            self.position(3), varargin{:});
                end
            end
        end
        
        % Draw the trajectory history of the spacecraft:
        function [self] = drawTraj(self,varargin)
            if ~self.plottedTraj
                self.trajHandle = plot3(self.position(1),...
                                        self.position(2),....
                                        self.position(3),...
                                        varargin{:}); hold on
                self.plottedTraj = true;
            else
                try
                    set(self.trajHandle,'XDAta',[self.trajHandle.XData,self.position(1)],...
                                        'YData',[self.trajHandle.YData,self.position(2)],...
                                        'ZData',[self.trajHandle.ZData,self.position(3)])
                catch
                    self.trajHandle = plot3(self.position(1),...
                                            self.position(2),....
                                            self.position(3),...
                                            varargin{:}); hold on
                end
            end
        end
    end
end