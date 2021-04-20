classdef Landmarks < handle
    properties
        parent_object
        
        body_locs (3,:) 
        body_normals (3,:)
        inertial_normals (3,:)
        inertial_locs (3,:)
        
        max_view_angle
        
        visible (1,:) logical % boolean array for the currently visible landmarks
        observed (1,:) logical % boolean aray for if landmark has ever been observed
        labels (1,:)
        new_detections (1,:) logical 
        
        % Visualization
        vis
    end
    
    methods
        function [self] = Landmarks(parent_object,body_locs,body_normals,max_view_angle)
            assert(isa(parent_object,'CelestialBody') ||...
                   isa(parent_object,'Spacecraft'),...
                   'The input parent_object must be of type CelestialBody or Spacecraft');
            self.parent_object = parent_object;
            self.body_locs = body_locs;
            self.body_normals = body_normals;
            self.max_view_angle = max_view_angle;
            
            % Create a set of labels to identify each landmark:
            self.labels = nan(1,size(self.body_normals,2));
            
            % Calculate the inertial locations of the landmarks:
            self.inertial_locs = self.parent_object.inert2self'*self.body_locs;
            
            % Set initial values:
            self.visible  = false(size(self.labels));
            self.observed = false(size(self.labels));
            self.new_detections = false(size(self.labels));
            
            % Initialize empty struct for visualization handles:
            self.vis = [];
        end
        
        function [] = updateInertial(self)
            % Rotate:
            self.inertial_normals = self.parent_object.inert2self'*self.body_normals;
            self.inertial_locs    = self.parent_object.inert2self'*self.body_locs;
        end
        
        function [] = determineVisible(self,sun,camera)       
            % Update:
            self.updateInertial();
            
            % Detect points that are pointed towards the camera:
            inert2camera = camera.getAttitude();
            cameraNorms = inert2camera*self.inertial_normals;
            inview = cameraNorms(3,:)>0;
            
            % Detect points which meet with viewing angle requirement:
            rays   = normc(self.inertial_locs - camera.getPosition());
            angled = acos(sum(rays.*-self.inertial_normals,1)) < self.max_view_angle;
            
            % Detect points that are illuminated:
            dir_sgn = sum(sun.position.*self.inertial_normals,1);
            illuminated = dir_sgn>0;
            
            % Determine which landmarks are in the camera field of view:
            [~,in_fov] = camera.projectPoints(self.inertial_locs);
            
            % Select only points that are in FOV, illuminated, and visible:
            self.visible = inview & angled & illuminated & in_fov;
            
            % Check if any of the visible targets are a new detection:
            obs_prev = self.observed;
            obs_new  = self.observed | self.visible;
            obs_sum  = obs_new + obs_prev;
            
            % Previously seen lmks will = 2, while new will = 1
            self.new_detections = obs_sum == 1;
            
            % Assign the new labels:
            if any(self.new_detections)
                
                if isnan(max(self.labels))
                    new_labels = 1:sum(self.new_detections);
                else
                    new_labels = max(self.labels) + (1:sum(self.new_detections));
                end
                self.labels(self.new_detections) = new_labels;
            end
            
            % Store for future:
            self.observed = obs_new;
        end            
    end
    
    %% Public Visualization Methods:
    methods (Access = public)
        function [] = reset(self)
            self.vis = [];
        end
        
        function [] = draw(self,varargin)
            
            % Update all of the landmark inertial locations:
            self.updateInertial();
        
            % Draw the new plot:
            if isempty(self.vis)
                self.vis{1} = plot3(self.inertial_locs(1,self.visible),...
                                    self.inertial_locs(2,self.visible),...
                                    self.inertial_locs(3,self.visible),'.g',varargin{:}); hold on
                self.vis{2} = plot3(self.inertial_locs(1,~self.visible & self.observed),...
                                    self.inertial_locs(2,~self.visible & self.observed),...
                                    self.inertial_locs(3,~self.visible & self.observed),'.b',varargin{:});
                self.vis{3} = plot3(self.inertial_locs(1,~self.visible & ~self.observed),...
                                    self.inertial_locs(2,~self.visible & ~self.observed),...
                                    self.inertial_locs(3,~self.visible & ~self.observed),'.r',varargin{:});
            else
                if isempty(self.vis{1})
                    self.vis{1} = plot3(self.inertial_locs(1,self.visible),...
                                        self.inertial_locs(2,self.visible),...
                                        self.inertial_locs(3,self.visible),'.g',varargin{:}); hold on
                else
                    try
                        set(self.vis{1},'XData',self.inertial_locs(1,self.visible),...
                                        'YData',self.inertial_locs(2,self.visible),...
                                        'ZData',self.inertial_locs(3,self.visible)); hold on
                    catch
                        error('');
                        return
                    end
                end
                if isempty(self.vis{2})
                    self.vis{2} = plot3(self.inertial_locs(1,~self.visible & self.observed),...
                                        self.inertial_locs(2,~self.visible & self.observed),...
                                        self.inertial_locs(3,~self.visible & self.observed),'.b',varargin{:});
                else
                    set(self.vis{2},'XData',self.inertial_locs(1,~self.visible & self.observed),...
                                    'YData',self.inertial_locs(2,~self.visible & self.observed),...
                                    'ZData',self.inertial_locs(3,~self.visible & self.observed));
                end
                set(self.vis{3},'XData',self.inertial_locs(1,~self.visible & ~self.observed),...
                                'YData',self.inertial_locs(2,~self.visible & ~self.observed),...
                                'ZData',self.inertial_locs(3,~self.visible & ~self.observed));
            end
        end
    end
end