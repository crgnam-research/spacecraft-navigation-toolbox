[]{#_top}

<div>

[Home](../../../../../index.html) \> [..](#) \> [src](#) \>
[utilities](#) \> [visualization](../index.html) \>
[planetary_bodies](index.html) \> drawPlanet.m

</div>

# drawPlanet

## []{#_name}PURPOSE [![\^](../../../../../up.png)](#_top)

::: {.box}
**Read the custom inputs:**
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../../up.png)](#_top)

::: {.box}
**function \[h\] = drawPlanet(radius,planet_name,varargin)**
:::

## []{#_description}DESCRIPTION [![\^](../../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
 Read the custom inputs:
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../../up.png)](#_top)

This function calls:

This function is called by:

## []{#_source}SOURCE CODE [![\^](../../../../../up.png)](#_top)

::: {.fragment}
    0001 function [h] = drawPlanet(radius,planet_name,varargin)
    0002     
    0003     
    0004     % Read the custom inputs:
    0005     p = inputParser;
    0006         addOptional(p,'Scale',1);
    0007         addOptional(p,'AmbientStrength',0.3);
    0008         addOptional(p,'DiffuseStrength',0.6);
    0009         addOptional(p,'SpecularStrength',0.9);
    0010         addOptional(p,'SpecularExponent',10);
    0011         addOptional(p,'BackFaceLighting','reverselit');
    0012         
    0013     parse(p,varargin{:});
    0014 
    0015     % Generate the spherical shape of the planet:
    0016     [X,Y,Z] = sphere(60);
    0017     R = radius*p.Results.Scale;
    0018     
    0019     % Load in the texture and create the object:
    0020     EarthTexture = flip(imread([planet_name,'.jpg']),1);
    0021     h = surface(R*X,R*Y,R*Z,EarthTexture,...
    0022                 'FaceColor','texturemap','EdgeColor','none');
    0023     hold on
    0024     axis equal
    0025     rotate3d on
    0026     
    0027     % Apply the custom inputs:
    0028     h.AmbientStrength  = p.Results.AmbientStrength;
    0029     h.DiffuseStrength  = p.Results.DiffuseStrength;
    0030     h.SpecularStrength = p.Results.SpecularStrength;
    0031     h.SpecularExponent = p.Results.SpecularExponent;
    0032     h.BackFaceLighting = p.Results.BackFaceLighting;
    0033 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
