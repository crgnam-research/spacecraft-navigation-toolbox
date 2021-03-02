% INCLUDECODE>{true}
function [spheres] = spherePack(faces,vertices,radius)
    % Get a padded range of x,y,z values to use:
    xyz_max = max(vertices)+radius;
    xyz_min = min(vertices)-radius;
    
    % Generate the lattice:
    Ax = xyz_min(1):2*radius:xyz_max(1);
    Ay = xyz_min(2):(radius*sqrt(3)):xyz_max(2);
    Az = xyz_min(3):(radius*2*sqrt(6)/3):xyz_max(3);
    [X,Y,Z] = meshgrid(Ax,Ay,Az);
    X(2:2:end,:) = X(2:2:end,:) + radius;
    X(:,:,2:2:end) = X(:,:,2:2:end) + radius;
    Y(:,:,2:2:end) = Y(:,:,2:2:end) + radius*sqrt(3)/3;
    
    % Vectorize the lattice:
    X = X(:);
    Y = Y(:);
    Z = Z(:);
    
    % Check which cubes are inside the defined polygon:
    in = inpolyhedron(faces,vertices, [X,Y,Z]);
    
    % Rescale and retest to find the shell:
    scale = (max(max(vertices))-4*radius)/max(max(vertices));
    in2   = inpolyhedron(faces,scale*vertices, [X,Y,Z]);
    shell = ~(in&in2);
    
    spheres = [X(in),Y(in),Z(in),radius*ones(sum(in),1), shell(in)];
end