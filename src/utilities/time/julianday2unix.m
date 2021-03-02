% INCLUDECODE>{true}
function [unix] = julianday2unix(jd)
    unix = (jd - 2440587.5)*86400;
end