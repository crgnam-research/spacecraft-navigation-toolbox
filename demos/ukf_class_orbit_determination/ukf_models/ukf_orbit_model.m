function [X_next] = ukf_orbit_model(dt,X,varargin)
    X_next = rk4(@eqOfMotion,dt,X,varargin{:});
end

function [dX] = eqOfMotion(~,X,earth_attitude,gravityField)
    % Extract the orbital states:
    r = X(1:3);
    v = X(4:6);
    
    % Calculate the acceleration due to gravity:
    a = gravityField.acceleration(r,earth_attitude.rotmat);
    
    % Extract the rotation states:
    az = X(7);
    el = X(8);
    w  = X(9);
    [x,y,z] = sph2cart(az,el,1);
    rotation_axis = [x;y;z];
    
    % Calculate the rotation of the estimated landmarks:
    
    
    % Form the differential state:
    dX = [v; a; 0;0;0; dlmk_x; dlmk_y; dlmk_z];
end