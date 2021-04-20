classdef Sun < handle
    properties
        gravityField
        mu
        
        surface_flux
        
        position
        radius
        
        % Visualization:
        vis
    end
    
    methods
        function [self] = Sun(gravityField,surface_flux,varargin)
            p = inputParser;
                mu_sun = 1.32712440018*10^20;
                defaultGravField = GravityField('Point',mu_sun);
                validGravityField = @(x) isa(x,'GravityField');
                validVec = @(x) isnumeric(x) && all(size(x) == [3,1]);
                validNum = @(x) isnumeric(x) && numel(x) == 1;
                addParameter(p,'GravityField',defaultGravField,validGravityField)
                addParameter(p,'SurfaceFlux',63e6,validNum);
                addParameter(p,'Position',zeros(3,1),validVec);
                addParameter(p,'Radius',696.34e6,validNum);
            parse(p,gravityField,surface_flux,varargin{:});
            
            % Store the results:
            self.gravityField = p.Results.GravityField;
            self.surface_flux = p.Results.SurfaceFlux;
            self.position     = p.Results.Position;
            self.radius       = p.Results.Radius;
            self.mu           = self.gravityField.mu;
        end
        
        function [received_flux] = inverseSquare(self,r)
            received_flux = self.surface_flux*(self.radius/norm(r - self.position))^2;
        end
    end
    
    %% Public Visualization Methods
    methods (Access = public)
        function [] = draw(self)
            if isempty(self.vis)
                self.vis = light('position',self.position,'style','infinite');
            else
                if ~ishandle(self.vis)
                    self.vis = light('position',self.position,'style','infinite');
                end
            end
        end
    end
end