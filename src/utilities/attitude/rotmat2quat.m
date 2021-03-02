% INCLUDECODE>{true}
function q = rotmat2quat(rotmat)
    q4 = 0.5*sqrt(1+trace(rotmat));
    q1 = 1/(4*q4)*(rotmat(2,3)-rotmat(3,2));
    q2 = 1/(4*q4)*(rotmat(3,1)-rotmat(1,3));
    q3 = 1/(4*q4)*(rotmat(1,2)-rotmat(2,1));
    q = [q1;q2;q3;q4];
end

