classdef Camera < handle
    %@code{true}
    properties
        parent_object

        parent2self Attitude % Rotation from the parent_object to the camera frame
        position (3,1) % Position in the parent_object frame
        
        K (3,4) 
        sensor struct
        
        % Visualizaiton:
        vis
    end
   
    methods 
        function [self] = Camera(parent_object,parent2camera,position,K,sensor)
            % TODO: Once Lander/Rover are completed, add those:
            assert(isa(parent_object,'Spacecraft'),...
                  'The input parent_object must be of type Spacecraft');
            self.parent_object = parent_object;
            self.parent2self = parent2camera;
            self.position    = position;
            self.K = K;
            self.sensor = sensor;
        end
    end
   
    methods (Access = public)
        function [pixel_pts,in_fov] = projectPoints(self, world_pts)
            if size(world_pts,1) ~= 3
                world_pts = world_pts';
            end
            
            % Transform world points into camera frame:
            inert2self = self.parent_object.inert2self*self.parent2self;
            origin = self.parent_object.position + self.parent_object.inert2self'*self.position;
            camera_pts = inert2self'*(world_pts - origin);

            % Calculate homogeneous coordinates:
            homogeneous = self.K*[camera_pts; ones(1,size(camera_pts,2))];

            % Normalize the points into focal length coordinates
            image_pts(1,:) = homogeneous(1,:)./homogeneous(3,:);
            image_pts(2,:) = homogeneous(2,:)./homogeneous(3,:);
         
            % Convert from focal length coordinates to meters:
            image_pts(1,:) = image_pts(1,:);
            image_pts(2,:) = image_pts(2,:);
            
            % Convert from meters to pixel coordinates:
            pixel_pts(1,:) = -image_pts(1,:)*self.sensor.resolution(1)/self.sensor.size(1);
            pixel_pts(2,:) = -image_pts(2,:)*self.sensor.resolution(2)/self.sensor.size(2);

            % Reject points which do not fall on the sensor, or which are behind
            % the camera
            remove1 = abs(image_pts(1,:)) > self.sensor.resolution(1);
            remove2 = abs(image_pts(2,:)) > self.sensor.resolution(2);
            remove3 = homogeneous(3,:) > 0;
            
            remove = (remove1 | remove2 | remove3);

            % Pass out indices of the visible features:
            in_fov = ~remove;
        end
    end
    
    %% Public Methods for visualization:
    methods (Access = public)
        function [] = draw(self,scale,varargin)
            inert2self = self.parent_object.inert2self*self.parent2self;
            origin = (self.parent_object.position + self.parent_object.inert2self'*self.position)';
            
            hx = (self.sensor.size(1)/2)/self.K(1,1);
            hy = (self.sensor.size(2)/2)/self.K(2,2);
            
            x = inert2self.rotmat(1,:)*hx;
            y = inert2self.rotmat(2,:)*hy;
            z = inert2self.rotmat(3,:);
            
            pt2 = scale*(-x + -y + -z) + origin;
            pt3 = scale*(-x +  y + -z) + origin;
            pt4 = scale*( x +  y + -z) + origin;
            pt5 = scale*( x + -y + -z) + origin;
            pt6 = scale*(-x +  y + -z) + scale*0.3*y + origin;
            pt7 = scale*( x +  y + -z) + scale*0.3*y + origin;
            pt8 = scale*( 0 +  y + -z) + scale*y + origin;
            
            verts = [origin; pt2; pt3; pt4; pt5; pt6; pt7; pt8];
            faces1 = [1 2 3; 1 3 4; 1 4 5; 1 5 2];
            faces2 = [2 3 4 5];
            faces3 = [6 7 8];
            if isempty(self.vis)
                self.vis.h1 = patch('Faces',faces1,'Vertices',verts,varargin{:}); hold on
                self.vis.h2 = patch('Faces',faces2,'Vertices',verts,varargin{:});
                self.vis.h3 = patch('Faces',faces3,'Vertices',verts,varargin{:});
            else
                set(self.vis.h1,'Vertices',verts);
                set(self.vis.h2,'Vertices',verts);
                set(self.vis.h3,'Vertices',verts);
            end
            axis equal
        end
    end
end