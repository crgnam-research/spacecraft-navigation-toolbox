classdef Camera < handle
    %@code{true}
    properties
        parent_object

        parent2self Attitude % Rotation from the parent_object to the camera frame
        position_on_parent (3,1) % Position in the parent_object frame
        
        K (3,4) 
        sensor struct
        noise double
        
        % Visualizaiton:
        vis
    end
   
    methods 
        function [self] = Camera(parent_object,parent2camera,position_on_parent,K,sensor,noise)
            % TODO: Once Lander/Rover are completed, add those:
            % TODO: Add option to have camera not be attached to an object
            assert(isa(parent_object,'Spacecraft'),...
                  'The input parent_object must be of type Spacecraft');
            self.parent_object = parent_object;
            self.parent2self = parent2camera;
            self.position_on_parent = position_on_parent;
            self.K = K;
            self.sensor = sensor;
            self.noise  = noise;
            
            % Initialize empty struct for visualization handles:
            self.vis.view = [];
            self.vis.rays = [];
        end
    end
   
    methods (Access = public)
        function [pixel_pts,in_fov] = projectPoints(self, world_pts)
            if size(world_pts,1) ~= 3
                world_pts = world_pts';
            end
            
            % Transform world points into camera frame:
            inert2self = self.getAttitude();
            origin = self.getPosition();
            camera_pts = inert2self*(world_pts - origin);

            % Calculate homogeneous coordinates:
            homogeneous = self.K*[camera_pts; ones(1,size(camera_pts,2))];

            % Normalize the points into focal length coordinates
            image_pts(1,:) = homogeneous(1,:)./homogeneous(3,:);
            image_pts(2,:) = homogeneous(2,:)./homogeneous(3,:);
            
            % Convert from meters to pixel coordinates:
            pixel_pts(1,:) = -image_pts(1,:)*self.sensor.resolution(1)/self.sensor.size(1);
            pixel_pts(2,:) = -image_pts(2,:)*self.sensor.resolution(2)/self.sensor.size(2);
            
            % Add in the measurement noise:
            pixel_pts = pixel_pts + self.noise*randn(size(pixel_pts));

            % Reject points which do not fall on the sensor, or which are behind
            % the camera
            remove1 = abs(image_pts(1,:)) > self.sensor.resolution(1);
            remove2 = abs(image_pts(2,:)) > self.sensor.resolution(2);
            remove3 = homogeneous(3,:) > 0;
            
            remove = (remove1 | remove2 | remove3);

            % Pass out indices of the visible features:
            in_fov = ~remove;
        end
        
        % Generate rays which can be traced out from the camera
        function [rays] = generateRays(self,pixel_pts)
            % Convert pixels to image points:
            image_pts(1,:) = pixel_pts(1,:)*self.sensor.size(1)/self.sensor.resolution(1);
            image_pts(2,:) = pixel_pts(2,:)*self.sensor.size(2)/self.sensor.resolution(2);
            
            raysCamFrame = [image_pts; -self.K(1,1)*ones(1,size(image_pts,2))];
            inert2self = getAttitude(self);
            rays = normc(inert2self'*raysCamFrame);
        end
        
        % Get the overall position of the camera in inertial space:
        function [position] = getPosition(self)
            position = self.parent_object.position + self.parent_object.inert2self'*self.position_on_parent;
        end
        
        % Get the overall attitude of the camera in inertial space:
        function [inert2self] = getAttitude(self)
            inert2self = self.parent_object.inert2self*self.parent2self;
        end
    end
    
    %% Public Methods for visualization:
    methods (Access = public)
        function [] = reset(self)
            self.vis.view = [];
            self.vis.rays = [];
        end
        
        function [] = draw(self,scale,varargin)
            inert2self = self.getAttitude();
            origin     = self.getPosition()';
            
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
            if isempty(self.vis.view)
                self.vis.view(1) = patch('Faces',faces1,'Vertices',verts,varargin{:}); hold on
                self.vis.view(2) = patch('Faces',faces2,'Vertices',verts,varargin{:});
                self.vis.view(3) = patch('Faces',faces3,'Vertices',verts,varargin{:});
                axis equal
                rotate3d on
            else
                try
                    set(self.vis.view(1),'Vertices',verts);
                    set(self.vis.view(2),'Vertices',verts);
                    set(self.vis.view(3),'Vertices',verts);
                catch
                   self.reset(); 
                end
            end
        end
        
        function [] = drawRays(self, scale, pixel_pts, varargin)
            
            rays   = self.generateRays(pixel_pts);
            origin = repmat(self.getPosition(),size(rays,2));
            
            if isempty(self.vis.rays)
                self.vis.rays = quiver3(origin(1,:),origin(2,:),origin(3,:),...
                                        rays(1,:),rays(2,:),rays(3,:),scale,varargin{:});
            else
%                 set(vis.rays,
            end
        end
    end
end