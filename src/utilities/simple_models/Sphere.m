classdef Sphere < handle
    %@code{true}
    properties
        position
        radius
    end
    
    %% Constructor
    methods
        function [self] = Sphere(position,radius)
            self.position = position;
            self.radius   = radius;
        end
    end
    
    %% Public Methods:
    methods (Access = public)
        function [intersects] = rayCast(self,origins,rays)
            intersects = intersectLineSphere([origins', rays'],...
                                             [self.position', self.radius]);
            
            % Check if intersects happened in direction of ray cast
            if any(any(~isnan(intersects)))
                rays_to_intersects = normc(intersects' - origins);
                dot_prod = sum(rays_to_intersects.*rays,1);
                intersects(dot_prod<0,:) = nan;
            end
        end
    end
end