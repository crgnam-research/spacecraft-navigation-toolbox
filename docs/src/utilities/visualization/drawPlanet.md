[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [visualization](visualization_index.md)  


# function: drawPlanet



**Inputs:** radius, planet_name, varargin

**Outputs:** h

 ***

## Sub-Functions

*No Sub-Functions*

 ***

## Detailed Description



 ***

## Sub-Function Descriptions

*No Sub-Functions*

 
 *** 

# Source Code:

 ```matlab 
 function [h] = drawPlanet(radius,planet_name,varargin)
    %@code{true}
    % Read the custom inputs:
    p = inputParser;
        addOptional(p,'Scale',1);
        addOptional(p,'AmbientStrength',0.3);
        addOptional(p,'DiffuseStrength',0.6);
        addOptional(p,'SpecularStrength',0.9);
        addOptional(p,'SpecularExponent',10);
        addOptional(p,'BackFaceLighting','reverselit');
        
    parse(p,varargin{:});

    % Generate the spherical shape of the planet:
    [X,Y,Z] = sphere(60);
    R = radius*p.Results.Scale;
    
    % Load in the texture and create the object:
    EarthTexture = flip(imread([planet_name,'.jpg']),1);
    h = surface(R*X,R*Y,R*Z,EarthTexture,...
                'FaceColor','texturemap','EdgeColor','none');
    hold on
    axis equal
    rotate3d on
    
    % Apply the custom inputs:
    h.AmbientStrength  = p.Results.AmbientStrength;
    h.DiffuseStrength  = p.Results.DiffuseStrength;
    h.SpecularStrength = p.Results.SpecularStrength;
    h.SpecularExponent = p.Results.SpecularExponent;
    h.BackFaceLighting = p.Results.BackFaceLighting;
end 
``` 
 
***

*Generated on 04-Mar-2021 00:23:48 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
