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
%     plot3(X,Y,Z,'.r'); axis equasl;
    
    % Check which cubes are inside the defined polygon:
    in = inpolyhedron(faces,vertices, [X,Y,Z]);
    
    % Rescale and retest to find the shell:
    scale = (max(max(vertices))-2*dimension)/max(max(vertices));
    in2   = inpolyhedron(faces,scale*vertices, [X,Y,Z]);
    shell = ~(in&in2);
    
    % Generate the output cubes:
    cubes = [X(in),Y(in),Z(in),dimension*ones(sum(in),1), shell(in)];
end