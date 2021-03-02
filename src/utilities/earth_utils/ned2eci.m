% INCLUDECODE>{true}
function [v_eci] = ned2eci(v_ned, lat, lon, eci2ecef) %# codegen
    % NED -> ECEF rotation matrix
    cosl = cosd(lon);
    sinl = sind(lon);
    cosp = cosd(lat);
    sinp = sind(lat);
    A = [-sinp*cosl -sinl  -cosp*cosl;
         -sinp*sinl  cosl  -cosp*sinl;
            cosp      0      -sinp];

    % NED -> ECEF -> ECI rotation
    v_eci = eci2ecef'*A*v_ned;
end
