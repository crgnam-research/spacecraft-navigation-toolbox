% INCLUDECODE>{true}
function r = wgs842ecef(lla)
    a = 6378.1370;          % Radius at the Equator
    b = 6356.7523142;       % Radius at the Pole
    f = (a - b)/a;
    e = sqrt(f*(2 - f));
    N = a/sqrt(1 - e^2*sind(lla(1))^2);
    r = [(N + lla(3))*cosd(lla(1))*cosd(lla(2));...
         (N + lla(3))*cosd(lla(1))*sind(lla(2));...
         (N*(1 - e^2) + lla(3))*sind(lla(1))];
end
