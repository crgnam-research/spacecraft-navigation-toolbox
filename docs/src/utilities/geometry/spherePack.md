[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [geometry](index.html) \> spherePack.m

</div>

# spherePack

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
**Get a padded range of x,y,z values to use:**
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**function \[spheres\] = spherePack(faces,vertices,radius)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
 Get a padded range of x,y,z values to use:
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

This function is called by:

-   [ShapeModel](ShapeModel.html){.code}

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 function [spheres] = spherePack(faces,vertices,radius)
    0002     % Get a padded range of x,y,z values to use:
    0003     xyz_max = max(vertices)+radius;
    0004     xyz_min = min(vertices)-radius;
    0005     
    0006     % Generate the lattice:
    0007     Ax = xyz_min(1):2*radius:xyz_max(1);
    0008     Ay = xyz_min(2):(radius*sqrt(3)):xyz_max(2);
    0009     Az = xyz_min(3):(radius*2*sqrt(6)/3):xyz_max(3);
    0010     [X,Y,Z] = meshgrid(Ax,Ay,Az);
    0011     X(2:2:end,:) = X(2:2:end,:) + radius;
    0012     X(:,:,2:2:end) = X(:,:,2:2:end) + radius;
    0013     Y(:,:,2:2:end) = Y(:,:,2:2:end) + radius*sqrt(3)/3;
    0014     
    0015     % Vectorize the lattice:
    0016     X = X(:);
    0017     Y = Y(:);
    0018     Z = Z(:);
    0019     
    0020     % Check which cubes are inside the defined polygon:
    0021     in = inpolyhedron(faces,vertices, [X,Y,Z]);
    0022     
    0023     % Rescale and retest to find the shell:
    0024     scale = (max(max(vertices))-4*radius)/max(max(vertices));
    0025     in2   = inpolyhedron(faces,scale*vertices, [X,Y,Z]);
    0026     shell = ~(in&in2);
    0027     
    0028     spheres = [X(in),Y(in),Z(in),radius*ones(sum(in),1), shell(in)];
    0029 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
