classdef CelestialBody < handle
    properties
        display_model % This model is used for visualizations
%         simple_model  % This model is used for computations
        
        % States:
        frame2body
        body2frame
%         position COMING SOON?
        
        % Physical Properties:
        rotation_model
        gravity_field
        atmosphere
        magnetic_field
        
        % Properties looking ahead:
        reference_frame = 'inertial'; % DEFAULT FOR NOW
        
        % Visualization:
        vis_handle = [];
        body_pts
        
        % SPICE kernels: COMING SOON
    end
    
    %% Constructor
    methods
        function [self] = CelestialBody(rotation_model,gravity_field,varargin)
            % Parse the optional inputs:
            p = inputParser;
                addOptional(p,'DisplayModel',[]);
                addOptional(p,'SimpleModel',[]);
                addOptional(p,'InitialOrientation',[]);
                addOptional(p,'InitialPosition',[]);
                addOptional(p,'Atmosphere',[]);
                addOptional(p,'MagneticField',[]);
            parse(p,varargin{:});
            
            % Store the results:
            self.frame2body = p.Results.InitialOrientation;
%             self.position = position;
            self.rotation_model = rotation_model;
%             self.reference_frame = reference_frame;
            self.gravity_field = gravity_field;
            self.display_model = p.Results.DisplayModel;
%             self.simple_model = p.Results.SimpleModel;
            self.atmosphere = p.Results.Atmosphere;
            self.magnetic_field = p.Results.MagneticField;
        end
    end
    
    %% Public Methods
    methods (Access = public)
        function [] = update(self,time)
            self.frame2body = self.rotation_model(self.frame2body,time);
            self.body2frame = self.frame2body';
        end
    end
    
    %% Public Visualization Methods:
    methods (Access = public)
        function [] = draw(self)
            if isempty(self.vis_handle)
                % Create the initial object:
                if isempty(self.display_model)
                    error('No was given when this object was created')
                else
                    self.vis_handle = self.display_model();
                    self.body_pts = [self.vis_handle.XData(:)';
                                     self.vis_handle.YData(:)';
                                     self.vis_handle.ZData(:)'];
                end
            end
            frame_pts = self.body2frame*self.body_pts;
            dim = sqrt(size(frame_pts,2));
            XData = reshape(frame_pts(1,:),dim,dim);
            YData = reshape(frame_pts(2,:),dim,dim);
            ZData = reshape(frame_pts(3,:),dim,dim);
            
            % Update figure for current orientation:
            set(self.vis_handle,'XData',XData,'YData',YData,'ZData',ZData);
        end
    end
end