[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [geometry](index.md) \> ShapeModel.m



# ShapeModel

## Purpose 

``` 
```

## Overview 

``` 
**This is a script file.**
```

## Description 

```
 

```

## Cross-Reference Information 

This function calls:

   [ShapeModel](ShapeModel.md)
   [cubePack](cubePack.md "function [cubes] = cubePack(faces,vertices,dimension)")
    Get a padded range of x,y,z values to use:
   [spherePack](spherePack.md "function [spheres] = spherePack(faces,vertices,radius)")
    Get a padded range of x,y,z values to use:

This function is called by:

   [ShapeModel](ShapeModel.md)

## Sub-functions 

   [function \[self\] = ShapeModel(filename,varargin)](#_sub1)
   [function \[spheres\] = packSpheres(self,radius)](#_sub2)
   [function \[cubes\] = packCubes(self,dimension)](#_sub3)
   [function \[h\] = draw(self,varargin)](#_sub4)

## Source Code 

```
    0001 classdef ShapeModel < handle
    0002     properties
    0003         faces
    0004         vertices
    0005         
    0006         mass
    0007         inertia
    0008     end
    0009     
    0010     %% Constructor
    0011     methods
    0012         function [self] = ShapeModel(filename,varargin)
    0013             % Setup checks for inputs:
    0014             validFile = @(x) exist(filename,'file');
    0015             validNum  = @(x) isnumeric(x) && numel(x)==1;
    0016             validMat  = @(x) isnumeric(x) && all(size(x) == [3,3]);
    0017             % Parse the inputs:
    0018             p = inputParser;
    0019                 addRequired(p,'filename',validFile);
    0020                 addOptional(p,'Mass',[],validNum);
    0021                 addOptional(p,'Inertia',[],validMat);
    0022             parse(p,filename,varargin{:});
    0023             
    0024             % Check if the file is a .obj or .ply
    0025             [~,~,ext] = fileparts(filename);
    0026             switch lower(ext)
    0027                 case '.obj'
    0028                     obj = readObj(filename);
    0029                     self.faces    = obj.f.v;
    0030                     self.vertices = obj.v;
    0031                 case '.ply'
    0032                     error('NOT YET IMPLEMENTED')
    0033                 otherwise
    0034                     error('Input file must be a valid .OBJ or .PLY file')
    0035             end
    0036             
    0037             % Store results:
    0038             self.mass    = p.Results.Mass;
    0039             self.inertia = p.Results.Inertia;
    0040         end
    0041     end
    0042     
    0043     %% Public Methods
    0044     methods (Access = public)
    0045         function [spheres] = packSpheres(self,radius)
    0046             spheres = spherePack(self.faces,self.vertices,radius);
    0047             if ~isempty(self.mass)
    0048                 N = size(spheres,1);
    0049                 spheres = [spheres, (self.mass/N)*ones(N,1)];
    0050             end
    0051         end
    0052         
    0053         function [cubes] = packCubes(self,dimension)
    0054             cubes = cubePack(self.faces,self.vertices,dimension); 
    0055             if ~isempty(self.mass)
    0056                 N = size(cubes,1);
    0057                 cubes = [cubes, (self.mass/N)*ones(N,1)];
    0058             end
    0059         end
    0060     end
    0061     
    0062     %% Public Visualization Methods:
    0063     methods (Access = public)
    0064         function [h] = draw(self,varargin)
    0065            h = patch('Faces',self.faces,'Vertices',self.vertices,varargin{:}); 
    0066         end
    0067     end
    0068     
    0069 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005