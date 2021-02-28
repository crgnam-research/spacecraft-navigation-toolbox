[Home](../../../../../index.md) \> [..](#) \> [src](#) \> [utilities](#)
\> [geometry](index.md) \> cubePack.m



# cubePack

## Purpose 

``` 
**Get a padded range of x,y,z values to use:**
```

## Overview 

``` 
**function \[cubes\] = cubePack(faces,vertices,dimension)**
```

## Description 

```
 
 Get a padded range of x,y,z values to use:

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

   [ShapeModel](ShapeModel.md)

## Source Code 

```
    0001 function [cubes] = cubePack(faces,vertices,dimension)
    0002     % Get a padded range of x,y,z values to use:
    0003     xyz_max = max(vertices)+dimension;
    0004     xyz_min = min(vertices)dimension;
    0005     
    0006     % Generate grid of cubes:
    0007     gridX = xyz_min(1):dimension:xyz_max(1);
    0008     gridY = xyz_min(2):dimension:xyz_max(2);
    0009     gridZ = xyz_min(3):dimension:xyz_max(3);
    0010     [X,Y,Z] = meshgrid(gridX,gridY,gridZ);
    0011     X = X(:);
    0012     Y = Y(:);
    0013     Z = Z(:);
    0014 %     plot3(X,Y,Z,'.r'); axis equasl;
    0015     
    0016     % Check which cubes are inside the defined polygon:
    0017     in = inpolyhedron(faces,vertices, [X,Y,Z]);
    0018     
    0019     % Rescale and retest to find the shell:
    0020     scale = (max(max(vertices))2*dimension)/max(max(vertices));
    0021     in2   = inpolyhedron(faces,scale*vertices, [X,Y,Z]);
    0022     shell = ~(in&in2);
    0023     
    0024     % Generate the output cubes:
    0025     cubes = [X(in),Y(in),Z(in),dimension*ones(sum(in),1), shell(in)];
    0026 end
```



Generated on Sat 27Feb2021 18:22:26 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005