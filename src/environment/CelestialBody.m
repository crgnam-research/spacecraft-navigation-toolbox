classdef CelestialBody < handle
    %@code{true}
    properties
        shapeModel % This model is used for visualizations
        simpleModel  % This model is used for computations
        
        % States:
        position % Position of the celestial body with respect to the reference frame origin
        attitude % Rotation from the reference frame to this celestial body frame
        angularRate % Rotation rate about the body axes
        
        % Physical Properties:
        mu
        gravityField GravityField
        atmosphere
        magneticField
        
        % Visualization:
        vis
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
                addOptional(p,'ShapeModel',[]);
                addOptional(p,'SimpleModel',[]);
            parse(p,gravityField,varargin{:});
            
            % Store the results:
            self.gravityField  = p.Results.gravityField;
            self.mu            = self.gravityField.mu;
            self.atmosphere    = p.Results.Atmosphere;
            self.magneticField = p.Results.MagneticField;
            self.attitude      = p.Results.Attitude;
            self.position      = p.Results.Position;
            self.angularRate   = p.Results.AngularRate;
            self.shapeModel    = p.Results.ShapeModel;
            self.simpleModel   = p.Results.SimpleModel;
        end
    end
    
    %% Public Methods
    methods (Access = public)
        % Function to get the acceleration this object imparts on a
        % spacecraft:
        function [accel] = getAccel(self,X,spacecraftModel,varargin)            
            % Calculate the relative position:
            r_rel = X(1:3) - self.position;
            
            % Get acceleration due to the gravity:
            accel = self.gravityField.acceleration(r_rel,self.attitude.rotmat,varargin{:});
            
            % Get acceleration due to atmospheric drag:
            if ~isempty(spacecraftModel) && ~isempty(self.atmosphere)
                % TODO: Calculate drag for this vehicle with attitude
                % dependence
            end
        end
        
        % Function to update the attitude of this body:
        function [] = updateAttitude(self,new_attitude)
            assert(isa(new_attitude,'Attitude'),'Input must be a valid Attitude')
            self.attitude = new_attitude;
        end
        
        % Function to update the position of this body:
        function [] = updatePosition(self,new_position)
            self.position = new_position;
        end
    end
    
    %% Public Visualization Methods:
    methods (Access = public)
        function [] = draw(self,varargin)
            self.shapeModel.draw(varargin{:});
        end
    end
end