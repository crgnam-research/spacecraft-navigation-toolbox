classdef ShapeModel < handle
    %@code{true}
    properties
        faces
        vertices
        face_normals
        vertex_normals
        
        radii
        
        attitude Attitude
        
        mass
        CoM % Center of Mass relative to the center of geometry of the initiall provided points
        inertia
        
        % Visualization:
        vis
    end
    
    %% Constructor
    methods
        function [self] = ShapeModel(object,mass,varargin)
            % Setup checks for inputs:
            validNum  = @(x) isnumeric(x) && numel(x)==1;
            validVec  = @(x) isnumeric(x) && all(size(x) == [3,1]);
            validMat  = @(x) isnumeric(x) && all(size(x) == [3,3]);
            validAtt  = @(x) isa(x,'Attitude');
            
            % Parse the inputs:
            p = inputParser;
                addRequired(p,'mass',validNum);
                addParameter(p,'CoM',zeros(3,1),validVec);
                addParameter(p,'Inertia',[],validMat);
                addParameter(p,'Attitude',Attitude('rotmat',eye(3)),validAtt);
            parse(p,mass,varargin{:});
            
            % Check if an object file has been provided or a patch struct:
            is_file = false;
            if ischar(object)
                if exist(object,'file')
                    filename = object;
                    is_file = true;
                else
                    error(['Input object must be either a valid file path to a .OBJ or .PLY file,\n',...
                       'or it must be a valid struct containing both a faces and vertices field'])
                end
            elseif isa(object,'struct')
                assert(all(isfield(object,{'faces','vertices'})),...
                       'Input struct must have both a faces and vertices field')
                self.faces    = object.faces;
                self.vertices = object.vertices;
            else
                error(['Input object must be either a valid file path to a .OBJ or .PLY file,\n',...
                       'or it must be a valid struct containing both a faces and vertices field'])
            end
            
            if is_file
                % Check if the file is a .obj or .ply
                [~,~,ext] = fileparts(filename);
                switch lower(ext)
                    case '.obj'
                        obj = readObj(filename);
                        self.faces    = obj.f.v;
                        self.vertices = obj.v;
                        if all(size(obj.vn) == size(obj.f.v))
                            self.face_normals = obj.vn;
                        end
                    case '.ply'
                        error('NOT YET IMPLEMENTED')
                    otherwise
                        error('Input file must be a valid .OBJ or .PLY file')
                end
            else
                
            end
            
            % Store results:
            self.mass     = p.Results.mass;
            self.CoM      = p.Results.CoM;
            self.inertia  = p.Results.Inertia;
            self.attitude = p.Results.Attitude;
            
            % Apply the provided center of mass to the geometry:
            self.vertices = self.vertices - self.CoM';
            
            % Calculate a representative inertia tensor:
            if isempty(self.inertia)
                [~,self.radii] = normr(self.vertices);
                radius = mean(self.radii);
                self.inertia = (2/5)*self.mass*(radius^2)*eye(3);
            end
            
            % Calculate the vertex normals:
            self.calculateVertexNormals();
        end
    end
    
    %% Public Methods
    methods (Access = public)
        function [spheres] = packSpheres(self,radius)
            spheres = spherePack(self.faces,self.vertices,radius);
            if ~isempty(self.mass)
                N = size(spheres.locs,1);
                spheres.mass = (self.mass/N)*ones(N,1);
            end
        end
        
        function [cubes] = packCubes(self,dimension)
            cubes = cubePack(self.faces,self.vertices,dimension); 
            if ~isempty(self.mass)
                N = size(cubes.locs,1);
                cubes.ass = (self.mass/N)*ones(N,1);
            end
        end
        
        function [] = calculateCoM(self,varargin)
            p = inputParser;
                defaultSphere  = false;
                defaultCube    = false;
                defaultPolygon = false;
                defaultDim     = 10;
                validNum    = @(x) isnumeric(x) && numel(x) == 1;
                validOption = @(x) islogical(x) && numel(x) == 1;
                addParameter(p,'SpherePacking',defaultSphere,validOption);
                addParameter(p,'CubePacking',defaultCube,validOption);
                addParameter(p,'Polygon',defaultPolygon,validOption);
                addParameter(p,'Size',defaultDim,validNum);
            parse(p,varargin{:});
            if p.Results.SpherePacking
                assert(~p.Results.CubePacking && ~p.Results.Polygon,['You can only specify one of the following methods to use\n',...
                                                                     'SpherePacking | CubePacking | Polygon'])
                spheres = self.packSpheres(p.Results.Size);
                self.CoM(1) = sum(spheres.locs(:,1).*spheres.mass)./self.mass;
                self.CoM(2) = sum(spheres.locs(:,2).*spheres.mass)./self.mass;
                self.CoM(3) = sum(spheres.locs(:,3).*spheres.mass)./self.mass;
                
                % Apply the provided center of mass to the geometry:
                self.vertices = self.vertices - self.CoM';
            
            elseif p.Results.CubePacking
                assert(~p.Results.SpherePacking && ~p.Results.Polygon,['You can only specify one of the following methods to use\n',...
                                                                     'SpherePacking | CubePacking | Polygon'])
                error('NOT YET IMPLEMENTED')
            elseif p.Results.Polygon
                assert(~p.Results.CubePacking && ~p.Results.SpherePacking,['You can only specify one of the following methods to use\n',...
                                                                           'SpherePacking | CubePacking | Polygon'])
                error('NOTE YET IMPLEMENTED')
            else
                error(['One of the following methods must be set to true inorder to calculate the CoM\n',...
                       'SpherePacking | CubePacking | Polygon'])
            end
        end
        
        function [] = calculateInertia(self,varargin)
            p = inputParser;
                defaultSphere  = false;
                defaultCube    = false;
                defaultPolygon = false;
                defaultDim     = 10;
                validNum    = @(x) isnumeric(x) && numel(x) == 1;
                validOption = @(x) islogical(x) && numel(x) == 1;
                addParameter(p,'Sphere',false,validOption);
                addParameter(p,'SpherePacking',defaultSphere,validOption);
                addParameter(p,'CubePacking',defaultCube,validOption);
                addParameter(p,'Polygon',defaultPolygon,validOption);
                addParameter(p,'Radius',defaultDim,validNum);
                addParameter(p,'Size',defaultDim,validNum)
            parse(p,varargin{:});
            if p.Results.Sphere
                assert(~p.Results.SpherePacking && ~p.Results.CubePacking && ~p.Results.Polygon,...
                       ['You can only specify one of the following methods to use\n',...
                        'Sphere | SpherePacking | CubePacking | Polygon'])
                % Calculate a representative inertia tensor:
                [~,self.radii] = normr(self.vertices);
                radius = mean(self.radii);
                self.inertia = (2/5)*self.mass*(radius^2)*eye(3);
            
            elseif p.Results.SpherePacking
                assert(~p.Results.Sphere && ~p.Results.CubePacking && ~p.Results.Polygon,...
                       ['You can only specify one of the following methods to use\n',...
                        'Sphere | SpherePacking | CubePacking | Polygon'])
                spheres = self.packSpheres(p.Results.Size);
                r = spheres.radii;
                m = spheres.mass;
                [~,dz] = normr(spheres.locs(:,1:2)); % distance from z-axis
                [~,dy] = normr(spheres.locs(:,[1,3])); % distance from y-axis
                [~,dx] = normr(spheres.locs(:,2:3)); % distance from x-axis
                
                % Calcualte mass moment of inertia tensor:
                Ic = (2/5)*m.*(r.^2);
                Ixx = sum(Ic + m.*(dx.^2));
                Iyy = sum(Ic + m.*(dy.^2));
                Izz = sum(Ic + m.*(dz.^2));
                Ixy = sum(Ic - m.*(spheres.locs(:,1).*spheres.locs(:,2)));
                Ixz = sum(Ic - m.*(spheres.locs(:,1).*spheres.locs(:,3)));
                Iyz = sum(Ic - m.*(spheres.locs(:,2).*spheres.locs(:,3)));
                self.inertia = [Ixx Ixy Ixz;
                                Ixy Iyy Iyz;
                                Ixz Iyz Izz];
                
            elseif p.Results.CubePacking
                assert(~p.Results.Sphere && ~p.Results.SpherePacking && ~p.Results.Polygon,...
                       ['You can only specify one of the following methods to use\n',...
                        'Sphere | SpherePacking | CubePacking | Polygon'])
                error('NOT YET IMPLEMENTED')
                
            elseif p.Results.Polygon
                assert(~p.Results.Sphere && ~p.Results.SpherePacking && ~p.Results.CubePacking,...
                       ['You can only specify one of the following methods to use\n',...
                        'Sphere | SpherePacking | CubePacking | Polygon'])
                error('NOTE YET IMPLEMENTED')
                
            else
                error(['One of the following methods must be set to true inorder to calculate the CoM\n',...
                       'Sphere | SpherePacking | CubePacking | Polygon'])
            end
        end
        
        function [] = calculateVertexNormals(self)
            if isempty(self.face_normals)
                mesh_struct.faces = self.faces;
                mesh_struct.vertices = self.vertices;
                self.face_normals = COMPUTE_mesh_normals(mesh_struct);
            end
            self.vertex_normals = STLVertexNormals(self.faces, self.vertices, self.face_normals);
        end
        
        function [] = updateAttitude(self,attitude)
            self.attitude = attitude;
            self.vertices = (attitude*self.vertices')';
            self.vertex_normals = (attitude*self.vertex_normals')';
            self.face_normals = (attitude*self.face_normals')';
            self.inertia = attitude*diag(diag(self.inertia))*attitude';
        end
    end
    
    %% Public Visualization Methods:
    methods (Access = public)
        function [] = reset(self)
            self.vis = [];
        end
        
        function [] = draw(self,varargin)
            verts = (self.attitude*self.vertices')';
            if isempty(self.vis)
                self.vis.handle = patch('Faces',self.faces,'Vertices',verts,varargin{:});  hold on
            else
                set(self.vis.handle,'Vertices',verts);
            end
            axis equal
        end
        
        function [h] = drawVertexNormals(self,varargin)
            h = quiver3(self.vertices(:,1),self.vertices(:,2),self.vertices(:,3),...
                        self.vertex_normals(:,1),self.vertex_normals(:,2),self.vertex_normals(:,3),varargin{:}); hold on
            axis equal
        end
    end
    
end