function lla = eci2wgs84(r, eci2ecef)
    %@code{true}
    p = eci2ecef*r;

    % convert ECEF to geodetic
    lla = ecef2wgs84(p);
end