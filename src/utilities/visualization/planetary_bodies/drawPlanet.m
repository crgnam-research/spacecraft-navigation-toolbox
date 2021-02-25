function [h] = drawPlanet(planet_name,varargin)
    hold on
    switch lower(planet_name)
        case 'mercury'
            radius = 2439; %(km)
            texture_file = 'mercury.jpg';
        case 'venus'
            radius = 6052; %(km)
            texture_file = 'venus.jpg';
        case 'earth'
            radius = 6371; %(km)
            texture_file = 'earth.jpg';
        case 'mars'
            radius = 3397; %(km)
            texture_file = 'mars.jpg';
        case 'jupiter'
            radius = 71492; %(km)
            texture_file = 'jupiter.jpg';
        case 'saturn'
            radius = 60268; %(km)
            texture_file = 'saturn.jpg';
        case 'uranus'
            radius = 25559; %(km)
            texture_file = 'uranus.jpg';
        case 'neptune'
            radius = 24766; %(km)
            texture_file = 'neptune.jpg';
    end
    
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
    EarthTexture = flip(imread(texture_file),1);
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