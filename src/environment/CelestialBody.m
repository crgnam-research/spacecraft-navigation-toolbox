classdef CelestialBody < handle
    properties
        displayModel % This model is used for visualizations
        simpleModel  % This model is used for computations
        
        % States:
        position % Position of the celestial body with respect to the reference frame origin
        attitude % Rotation from the reference frame to this celestial body frame
        angularRate % Rotation rate about the body axes
        
        % Physical Properties:
        gravityField
        atmosphere
        magneticField
        
        % Visualization:
        vis_handle = [];
        body_pts
    end
    
    %% Constructor
    methods
        function [self] = CelestialBody(gravityField,varargin)
            % Setup checks for inputs:
            validGravField  = @(x) isa(x,'GravityField');
            validAtmos      = @(x) isa(x,'Atmosphere');
            validMagField   = @(x) isa(x,'MagneticField');
            validPosition   = @(x) isnumeric(x) && all(size(x) == [3,1]);
            validAttitude   = @(x) isa(x,'Attitude');
            validAngRate    = @(x) isnumeric(x) && all(size(x) == [3,1]);
            
            % Parse the inputs:
            p = inputParser;
                addRequired(p,'gravityField',validGravField);
                addOptional(p,'Atmosphere',[],validAtmos);
                addOptional(p,'MagneticField',[],validMagField);
                addOptional(p,'Position',[0;0;0],validPosition);
                addOptional(p,'Attitude',Attitude('rotmat',eye(3)),validAttitude);
                addOptional(p,'AngularRate',[0;0;0],validAngRate);
                addOptional(p,'DisplayModel',[]);
                addOptional(p,'SimpleModel',[]);
            parse(p,gravityField,varargin{:});
            
            % Store the results:
            self.gravityField  = p.Results.gravityField;
            self.atmosphere    = p.Results.Atmosphere;
            self.magneticField = p.Results.MagneticField;
            self.attitude      = p.Results.Attitude;
            self.position      = p.Results.Position;
            self.angularRate   = p.Results.AngularRate;
            self.displayModel  = p.Results.DisplayModel;
            self.simpleModel   = p.Results.SimpleModel;
        end
    end
    
    %% Public Methods
    methods (Access = public)
        % Function to get the acceleration this object imparts on a
        % spacecraft:
        function [accel] = getAccel(self,X,attitude,simpleModel,varargin)            
            % Calculate the relative position:
            r_rel = X(1:3) - self.position;
            
            % Get acceleration due to the gravity:
            accel = self.gravityField.acceleration(r_rel,self.attitude.rotmat,varargin{:});
            
            % Get acceleration due to atmospheric drag:
            if ~isempty(simpleModel) && ~isempty(self.atmosphere)
                % TODO: Calculate drag for this vehicle with attitude
                % dependence
            end
        end
        
        % Function to update the attitude of this body:
        function [] = updateAttitude(self,new_attitude)
            assert(isa(new_attitude,'Attitude'),'Input must be a valid Attitude')
            self.attitude = new_attitude;
        end
        
        % Function to update the angular rate of this body:
        function [] = updateAngularRate(self,new_angRate)
            self.angularRate = new_angRate;
        end
        
        % Function to update the position of this body:
        function [] = updatePosition(self,new_position)
            self.position = new_position;
        end
    end
    
    %% Public Visualization Methods:
    methods (Access = public)
        function [] = draw(self)
            if isempty(self.vis_handle)
                % Create the initial object:
                if isempty(self.displayModel)
                    error('No was given when this object was created')
                else
                    self.vis_handle = self.displayModel();
                    self.body_pts = [self.vis_handle.XData(:)';
                                     self.vis_handle.YData(:)';
                                     self.vis_handle.ZData(:)'];
                end
            end
            frame_pts = self.attitude.rotmat'*self.body_pts;
            dim = sqrt(size(frame_pts,2));
            XData = reshape(frame_pts(1,:),dim,dim);
            YData = reshape(frame_pts(2,:),dim,dim);
            ZData = reshape(frame_pts(3,:),dim,dim);
            
            % Update figure for current orientation:
            set(self.vis_handle,'XData',XData,'YData',YData,'ZData',ZData);
        end
    end
end