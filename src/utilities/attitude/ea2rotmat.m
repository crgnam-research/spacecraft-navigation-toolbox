% INCLUDECODE>{true}
function [rotmat] = ea2rotmat(rot1,rot2,rot3,sequence)
    % INPUT IN DEGREES!!!
    
    % Parse input:
    if nargin == 3
        sequence = '321';
    end
    
    % Generate basic rotaiton matrices:
    T{1} = @(rot_x) [1       0             0;
                     0   cosd(rot_x)   sind(rot_x);
                     0  -sind(rot_x)   cosd(rot_x)];
    T{2} = @(rot_y) [cosd(rot_y)  0  -sind(rot_y);
                           0      1       0;
                     sind(rot_y)  0   cosd(rot_y)];
    T{3} = @(rot_z) [ cosd(rot_z)   sind(rot_z)  0;
                     -sind(rot_z)   cosd(rot_z)  0;
                              0           0      1];

    % Calculate overall rotation matrix:
    rotmat = T{str2double(sequence(3))}(rot3)*...
             T{str2double(sequence(2))}(rot2)*...
             T{str2double(sequence(1))}(rot1);
end