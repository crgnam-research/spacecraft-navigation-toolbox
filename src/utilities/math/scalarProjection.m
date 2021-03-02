% INCLUDECODE>{true}
function [scalar] = scalarProjection(a,b)
    scalar = dot(a,b/norm(b));
end