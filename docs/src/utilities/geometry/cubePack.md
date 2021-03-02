[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [geometry](geometry_index.md)  

 
 # function: cubePack



**Inputs:** faces, vertices, dimension

**Outputs:** cubes

 ***

## Sub-Functions

*No Sub-Functions*

[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Sub-Function Descriptions

*No Sub-Functions*

 
 *** 

 # Source Code:

 ```matlab 
 % INCLUDECODE>{true}
function [cubes] = cubePack(faces,vertices,dimension)
    % Get a padded range of x,y,z values to use:
    xyz_max = max(vertices)+dimension;
    xyz_min = min(vertices)-dimension;
    
    % Generate grid of cubes:
    gridX = xyz_min(1):dimension:xyz_max(1);
    gridY = xyz_min(2):dimension:xyz_max(2);
    gridZ = xyz_min(3):dimension:xyz_max(3);
    [X,Y,Z] = meshgrid(gridX,gridY,gridZ);
    X = X(:);
    Y = Y(:);
    Z = Z(:);
    
    % Check which cubes are inside the defined polygon:
    in = inpolyhedron(faces,vertices, [X,Y,Z]);
    
    % Rescale and retest to find the shell:
    scale = (max(max(vertices))-2*dimension)/max(max(vertices));
    in2   = inpolyhedron(faces,scale*vertices, [X,Y,Z]);
    shell = ~(in&in2);
    
    % Generate the output cubes:
    cubes = [X(in),Y(in),Z(in),dimension*ones(sum(in),1), shell(in)];
end 
 ``` 
  
 ***

*Generated on 02-Mar-2021 00:52:50 by [m2md](https://github.com/crgnam-research/m2md) © 2021*