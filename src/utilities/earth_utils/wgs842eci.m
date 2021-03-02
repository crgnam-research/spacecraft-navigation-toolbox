% INCLUDECODE>{true}
function r = wgs842eci(lla, eci2ecef) %# codegen
    % convert geodetic to ECEF
    p = geodetic2ecef(lla);

    r = eci2ecef'*p;
end
