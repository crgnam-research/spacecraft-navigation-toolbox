classdef Landmarks < handle
    properties
        parent_object
        
        body_locs (3,:) 
        body_normals (3,:)
        inertial_locs (3,:)
        
        observed (1,:) logical % boolean aray for if landmark has ever been observed
        labels (1,:)
    end
    
    methods
        function [self] = Landmarks(parent_object,body_locs,body_normals)
            assert(isa(parent_object,'CelestialBody') ||...
                   isa(parent_object,'Spacecraft'),...
                   'The input parent_object must be of type CelestialBody or Spacecraft');
            self.parent_object = parent_object;
            self.body_locs = body_locs;
            self.body_normals = body_normals;
            
            % Create a set of labels to identify each landmark:
            self.labels = 1:size(self.body_normals,2);
            
            % Calculate the inertial locations of the landmarks:
            self.inertial_locs = self.parent_object.attitude'*self.body_locs;
        end
    end
end