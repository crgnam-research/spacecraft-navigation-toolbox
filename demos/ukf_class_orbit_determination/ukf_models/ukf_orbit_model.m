function [X_next] = ukf_orbit_model(dt,X,varargin)
    X_next = rk4(@eqOfMotion,dt,X,varargin{:});
end

function [dX] = eqOfMotion(~,X,earth_attitude,gravityField)
    r = X(1:3);
    v = X(4:6);
    a = gravityField.acceleration(r,earth_attitude.rotmat);
    dX = [v; a];
end