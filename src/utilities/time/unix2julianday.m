% INCLUDECODE>{true}
function [jd] = unix2julianday(unix)
    jd = unix/86400 + 2440587.5;
end