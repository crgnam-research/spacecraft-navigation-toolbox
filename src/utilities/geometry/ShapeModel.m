% INCLUDECODE>{true}
classdef ShapeModel < handle
    properties
        faces
        vertices
        
        mass
        inertia
    end
    
    %% Constructor
    methods
        function [self] = ShapeModel(filename,varargin)
            % Setup checks for inputs:
            validFile = @(x) exist(filename,'file');
            validNum  = @(x) isnumeric(x) && numel(x)==1;
            validMat  = @(x) isnumeric(x) && all(size(x) == [3,3]);
            % Parse the inputs:
            p = inputParser;
                addRequired(p,'filename',validFile);
                addOptional(p,'Mass',[],validNum);
                addOptional(p,'Inertia',[],validMat);
            parse(p,filename,varargin{:});
            
            % Check if the file is a .obj or .ply
            [~,~,ext] = fileparts(filename);
            switch lower(ext)
                case '.obj'
                    obj = readObj(filename);
                    self.faces    = obj.f.v;
                    self.vertices = obj.v;
                case '.ply'
                    error('NOT YET IMPLEMENTED')
                otherwise
                    error('Input file must be a valid .OBJ or .PLY file')
            end
            
            % Store results:
            self.mass    = p.Results.Mass;
            self.inertia = p.Results.Inertia;
        end
    end
    
    %% Public Methods
    methods (Access = public)
        function [spheres] = packSpheres(self,radius)
            spheres = spherePack(self.faces,self.vertices,radius);
            if ~isempty(self.mass)
                N = size(spheres,1);
                spheres = [spheres, (self.mass/N)*ones(N,1)];
            end
        end
        
        function [cubes] = packCubes(self,dimension)
            cubes = cubePack(self.faces,self.vertices,dimension); 
            if ~isempty(self.mass)
                N = size(cubes,1);
                cubes = [cubes, (self.mass/N)*ones(N,1)];
            end
        end
    end
    
    %% Public Visualization Methods:
    methods (Access = public)
        function [h] = draw(self,varargin)
           h = patch('Faces',self.faces,'Vertices',self.vertices,varargin{:}); 
        end
    end
    
end